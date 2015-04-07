module.exports = function(grunt) {
  grunt.initConfig({
    exec: {
      csslint: "csslint .",
      scss_lint: "scss-lint .",
      tidy: "find . -type d -name node_modules -prune -o -type f -name '*.html' \\( -exec tidy -qe {} \\; -o -print \\) 2>&1 | grep -v 'canvas>' | grep -v 'proprietary attribute'; true"
    }
  });

  grunt.loadNpmTasks("grunt-exec");

  grunt.registerTask("default", ["exec:csslint", "exec:scss_lint", "exec:tidy"]);
  grunt.registerTask("lint", ["exec:csslint", "exec:scss_lint", "exec:tidy"]);
  grunt.registerTask("csslint", ["exec:csslint"]);
  grunt.registerTask("scss_lint", ["exec:scss_lint"]);
  grunt.registerTask("tidy", ["exec:tidy"]);
};
