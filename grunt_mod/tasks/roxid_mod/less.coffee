'use strict'

module.exports = (grunt, options) ->
  getOptions = (name) ->
    options =
      sourceMap: true
      sourceMapRootpath: '/'
      strictImports: true
      sourceMapURL: "#{name}.map"
      sourceMapFilename: "<%= paths.dest.css_mod %>/#{name}.map"

  tasks:
    less:
      options:
        sourceMap: true
        sourceMapRootpath: '/'
        strictImports: true

      bootstrap:
        options: getOptions 'bootstrap_own'
        src: [ '<%= paths.src.css_mod %>/bootstrap_own.less' ]
        dest: '<%= paths.dest.css_mod %>/bootstrap_own.css'

      theme:
        options: getOptions 'theme_own'
        src: [ '<%= paths.src.css_mod %>/*theme_own.less' ]
        dest: '<%= paths.dest.css_mod %>/theme_own.css'

    autoprefixer:
      theme:
        options:
          map:
            inline: false
            prev: false
          browsers: [ '> 1%', 'last 4 versions', 'ie 8', 'ie 9']
        src: [
          '<%= paths.dest.css_mod %>/theme_own.css'
        ]

