'use strict'

module.exports = (grunt, options) ->
  tasks:
    clean:
      roxid_js: [ '<%= paths.tmp %>' ]

    coffee:
      roxid_js:
        options:
          sourceMap: true
        expand: true
        flatten: true
        cwd: '.'
        src: [ '<%= paths.src.js %>/roxid/*.coffee' ]
        dest: '<%= paths.tmp %>'
        ext: '.js'
        extDot: 'last'

    coffeelint:
      roxid_js:
        options:
          no_backticks:
            level: 'ignore'
          max_line_length:
            level: 'ignore'
        src: [ '<%= paths.src.js %>/roxid/*.coffee' ]

    mapcat:
      roxid_js:
        src: [ '<%= paths.tmp %>/*.map' ]
        dest: '<%= paths.dest.js %>/roxid.js'
