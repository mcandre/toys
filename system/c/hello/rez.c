#include <limits.h>
#if defined(__APPLE__)
#include <sys/syslimits.h>
#elif defined(_MSC_VER)
#include <windows.h>
#define PATH_MAX MAX_PATH
#endif

#if defined(_MSC_VER)
#include <fileapi.h>
#include <shellapi.h>
#pragma comment(lib, "shell32")
#else
#define _XOPEN_SOURCE 500
#define __USE_XOPEN_EXTENDED 1
#include <dirent.h>
#include <ftw.h>
#include <unistd.h>
#endif

#include <errno.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>

#if !defined(_MSC_VER)
static int remove_cb(const char *path, __attribute__ ((unused)) const struct stat *sb, __attribute__ ((unused)) int typeflag, __attribute__ ((unused)) struct FTW *ftwbuf) {
    errno = 0;
    int status = remove(path);

    if (status) {
        fprintf(stderr, "error: unable to remove path: %s\n", path);
    }

    return status;
}
#endif

static int remove_all(const char *path) {
    int status;

#if defined(_MSC_VER)
    const DWORD buf = GetFileAttributesA(path);

    if (buf == INVALID_FILE_ATTRIBUTES) {
        return EXIT_SUCCESS;
    }

    // Double null terminated per SHFileOperation requirements.
    char *paths = calloc(strlen(path) + 2, sizeof(char));
    strcpy(paths, path);

    SHFILEOPSTRUCT shfo = {
        NULL,
        FO_DELETE,
        paths,
        NULL,
        FOF_SILENT | FOF_NOERRORUI | FOF_NOCONFIRMATION,
        FALSE,
        NULL,
        NULL
    };
    status = SHFileOperationA(&shfo);
    free(paths);

    if (status) {
        fprintf(stderr, "error: unable to remove path: %s\n", path);
    }

    return status;
#else
    struct stat buf;

    errno = 0;
    status = stat(path, &buf);

    if (status == 0) {
        if (S_ISREG(buf.st_mode)) {
            errno = 0;
            status = remove(path);

            if (status) {
                fprintf(stderr, "error: unable to remove path: %s\n", path);
            }

            return status;
        }

        errno = 0;
        return nftw(path, remove_cb, 64, FTW_DEPTH | FTW_PHYS);
    }

    if (errno == ENOENT) {
        return EXIT_SUCCESS;
    }

    fprintf(stderr, "error: unable to query for path: %s\n", path);
    return EXIT_FAILURE;
#endif
}

static void remove_all_abortable(const char *path) {
    if (remove_all(path) != 0) {
        exit(EXIT_FAILURE);
    }
}

static int cmake_init() {
    return system("cmake .");
}

static int lint() {
    const int status = cmake_init();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --target lint");
}

static int build() {
    const int status = cmake_init();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --config Release");
}

static int safety() {
    const int status = cmake_init();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --target safety");
}

static int audit() {
    const int status = cmake_init();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --target audit");
}

static int doc() {
    const int status = cmake_init();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --target doc");
}

static int leaks() {
    const int status = build();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --target leaks");
}

static int install() {
    const int status = build();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --target install");
}

static int uninstall() {
    const int status = cmake_init();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("cmake --build . --target uninstall");
}

static int test() {
    const int status = install();

    if (status != EXIT_SUCCESS) {
        return status;
    }

    return system("hello");
}

static int clean_doc() {
    return remove_all("html");
}

static int clean_bin() {
    return remove_all("bin");
}

static int clean_junk_extensions(const char *path) {
    const char *junk_extensions[] = {
        ".dir",
        ".filters",
        ".obj",
        ".sln",
        ".vcxproj"
    };
    const size_t junk_extensions_sz = sizeof(junk_extensions)/sizeof(char*);
    const char *extension = strrchr(path, '.');

    if (extension) {
        for (size_t i = 0; i < junk_extensions_sz; i++) {
            if (extension && strcmp(extension, junk_extensions[i]) == 0) {
                int status = remove_all(path);

                if (status != 0) {
                    return status;
                }
            }
        }
    }

    return EXIT_SUCCESS;
}

