module.exports = (lineman) ->
  js:
    vendor: [
      'vendor/js/jquery/dist/jquery.js',
      'vendor/js/underscore/underscore.js',
      'vendor/js/backbone/backbone.js',
      'vendor/js/backbone.babysitter/lib/backbone.babysitter.js',
      'vendor/js/backbone.wreqres/lib/backbone.wreqres.js',
      'vendor/js/backbone.wreqres/lib/backbone.wreqres.js',
      'vendor/js/backbone.marionette/lib/backbone.marionette.js',
      'vendor/js/boostrap/dist/js/boostrap.js'
    ]

  sass:
    main: 'app/css/*.{scss,sass}'