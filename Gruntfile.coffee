#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "vendor/js/"
        }]
      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap-sass/assets/stylesheets/"
          src: "_bootstrap.scss"
          dest: "_sass/"
        },
        {
          expand: true
          cwd: "bower_components/bootstrap-sass/assets/stylesheets/bootstrap/"
          src: "**"
          dest: "_sass/bootstrap"
        },
        {
          expand: true
          cwd: "bower_components/bootstrap-sass/javascripts/"
          src: "bootstrap.min.js"
          dest: "vendor/js/"
        }]

    exec:
      jekyll:
        cmd: "jekyll build --trace"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "_sass/**/*"
          "css/**/*"
          "img/**/*"
          "js/**/*"
          "_config.yml"
          "**/*.html"
          "**/*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]
