'use strict'

module.exports.tasks =
  clean:
    all: [
      '<%= paths.dest.js %>'
      '<%= paths.dest.css %>'
      '<%= paths.dest.assets %>'
      '<%= paths.dest.favicons %>'
      '<%= paths.dest.fonts %>'
    ]
