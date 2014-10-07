/* Exports a function which returns an object that overrides the default &
 *   plugin file patterns (used widely through the app configuration)
 *
 * To see the default definitions for Lineman's file paths and globs, see:
 *
 *   - https://github.com/linemanjs/lineman/blob/master/config/files.coffee
 */

module.exports = function(lineman) {
  return {
    js: {
      vendor: [
        "vendor/js/jquery/dist/jquery.js",
        "vendor/js/underscore/underscore.js",
        "vendor/js/backbone/backbone.js",
        "vendor/js/backbone.babysitter/lib/backbone.babysitter.js",
        "vendor/js/backbone.wreqres/lib/backbone.wreqres.js",
        "vendor/js/backbone.marionette/lib/backbone.marionette.js",
        "vendor/js/boostrap/dist/js/boostrap.js"
      ]
    },

    sass: {
      main: 'app/css/*.{scss,sass}'
    }
  };
};