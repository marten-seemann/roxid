'use strict'

module.exports.tasks =
  clean:
    roxid_minify: [
      '<%= paths.dest.js %>/**/*.min.js',
      '<%= paths.dest.css %>/**/*.min.css'
    ]

  cssmin:
    roxid:
      options:
        rebase: false
      expand: true
      cwd: '<%= paths.dest.css %>'
      dest: '<%= paths.dest.css %>'
      src: [ '*.css' ]
      ext: '.min.css'

  uglify:
    all_but_roxid:
      expand: true
      cwd: '<%= paths.dest.js %>'
      dest: '<%= paths.dest.js %>'
      src: [ '**/*.js', '!roxid.js' ]
      ext: '.min.js'
    roxid:
      options:
        compress: drop_console: true
      src: '<%= paths.dest.js %>/roxid.js'
      dest: '<%= paths.dest.js %>/roxid.min.js'


