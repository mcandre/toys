module.exports = function(grunt) {
  grunt.initConfig({
    exec: {
      hello: "lessc hello.less > hello.css",
      fizzy: "lessc fizzy.less > fizzy.css",
      tidy: "find . -type d -name node_modules -prune -o -type f -name '*.html' -print -exec tidy -qe {} \\; 2>&1 | grep -v 'canvas>' | grep -v 'proprietary attribute'; true",
      clean: "rm *.css; exit 0"
    }
  });

  grunt.loadNpmTasks("grunt-exec");

  grunt.registerTask("default", ["exec:hello", "exec:fizzy"]);
  grunt.registerTask("hello", ["exec:hello"]);
  grunt.registerTask("fizzy", ["exec:fizzy"]);
  grunt.registerTask("lint", ["exec:tidy"]);
  grunt.registerTask("tidy", ["exec:tidy"]);
  grunt.registerTask("clean", ["exec:clean"]);
};
