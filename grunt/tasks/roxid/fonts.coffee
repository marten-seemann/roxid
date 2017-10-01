'use strict'

module.exports.tasks =
  copy:
    fontawesome:
      expand: true
      cwd: '<%= paths.bower %>/font-awesome/fonts/'
      src: [ '**' ]
      dest: '<%= paths.dest.fonts %>/fontawesome'
