'use strict'

module.exports.tasks =
  clean:
    asset_compiler: '<%= paths.dest.asset_compiler %>'
    asset_compiler_productive: [
      '<%= paths.dest.asset_compiler %>/js/compile.js.map'
      '<%= paths.dest.asset_compiler %>/css/styles.map'
    ]

  copy:
    asset_compiler:
      expand: true
      cwd: '<%= paths.src.asset_compiler %>/js/'
      src: [ '*.js' ]
      dest: '<%= paths.dest.asset_compiler %>/js/'

  less:
    asset_compiler:
      options:
        sourceMap: true
        sourceMapURL: 'styles.map'
        sourceMapRootpath: '/'
        sourceMapFilename: '<%= paths.dest.asset_compiler %>/css/styles.map'
      src: [ '<%= paths.src.asset_compiler %>/css/styles.less' ]
      dest: '<%= paths.dest.asset_compiler %>/css/styles.css'

  coffeelint:
    asset_compiler:
      options:
        max_line_length:
          level: 'ignore'
      src: [ '<%= paths.src.asset_compiler %>/**/*.coffee' ]

  coffee:
    asset_compiler:
      options:
        sourceMap: true
      src: [ '<%= paths.src.asset_compiler %>/js/compile.coffee' ]
      dest: '<%= paths.dest.asset_compiler %>/js/compile.js'

  uglify:
    asset_compiler:
      options:
        compress: drop_console: true
      src: '<%= paths.dest.asset_compiler %>/js/compile.js'
      dest: '<%= paths.dest.asset_compiler %>/js/compile.js'

  cssmin:
    asset_compiler:
      options:
        rebase: false
      src: '<%= paths.dest.asset_compiler %>/css/styles.css'
      dest: '<%= paths.dest.asset_compiler %>/css/styles.css'

