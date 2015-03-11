module.exports = (grunt) ->

  grunt.initConfig

    less:
      bootstrap:
        options:
          paths: 'bower_components/bootstrap/less'
        files: '_tmp/bootstrap.css': 'src/less/bootstrap.less'
      main:
        files: '_tmp/main.css': 'src/less/main.less'

    cssmin:
      combine:
        options:
          keepSpecialComments: 0
        files:
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
        layoutdir: 'src/layouts'
        layout: 'default.hbs'
      handlebars:
        files:
          './dist/': ['src/content/*.hbs']
        
  grunt.registerTask 'default', ['assemble', 'style', 'copy']
  grunt.registerTask 'style', ['less', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'assemble'
