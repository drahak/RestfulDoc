module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  # grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-closure-tools'
  grunt.loadNpmTasks 'grunt-karma'

  lessStyles = [
    'client/css/**/*.less'
  ]

  coffeeScripts = [
    'client/js/**/*.coffee'
    'tests/**/*.coffee'
    'config/*.coffee'
  ]

  specScripts = [
    'tests/**/*Spec.js'
  ]

  clientDirs = [
    'client/libs/closure-library'
    'client/js'
  ]

  clientDepsPath = 'client/build/deps.js'
  clientDepsPrefix = '../../../../../'

  # prefix all client source directories (clientDirs)
  clientDirsPrefixed = []
  for dir in clientDirs
    clientDirsPrefixed.push '"' + dir + ' ' + clientDepsPrefix + dir + '"'

  grunt.initConfig
    less:
      app:
        files:
          'client/build/app.css': 'client/css/compile.less'

    coffee:
      app:
        options:
          sourceMap: true
        expand: true
        src: coffeeScripts
        dest: ''
        ext: '.js'

    karma:
      unit:
        configFile: 'config/karma.unit.js'
        background: true

    watch:
      app:
        files: [lessStyles, coffeeScripts, specScripts]
        tasks: ['less:app', 'coffee:app', 'karma:unit']
      coffee:
        files: coffeeScripts
        tasks: 'coffee:app'
      less:
        files: lessStyles
        tasks: 'less:app'
      karma:
        files: [coffeeScripts, specScripts]
        tasks: ['karma:unit']

    closureBuilder:
      options:
        closureLibraryPath: 'client/libs/closure-library'
        builder: 'client/libs/closure-library/closure/bin/build/closurebuilder.py'
        compilerFile: 'client/libs/closure-compiler/compiler.jar'
        namespaces: 'App.bootstrap'
        compile: true
        compilerOpts:
          compilation_level: 'WHITESPACE_ONLY'
          define: ['"goog.DEBUG=false"']
          warning_level: 'VERBOSE'
          output_wrapper: '(function(){%output%}).call(this);'
        execOpts:
          maxBuffer: 999999 * 1024
      app:
        src: clientDirs
        dest: 'client/build/app.js'

    closureDepsWriter:
      options:
        closureLibraryPath: 'client/libs/closure-library'
        depswriter: 'client/libs/closure-library/closure/bin/build/depswriter.py'
        root_with_prefix: clientDirsPrefixed
      app:
        dest: clientDepsPath

  grunt.registerTask 'default', [
    'less:app'
    # 'coffee:app' # uncomment if you want to compiel CoffeScript on startup
    # 'closureBuilder:app'
    'closureDepsWriter:app'

    # if you want to watch both coffee and less, use watch:app
    # 'watch:less' # watch only less files
  ]