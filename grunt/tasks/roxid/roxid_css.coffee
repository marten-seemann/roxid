'use strict'

module.exports = (grunt, options) ->
  getOptions = (color) ->
    opts =
      banner: options.conf.cssbanner
      sourceMap: true
      sourceMapRootpath: '/'
      strictImports: true
      sourceMapURL: "theme_#{color}.css.map"
      sourceMapFilename: "<%= paths.dest.css %>/theme_#{color}.css.map"
      modifyVars:
        theme: color


  roxid_less = {}
  roxid_autoprefixer = {}
  for theme in options.conf.colorthemes
    roxid_less["roxid_css_#{theme}"] =
      options: getOptions(theme)
      src: "<%= paths.src.css %>/colorthemes/theme_template.less"
      dest: "<%= paths.dest.css %>/theme_#{theme}.css"
    roxid_autoprefixer["roxid_css_#{theme}"] =
      options:
        map:
          inline: false
          prev: false
        browsers: [ '> 1%', 'last 4 versions', 'ie 8', 'ie 9']
      src: [ "<%= paths.dest.css %>/theme_#{theme}.css" ]

  tasks:
    less: roxid_less
    autoprefixer: roxid_autoprefixer
