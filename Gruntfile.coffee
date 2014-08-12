# global module:false

module.exports = (grunt)->

  # Project configuration.
  grunt.initConfig
    # Metadata.
    pkg: grunt.file.readJSON('package.json'),
    banner: """
      /*!
       * <%= pkg.title || pkg.name %> - v<%= pkg.version %>
       */
      """,
    # Task configuration.
    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      dist: {
        src: ['lib/<%= pkg.name %>.js'],
        dest: 'dist/<%= pkg.name %>.js'
      }
    },
    sass:
      build:
        files:
          'assets/app.css': 'sass/app.scss'
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      dist: {
        src: '<%= concat.dist.dest %>',
        dest: 'dist/<%= pkg.name %>.min.js'
      }
    },
    jshint: {
      options: {
        curly: true,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        unused: true,
        boss: true,
        eqnull: true,
        browser: true,
        globals: {}
      },
      gruntfile: {
        src: 'Gruntfile.js'
      },
      lib_test: {
        src: ['lib/**/*.js', 'test/**/*.js']
      }
    },
    qunit: {
      files: ['test/**/*.html']
    },
    watch: {
      gruntfile: {
        files: '<%= jshint.gruntfile.src %>',
        tasks: ['jshint:gruntfile']
      },
      lib_test: {
        files: '<%= jshint.lib_test.src %>',
        tasks: ['jshint:lib_test', 'qunit']
      },
      dev: {
        files: [
          'index.html'
          'assets/**/*.*'
          'sass/**/*.scss'
        ]
        tasks: [
          'build'
        ]
        options: {
          livereload: true,
        }
      }
    }
    jekyll: {
      build:
        src: '.'
        dest: '_site'
    }
    connect:
      server:
        options:
          livereload: true
          base: '_site/'
          port: 9009

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-qunit')
  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-jekyll')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-connect')

  # Default task.
  grunt.registerTask('default', ['jshint', 'qunit', 'concat', 'uglify'])

  # Development Server
  grunt.registerTask 'serve',
                     [
                       'build'
                       'connect:server'
                       'watch:dev'
                     ]

  grunt.registerTask 'build',
                     [
                       'jekyll:build'
                     ]
