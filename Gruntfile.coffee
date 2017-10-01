'use strict'

module.exports = (grunt) ->
  # measures the time each task takes
  require('time-grunt')(grunt)

  extendify = require('extendify')({ arrays: 'concat' })

  # read config files
  conf = {}
  for file in grunt.file.expand('grunt/config/*/config.yaml')
    extendify conf, grunt.file.readYAML(file)

  paths = grunt.file.readYAML 'grunt/config/roxid/paths.yaml'

  # load ROXID tasks
  options =
    pkg: grunt.file.readJSON 'package.json'
    config: src: [ 'grunt/tasks/roxid/*.coffee' ]
    paths: paths
    conf: conf
  config_roxid = require('load-grunt-configs')(grunt, options)


  # load ROXIDx tasks, if neccessary (only for ROXIDs bigger than ROXID One)
  options.config.src = [ 'grunt/tasks/roxid*/*.coffee', '!grunt/tasks/roxid/*.coffee' ]
  file = grunt.file.expand [ 'grunt/config/roxid*/paths.yaml', '!grunt/config/roxid/paths.yaml' ]
  if file.length > 0 # will only be executed for ROXIDx, i.e. NOT for ROXID One
    pathsx = grunt.file.readYAML file
    # the destination will always be the ROXIDx directory, even if the source files are in the roxid/-directory
    extendify options.paths.dest, pathsx.dest
    options.pathsx = pathsx
    options.paths.tmp = pathsx.tmp
    options.paths.tpl = pathsx.tpl
    config_roxidx = require('load-grunt-configs')(grunt, options)
    extendify config_roxid, config_roxidx


  # Load grunt configurations automatically
  grunt.initConfig config_roxid


  require('load-grunt-tasks')(grunt)

  options.conf.colorthemes = removeDuplicates options.conf.colorthemes

  bootstrap_css = []
  roxid_css = []
  for theme in options.conf.colorthemes
    continue unless theme?
    bootstrap_css.push "less:bootstrap_css_#{theme}"
    roxid_css.push "less:roxid_css_#{theme}"
    roxid_css.push "autoprefixer:roxid_css_#{theme}"
    # add separate task to build roxid_css and bootstrap_css for a particular theme
    grunt.registerTask "theme_#{theme}", [ "less:roxid_css_#{theme}", "autoprefixer:roxid_css_#{theme}", "less:bootstrap_css_#{theme}" ]


  # Tasks for building the (unminified) ROXID
  grunt.registerTask 'selfcheck', [ 'coffeelint:selfcheck' ]
  grunt.registerTask 'libs_css', [ 'copy:libs_css', 'copy:rateit', 'copy:photoswipe', 'less:libs_css', 'sass:libs_css', 'concat_sourcemap:libs_css', 'clean:libs_css' ]
  grunt.registerTask 'bootstrap_css', bootstrap_css
  grunt.registerTask 'roxid_css', roxid_css
  grunt.registerTask 'themes', [ 'roxid_css', 'bootstrap_css' ]
  grunt.registerTask 'roxid_js', [ 'coffeelint:roxid_js', 'coffee:roxid_js', 'mapcat:roxid_js', 'clean:roxid_js' ]
  grunt.registerTask 'libs_productpage_js', [ 'concat:libs_productpage_js' ]
  grunt.registerTask 'libs_js', [ 'clean:libs_js_pre', 'concat:libs_js', 'modernizr', 'concat:libs_js_modernizr', 'clean:libs_js_post' ]
  grunt.registerTask 'fonts', [ 'copy:fontawesome' ]

  # Tasks for building the (minified) ROXID
  grunt.registerTask 'minify', [ 'clean:roxid_minify', 'uglify:all_but_roxid', 'uglify:roxid', 'cssmin:roxid' ]


  # Tasks for building the assets needed by the ROXID Asset Compiler
  grunt.registerTask 'asset_compiler', [ 'clean:asset_compiler', 'coffeelint:asset_compiler', 'coffee:asset_compiler', 'copy:asset_compiler', 'less:asset_compiler' ]
  grunt.registerTask 'asset_compiler_productive', [ 'asset_compiler', 'uglify:asset_compiler', 'cssmin:asset_compiler', 'clean:asset_compiler_productive' ]

  # Task aliases
  grunt.registerTask 'default', [ 'selfcheck', 'libs_css', 'bootstrap_css', 'roxid_css', 'roxid_js', 'libs_productpage_js', 'libs_js', 'fonts' ]
  grunt.registerTask 'productive', [ 'default', 'minify', 'favicons' ]

  # clean everything, build everyting, minify everyting
  # should be used by the ROXID build script
  grunt.registerTask 'all', [ 'clean:all', 'productive', 'asset_compiler_productive', 'minify' ]

removeDuplicates = (ar) ->
  if ar.length == 0
    return []
  res = {}
  res[ar[key]] = ar[key] for key in [0..ar.length-1]
  value for key, value of res
