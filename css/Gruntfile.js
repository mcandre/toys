'use strict';

module.exports = function(grunt) {
    grunt.initConfig({
        exec: {
            csslint: 'node node_modules/csslint/cli.js .',
            scssLint: 'scss-lint .',
            tidy: 'find . -type d -name node_modules -prune -o -type f -name "*.html" \\( -exec tidy -qe {} \\; -o -print \\) 2>&1 | grep -v "canvas>" | grep -v "proprietary attribute"; true'
        }
    });

    grunt.loadNpmTasks('grunt-exec');

    grunt.registerTask('default', ['exec:csslint', 'exec:scssLint', 'exec:tidy']);
    grunt.registerTask('lint', ['exec:csslint', 'exec:scssLint', 'exec:tidy']);
    grunt.registerTask('csslint', ['exec:csslint']);
    grunt.registerTask('scssLint', ['exec:scssLint']);
    grunt.registerTask('tidy', ['exec:tidy']);
};
