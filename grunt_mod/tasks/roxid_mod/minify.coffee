'use strict'

module.exports.tasks =
  clean:
    minify: [ '<%= paths.dest.css_mod %>**/*.min.css' ]

  cssmin:
    roxid_mod:
      options:
        rebase: false
      expand: true
      cwd: '<%= paths.dest.css_mod %>'
      dest: '<%= paths.dest.css_mod %>'
      src: [ '*.css' ]
      ext: '.min.css'

  uglify:
    roxid:
      src: '<%= paths.dest.js_mod %>/roxid.js'
      dest: '<%= paths.dest.js_mod %>/roxid.min.js'