static int clean_msvc() {
    remove_all_abortable("x64");
    remove_all_abortable("x86");

    errno = 0;
    char *cwd = malloc(sizeof(char) * PATH_MAX);
    if (!getcwd(cwd, PATH_MAX)) {
        fprintf(stderr, "error: unable to access current working directory\n");
        free(cwd);
        return EXIT_FAILURE;
    }

    int status;

#if defined(_MSC_VER)
    char *glob = calloc(strlen(cwd) + 4, sizeof(char));
    strcat(glob, cwd);
    strcat(glob, "\\*");

    WIN32_FIND_DATAA find_data;
    HANDLE find_handle = FindFirstFileA(glob, &find_data);

    if (find_handle == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "error: unable to traverse directory: %s\n", cwd);
        free(glob);
        free(cwd);
        return EXIT_FAILURE;
    }

    while (FindNextFileA(find_handle, &find_data) != 0) {
        status = clean_junk_extensions(find_data.cFileName);

        if (status) {
            free(glob);
            free(cwd);
            return status;
        }
    }

    free(glob);
#else
    errno = 0;
    DIR *d = opendir(cwd);

    if (!d) {
        fprintf(stderr, "error: unable to open directory: %s\n", cwd);
        free(cwd);
        return EXIT_FAILURE;
    }
    struct dirent *de;

    while(true) {
        errno = 0;
        de = readdir(d);

        if (errno) {
            fprintf(stderr, "error: unable to traverse directory: %s\n", cwd);
            free(cwd);
            return EXIT_FAILURE;
        }

        if (!de) {
            break;
        }

        const char *child = de->d_name;
        status = clean_junk_extensions(child);

        if (status) {
            free(cwd);
            return status;
        }
    }
#endif
    free(cwd);
    return EXIT_SUCCESS;
}

static int clean_cmake() {
    remove_all_abortable("install_manifest.txt");
    remove_all_abortable("Makefile");
    remove_all_abortable("CMakeFiles");
    remove_all_abortable("CMakeCache.txt");
    remove_all_abortable("cmake_install.cmake");
    remove_all_abortable("CTestTestfile.cmake");
    remove_all_abortable("Testing");
    return EXIT_SUCCESS;
}

static int clean() {
    clean_doc();
    clean_bin();
    clean_msvc();
    clean_cmake();
    return EXIT_SUCCESS;
}

int main(int argc, const char **argv) {
    if (argc == 0) {
        fprintf(stderr, "error: missing program name\n");
        return EXIT_FAILURE;
    }

    const char *task_names[] = {
        "clean",
        "clean_doc",
        "clean_bin",
        "clean_cmake",
        "clean_msvc",
        "cmake_init",
        "lint",
        "build",
        "safety",
        "audit",
        "doc",
        "leaks",
        "install",
        "test",
        "uninstall"
    };
    const size_t task_sz = sizeof(task_names)/sizeof(char*);
    int (*task_functions[])() = {
        &clean,
        &clean_doc,
        &clean_bin,
        &clean_cmake,
        &clean_msvc,
        &cmake_init,
        &lint,
        &build,
        &safety,
        &audit,
        &doc,
        &leaks,
        &install,
        &test,
        &uninstall
    };
    int (*default_task)() = test;

    if (argc == 1) {
        if (default_task()) {
            return EXIT_FAILURE;
        }

        return EXIT_SUCCESS;
    }

    if (strcmp(argv[1], "-l") == 0) {
        for (size_t i = 0; i < task_sz; i++) {
            printf("%s\n", task_names[i]);
        }

        return EXIT_SUCCESS;
    }

    for (int i = 1; i < argc; i++) {
        const char *arg = argv[i];
        bool found_task = false;

        for (size_t j = 0; j < task_sz; j++) {
            if (strcmp(arg, task_names[j]) == 0) {
                found_task = true;

                if (task_functions[j]()) {
                    return EXIT_FAILURE;
                }
            }
        }

        if (!found_task) {
            fprintf(stderr, "error: no such task: %s\n", arg);
            return EXIT_FAILURE;
        }
    }

    return EXIT_SUCCESS;
}
