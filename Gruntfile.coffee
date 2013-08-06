###
ladybucks
https://github.com/pismute/ladybucks

Copyright (c) 2013 Changwoo Park
Licensed under the MIT license.
###

module.exports = (grunt)->
  'use strict'

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    manifest: grunt.file.readJSON 'src/lib/manifest.json'
    jshint:
      options:
        jshintrc: '.jshintrc'
      lib:
        src: ['src/lib/**/*.js']
      test:
        src: ['src/test/**/*.js']
    copy:
      main:
        files: [
            expand: true
            cwd: 'src/'
            src: ['**', '!**/*.coffee']
            dest: 'out/'
        ]
    coffeelint:
      gruntfile:
        src: 'Gruntfile.coffee'
      lib:
        src: ['src/lib/**/*.coffee']
      test:
        src: ['src/test/**/*.coffee']
      options:
        no_trailing_whitespace:
          level: 'error'
        max_line_length:
          level: 'warn'
    coffee:
      lib:
        expand: true
        cwd: 'src/lib/'
        src: ['**/*.coffee']
        dest: 'out/lib/'
        ext: '.js'
      test:
        expand: true
        cwd: 'src/test/'
        src: ['**/*.coffee']
        dest: 'out/test/'
        ext: '.js'
    simplemocha:
      all:
        src: [
          'node_modules/should/lib/should.js'
          'out/test/**/*.js'
        ]
        options:
          globals: ['should']
          timeout: 3000
          ignoreLeaks: false
          #grep: '**/*.js'
          ui: 'bdd'
          reporter: 'spec'
    watch:
      gruntfile:
        files: '<%= coffeelint.gruntfile.src %>'
        tasks: ['coffeelint:gruntfile']
      jsLib:
        files: '<%= jshint.lib.src %>'
        tasks: ['jshint:lib', 'simplemocha']
      jsTest:
        files: '<%= jshint.test.src %>'
        tasks: ['jshint:test', 'simplemocha']
      coffeeLib:
        files: '<%= coffeelint.lib.src %>'
        tasks: ['coffeelint:lib', 'coffee:lib', 'simplemocha']
      coffeeTest:
        files: '<%= coffeelint.test.src %>'
        tasks: ['coffeelint:test', 'coffee:test', 'simplemocha']
    clean: ['out/', 'tmp/']
    crx:
      dev:
        src: 'out/lib/'
        dest: 'out/'
        filename: '<%= pkg.name %>-<%= pkg.version %>-dev.crx'
        privateKey: 'ladybucks.pem'
    zip:
      dev:
        cwd: 'out/lib/'
        src: 'out/lib/**',
        dest: 'out/<%= pkg.name %>-<%= pkg.version %>-dev.zip',

  # plugins.
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-crx'
  grunt.loadNpmTasks 'grunt-zip'


  # tasks.
  grunt.registerTask 'compile', [
    'coffeelint'
    #'jshint'
    'copy'
    'coffee'
    'crx'
    'zip'
  ]

  grunt.registerTask 'test', [
    'simplemocha'
  ]

  grunt.registerTask 'default', [
    'compile'
    'test'
  ]
