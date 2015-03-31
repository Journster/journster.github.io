module.exports = (grunt) ->

  grunt.initConfig

    less:
      bootstrap:
        options:
          paths: 'bower_components/bootstrap/less'
        files: '_tmp/bootstrap.css': 'less/bootstrap.less'
      main:
        files: '_tmp/main.css': 'less/main.less'
      frontpage:
        files: '_tmp/frontpage.css': 'less/frontpage.less'

    cssmin:
      combine:
        options:
          keepSpecialComments: 0
        files:
          'dist/lib/frontpage.css': [
            '_tmp/bootstrap.css'
            '_tmp/frontpage.css'
          ]
          'dist/lib/the.css': [
            '_tmp/bootstrap.css'
            '_tmp/main.css'
          ]

    copy:
      bootstrap:
        cwd: 'bower_components/bootstrap/dist/fonts/'
        src: '*'
        dest: 'dist/fonts/'
        expand: true
        filter: 'isFile'
      files:
        cwd: 'files/'
        src: '*'
        dest: 'dist/'
        expand: true
        
    assemble:
      options: 
        flatten: true
        layoutdir: 'layouts'
        layout: 'default.hbs'
      handlebars:
        files:
          './dist/': ['content/*.hbs']
        
  grunt.registerTask 'default', ['assemble', 'style', 'copy']
  grunt.registerTask 'style', ['less', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'assemble'
