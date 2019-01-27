'use strict'

module.exports = (grunt, options) ->
  colortheme = grunt.option("theme")

  tasks:
    watch:
    # does NOT run libs_js, so new Modernizr plugins will not be added
      roxid_js:
        files: [
          '<%= paths.src.js %>/roxid/**/*.coffee'
          '<%= paths.src.js %>/roxid/**/*.js'
        ]
        tasks: [ 'roxid_js' ]

      libs_js:
        files: [
          '<%= paths.src.js %>/libs/**/*.js'
          '<%= paths.src.js %>/oxscripts/**/*.js'
        ]
        tasks: [ 'libs_js' ]

      libs_css:
        files: [
          '<%= paths.src.css %>/libs/code/**/*.scss'
          '<%= paths.src.css %>/libs/code/**/*.css'
          '<%= paths.src.css %>/libs/assets/**/*.css'
        ]
        tasks: [ 'libs_css' ]

      # does NOT run libs_js, so new Modernizr plugins will not be added
      libs_productpage_js:
        files: [
          '<%= paths.src.js %>/libs_productpage/**/*.js'
        ]
        tasks: [ 'libs_productpage_js' ]

      bootstrap_css:
        files: [
          '<%= paths.src.css %>/bootstrap/**/*.less'
          '<%= paths.src.css %>/colorthemes/**/*.less'
        ]
        tasks: [ "less:bootstrap_css_#{colortheme}" ]

      roxid_css:
        files: [
          '<%= paths.src.css %>/**/*.less'
          '<%= paths.src.css %>/colorthemes/**/*.less'
        ]
        tasks: [ "less:roxid_css_#{colortheme}", "autoprefixer:roxid_css_#{colortheme}" ]

      livereload:
        options:
          livereload: 9369
        files: [
          '<%= paths.tpl %>/**/'
          '<%= paths.tpl %>/**/*.tpl'
          '<%= paths.module %>/**/*'
          # '<%= paths.dest.css %>/**/'
          '<%= paths.dest.css %>/**/*.css'
          # '<%= paths.dest.js %>/**/'
          '<%= paths.dest.js %>/**/*.js'
        ]
