"use strict";

module.exports = function(grunt) {
  grunt.initConfig({
		exec: {
      jshint: "node_modules/jshint/bin/jshint .",
      jslint: "find . -type d -name node_modules -prune -o -type d -name bower_components -prune -o -type f -name '*[-.]min.js' -prune -o -type f -name '*.js' -exec node_modules/jslint/bin/jslint.js {} \\;",
      eslint: "node_modules/eslint/bin/eslint.js .",
      tidy: "find . -type d -name node_modules -prune -o -type f -name '*.html' -print -exec tidy -qe {} \\; 2>&1 | grep -v 'canvas>' | grep -v 'proprietary attribute'; true"
		}
  });

  grunt.loadNpmTasks("grunt-exec");

  grunt.registerTask("default", ["exec:jshint", "exec:tidy"]);
  grunt.registerTask("lint", [
    "exec:jshint",
    // Go to bed, Crockford
    // "exec:jslint",
    "exec:eslint",
    "exec:tidy"
  ]);

  grunt.registerTask("jshint", ["exec:jshint"]);
  grunt.registerTask("jslint", ["exec:jslint"]);
  grunt.registerTask("eslint", ["exec:eslint"]);
  grunt.registerTask("tidy", ["exec:tidy"]);
};