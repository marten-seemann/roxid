'use strict'

module.exports = (grunt, options) ->
  tasks:
    watch:
      roxid_mod:
        files: [
          '<%= paths.src.css_mod %>/**/*.css'
          '<%= paths.src.css_mod %>/**/*.less'
        ]
        tasks: [ 'less:bootstrap', 'less:theme', 'autoprefixer:theme' ]

      livereload:
        options:
          livereload: 9399
        files: [
          '<%= paths.tpl_mod %>/**/'
          '<%= paths.tpl_mod %>/**/*.tpl'
          '<%= paths.dest.css_mod %>/**/*.css'
        ]
