module.exports = function(grunt) {
  grunt.initConfig({
		exec: {
      jshint: "jshint ."
		}
  });

  grunt.loadNpmTasks("grunt-exec");

  grunt.registerTask("default", ["exec:jshint"]);
  grunt.registerTask("lint", ["exec:jshint"]);
};
