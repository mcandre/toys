tildeExpandsTo := block(
    platform := System platform

    if(platform == "windows" or platform == "mingw",
        # Windows
        System getEnvironmentVariable("UserProfile"),

        # Unix
        System getEnvironmentVariable("HOME")
    )
)
