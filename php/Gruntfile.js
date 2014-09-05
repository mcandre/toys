module.exports = function(grunt) {
  grunt.initConfig({
    exec: {
      phplint: "for f in *.php; do php -l $f | grep -v 'No syntax errors detected'; done; exit 0",
      csslint: "csslint .",
      scss_lint: "scss-lint .",
      tidy: "find . -type d -name node_modules -prune -o -type f -name '*.html' -print -exec tidy -qe {} \\; 2>&1 | grep -v 'canvas>' | grep -v 'proprietary attribute'; true"
    }
  });

  grunt.loadNpmTasks("grunt-exec");

  grunt.registerTask("default", [
    "exec:phplint",
    "exec:csslint",
    "exec:scss_lint",
    "exec:tidy"
  ]);

  grunt.registerTask("lint", [
    "exec:phplint",
    "exec:csslint",
    "exec:scss_lint",
    "exec:tidy"
  ]);

  grunt.registerTask("phplint", ["exec:phplint"]);
  grunt.registerTask("csslint", ["exec:csslint"]);
  grunt.registerTask("scss_lint", ["exec:scss_lint"]);
  grunt.registerTask("tidy", ["exec:tidy"]);
};
