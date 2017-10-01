'use strict'

module.exports = (grunt, options) ->
  getOptions = (color) ->
    opts =
      banner: options.conf.cssbanner
      sourceMap: true
      sourceMapRootpath: '/'
      strictImports: true
      sourceMapURL: "bootstrap_#{color}.map"
      sourceMapFilename: "<%= paths.dest.css %>/bootstrap_#{color}.map"
      modifyVars:
        theme: color

  bootstrap_less = {}
  for theme in options.conf.colorthemes
    bootstrap_less["bootstrap_css_#{theme}"] =
      options: getOptions(theme)
      src: "<%= paths.src.css %>/bootstrap/bootstrap_template.less"
      dest: "<%= paths.dest.css %>/bootstrap_#{theme}.css"

  tasks:
    less: bootstrap_less

