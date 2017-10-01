'use strict'

module.exports = (grunt, options) ->
  paths = options.paths
  opts = options.conf.libs_js

  bootstrap = [ ]
  if opts.bootstrap.affix then bootstrap.push '<%= paths.bower %>/bootstrap/js/affix.js'
  if opts.bootstrap.alert then bootstrap.push '<%= paths.bower %>/bootstrap/js/alert.js'
  if opts.bootstrap.button then bootstrap.push '<%= paths.bower %>/bootstrap/js/button.js'
  if opts.bootstrap.carousel then bootstrap.push '<%= paths.bower %>/bootstrap/js/carousel.js'
  if opts.bootstrap.collapse then bootstrap.push '<%= paths.bower %>/bootstrap/js/collapse.js'
  if opts.bootstrap.dropdown then bootstrap.push '<%= paths.bower %>/bootstrap/js/dropdown.js'
  if opts.bootstrap.modal then bootstrap.push '<%= paths.bower %>/bootstrap/js/modal.js'
  if opts.bootstrap.tooltip then bootstrap.push '<%= paths.bower %>/bootstrap/js/tooltip.js' # must be before popover.js
  if opts.bootstrap.popover then bootstrap.push '<%= paths.bower %>/bootstrap/js/popover.js'
  if opts.bootstrap.scrollspy then bootstrap.push '<%= paths.bower %>/bootstrap/js/scrollspy.js'
  if opts.bootstrap.tab then bootstrap.push '<%= paths.bower %>/bootstrap/js/tab.js'
  if opts.bootstrap.transition then bootstrap.push '<%= paths.bower %>/bootstrap/js/transition.js'

  bootbox = [
    '<%= paths.bower %>/bootbox.js/bootbox.js'
  ]

  dotdotdot = [
    '<%= paths.bower %>/jQuery.dotdotdot/src/jquery.dotdotdot.js'
  ]

  validator = [
    '<%= paths.bower %>/bootstrap-validator/dist/validator.js'
  ]

  mmenu = [
    '<%= paths.bower %>/jQuery.mmenu/dist/core/js/jquery.mmenu.min.js'
    '<%= paths.bower %>/jQuery.mmenu/dist/addons/js/jquery.mmenu.offcanvas.min.js'
    '<%= paths.bower %>/jQuery.mmenu/dist/addons/js/jquery.mmenu.navbars.min.js'
    '<%= paths.bower %>/jQuery.mmenu/dist/addons/js/jquery.mmenu.counters.min.js'
    '<%= paths.bower %>/jQuery.mmenu/dist/addons/js/jquery.mmenu.iconpanels.min.js'
    '<%= paths.bower %>/jQuery.mmenu/dist/3rdparty/addons/js/jquery.mmenu.currentitem.min.js'
  ]

  noty = [
    '<%= paths.bower %>/noty/js/noty/jquery.noty.js'
    '<%= paths.src.js %>/libs/noty/center.js'
    '<%= paths.src.js %>/libs/noty/roxid_theme.js'
    '<%= paths.src.js %>/libs/noty/settings.js'
  ]

  owl_carousel = [
    '<%= paths.bower %>/owl.carousel/dist/owl.carousel.js'
  ]

  src =[
    '<%= paths.bower %>/jquery/dist/jquery.js'
    '<%= paths.bower %>/jquery-ui/ui/core.js'
    '<%= paths.bower %>/jquery-ui/ui/widget.js'
    '<%= paths.bower %>/jquery.cookie/jquery.cookie.js'
    '<%= paths.bower %>/rateit/dist/jquery.rateit.js'
    '<%= paths.src.js %>/oxscripts/ox*.js'
  ]
  src = src.concat bootstrap

  if opts.dotdotdot then src = src.concat dotdotdot
  if opts.mmenu then src = src.concat mmenu
  if opts.owl_carousel then src = src.concat owl_carousel
  if opts.validator then src = src.concat validator
  if opts.bootbox then src = src.concat bootbox

  src = src.concat noty


  tasks:
    clean:
      libs_js_pre: '<%= paths.dest.js %>/libs.js'
      libs_js_post: '<%= paths.tmp %>/modernizr.build.js'

    concat:
      libs_js:
        options:
          sourceMap: true
        src: src
        nonull: true
        dest: '<%= paths.dest.js %>/libs.js'
      libs_js_modernizr:
        src: [
          '<%= paths.dest.js %>/libs.js'
          '<%= paths.tmp %>/modernizr.build.js'
        ]
        dest: '<%= paths.dest.js %>/libs.js'

    modernizr:
      libs_js:
        devFile: '<%= paths.bower %>/modernizr/modernizr.js'
        uglify: false
        customTests: [
          '<%= paths.src.js %>/modernizr/modernizr.own_tests.js'
        ]
        outputFile: '<%= paths.tmp %>/modernizr.build.js'
        files: src: [
          '<%= paths.dest.js %>/*.js'
          '!<%= paths.dest.js %>**/*.min.js'
        ]

