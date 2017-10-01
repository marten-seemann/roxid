'use strict'

module.exports = (grunt, options) ->
  paths = options.paths
  opts = options.conf.libs_js

  src = [ '<%= paths.src.css %>/libs/code/*.css' ]

  owl_carousel = [
    '<%= paths.bower %>/owl.carousel/dist/assets/owl.carousel.css'
    '<%= paths.bower %>/owl.carousel/dist/assets/owl.theme.default.css'
  ]

  if opts.owl_carousel then src = src.concat owl_carousel


  tasks:
    clean:
      libs_css: '<%= paths.dest.css %>/tmp'

    copy:
      rateit:
        expand: true
        cwd: '<%= paths.bower %>/rateit/dist/assets/'
        src: [ '*' ]
        dest: '<%= paths.dest.assets %>/rateit/'

      photoswipe:
        expand: true
        cwd: '<%= paths.bower %>/photoswipe/dist/default-skin/'
        src: [ '*' ]
        dest: '<%= paths.dest.assets %>/photoswipe/'

      libs_css:
        expand: true
        flatten: true
        cwd: '.'
        src: src
        dest: '<%= paths.dest.css %>/tmp'


    less:
      libs_css:
        options:
          banner: options.conf.cssbanner
          sourceMap: false # avoids a lot of trouble because if incompatible source file paths when using sass and less sourcemap options at the same time
        src: [ '<%= paths.src.css %>/libs/code/font-awesome.less' ]
        dest: '<%= paths.dest.css %>/tmp/font-awesome.css'


    sass:
      libs_css:
        options:
          style: 'expanded'
          sourcemap: 'auto'
        expand: true
        cwd: '<%= paths.src.css %>/libs/code/'
        src: [ '*.scss' ]
        dest: '<%= paths.dest.css %>/tmp'
        ext: '.css'
        extDot: 'last'


    concat_sourcemap:
      libs_css:
        options:
          sourceMapStyle: 'embed'
          sourceRoot: '/'
        src: '<%= paths.dest.css %>/tmp/*.css'
        dest: '<%= paths.dest.css %>/libs.css'
