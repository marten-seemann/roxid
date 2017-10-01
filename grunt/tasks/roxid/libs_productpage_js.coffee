'use strict'

module.exports.tasks =
  concat:
    libs_productpage_js:
      options:
        sourceMap: true
      nonull: true
      src: [
        '<%= paths.bower %>/photoswipe/dist/photoswipe.js'
        '<%= paths.bower %>/photoswipe/dist/photoswipe-ui-default.js'
        '<%= paths.bower %>/ez-plus/src/jquery.ez-plus.js'
      ]
      dest: '<%= paths.dest.js %>/libs_productpage.js'
