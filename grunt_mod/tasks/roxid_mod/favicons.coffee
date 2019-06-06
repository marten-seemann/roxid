'use strict'

module.exports.tasks =
  favicons:
    options:
      trueColor: true
      appleTouchBackgroundColor: 'white'
      androidHomescreen: true
    icons:
      src: '<%= paths.src.favicons %>/favicon.png'
      dest: '<%= paths.dest.favicons %>'
