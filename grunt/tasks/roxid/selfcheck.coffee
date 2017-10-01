'use strict'

module.exports.tasks =
  coffeelint:
    selfcheck:
      options:
        max_line_length:
          level: 'ignore'
      src: [
        'Gruntfile.coffee',
        'grunt/**/*.coffee'
      ]
