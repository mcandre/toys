'use strict';

module.exports = function(grunt) {
  grunt.initConfig({
    exec: {
      phplint: 'find . -name "*.php" -exec php -l {} \\; | grep -v "No syntax errors detected"; true',
      csslint: 'csslint .',
      scssLint: 'scss-lint .',
      tidy: 'find . -type d -name node_modules -prune -o -type f -name "*.html" \\( -exec tidy -qe {} \\; -o -print \\) 2>&1 | grep -v "canvas>" | grep -v "proprietary attribute"; true'
    }
  });

  grunt.loadNpmTasks('grunt-exec');

  grunt.registerTask('default', [
    'exec:phplint',
    'exec:csslint',
    'exec:scssLint',
    'exec:tidy'
  ]);

  grunt.registerTask('lint', [
    'exec:phplint',
    'exec:csslint',
    'exec:scssLint',
    'exec:tidy'
  ]);

  grunt.registerTask('phplint', ['exec:phplint']);
  grunt.registerTask('csslint', ['exec:csslint']);
  grunt.registerTask('scssLint', ['exec:scssLint']);
  grunt.registerTask('tidy', ['exec:tidy']);
};
