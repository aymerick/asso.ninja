#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.initConfig
    sass:
      dist:
        options:
          bundleExec: true
        files: [{
          expand: true
          cwd: "css/"
          src: ["*.scss"]
          dest: "_site/css/"
          ext: ".css"
        }]

    copy:
      css:
        files: [{
          expand: true
          cwd: "css/"
          src: ["*.css"]
          dest: "_site/css/"
        }]
      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap/dist/css/"
          src: "bootstrap.min.css"
          dest: "_site/css/"
        }
        # ,{
        #   expand: true
        #   cwd: "bower_components/bootstrap/dist/js/"
        #   src: "bootstrap.min.js"
        #   dest: "_site/js/"
        # }
        ]
      html:
        files: [{
          expand: true
          src: ["*.html"]
          dest: "_site/"
        }]
      misc:
        files: [{
          expand: true
          src: "favicon.png"
          dest: "_site/"
        },
        {
          expand: true
          src: "CNAME"
          dest: "_site/"
        }]

    watch:
      options:
        livereload: true
      css:
        files: [
          "css/**/*"
        ]
        tasks: [
          "sass"
          "copy"
        ]
      html:
        files: [
          "*.html"
        ]
        tasks: [
          "copy"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "sass"
    "copy"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]
