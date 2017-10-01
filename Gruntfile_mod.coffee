'use strict'

module.exports = (grunt) ->
  # measures the time each task takes
  require('time-grunt')(grunt)

  # conf = grunt.file.readYAML 'grunt_mod/config/roxid_mod/config.yaml'
  paths = grunt.file.readYAML 'grunt_mod/config/roxid_mod/paths.yaml'

  options =
    pkg: grunt.file.readJSON 'package.json'
    config: src: 'grunt_mod/tasks/roxid_mod/*.coffee'
    paths: paths
    # conf: conf
  config = require('load-grunt-configs')(grunt, options)

  grunt.initConfig config
  require('load-grunt-tasks')(grunt)


  # Tasks for building the (unminified) ROXID_mod
  grunt.registerTask 'roxid_mod_unminified', [ 'less:bootstrap', 'less:theme', 'autoprefixer:theme', 'favicons' ]
  # Tasks for building the (minified) ROXID_mod
  grunt.registerTask 'roxid_mod_minify', [ 'clean:minify', 'cssmin:roxid_mod' ]
  grunt.registerTask 'default', [ 'roxid_mod_unminified', 'roxid_mod_minify' ]
