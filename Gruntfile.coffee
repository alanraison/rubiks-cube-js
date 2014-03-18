module.exports = (grunt) ->
    grunt.initConfig(
        pkg: grunt.file.readJSON('package.json')
        jasmine_node: 
            options:
                forceExit: true
                extensions: ['js','coffee'],
                specMatcher: 'spec',
    
    )
    grunt.loadNpmTasks 'grunt-jasmine-node'
    grunt.registerTask('default', ['jasmine_node'])

