'use strict';

module.exports = function(grunt) {
    grunt.initConfig({
        exec: {
            jsfmt: 'find . -type d -name node_modules -prune -o -type f -name "*[.-]min.js" -prune -o \\( -type f -name "*.js" -o -type f -path "*/bin/*" \\) -exec node node_modules/.bin/jsfmt -w {} \\;',
            tidy: 'find . -type d -name node_modules -prune -o -type f -name "*.html" \\( -exec tidy -qe {} \\; -o -print \\) 2>&1 | grep -v "canvas>" | grep -v "proprietary attribute"; true'
        }
    });

    grunt.loadNpmTasks('grunt-exec');

    grunt.registerTask('default', ['exec:jsfmt', 'exec:tidy']);

    grunt.registerTask('lint', ['exec:jsfmt', 'exec:tidy']);

    grunt.registerTask('jsfmt', ['exec:jsfmt']);
    grunt.registerTask('tidy', ['exec:tidy']);
};
