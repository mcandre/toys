module.exports = function(grunt) {
  grunt.initConfig({
		exec: {
      jshint: "jshint .",
      tidy: "find . -type d -name node_modules -prune -o -type f -name '*.html' -print -exec tidy -qe {} \\; 2>&1 | grep -v 'canvas>' | grep -v 'proprietary attribute'; true"
		}
  });

  grunt.loadNpmTasks("grunt-exec");

  grunt.registerTask("default", ["exec:jshint", "exec:tidy"]);
  grunt.registerTask("lint", ["exec:jshint", "exec:tidy"]);
};
