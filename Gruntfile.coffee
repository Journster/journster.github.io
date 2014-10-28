module.exports = (grunt) ->

  grunt.initConfig

    less:
      bootstrap:
        options:
          paths: 'bower_components/bootstrap/less'
        files: '_tmp/bootstrap.css': '_src/less/bootstrap.less'
      main:
        files: '_tmp/main.css': '_src/less/main.less'

    cssmin:
      combine:
        options:
          keepSpecialComments: 0
        files:
          'lib/the.css': [
            '_tmp/bootstrap.css'
            '_tmp/main.css'
          ]

    copy:
      bootstrap:
        cwd: 'bower_components/bootstrap/dist/fonts/'
        src: '*'
        dest: 'fonts/'
        expand: true
        filter: 'isFile'

    assemble:
      options: 
        flatten: true
        layoutdir: 'src/layouts'
      markdown:
        options:
          ext: '.md'
          engine: 'handlebars'
          layout: 'default.hbs'
        files:
          '/': ['src/content/*.md']
        
  grunt.registerTask 'default', ['assemble', 'style', 'copy']
  grunt.registerTask 'style', ['less', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'assemble'
