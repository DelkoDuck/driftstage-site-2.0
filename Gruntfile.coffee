
module.exports = (grunt) ->
    'use strict'

    grunt.initConfig

        clean:
            all:
                ['dist/']
            js:
                ['dist/assets/js/']

        copy:
            main:
                files: [
                    {
                        src: ['index.html', 'greenlight.html', 'backer.html', 'assets/img/*', 'assets/img/**/*', 'assets/data/*']
                        dest: 'dist/'
                        expand: true
                    }
                ]

        coffee:
            main:
                expand: true
                cwd: 'assets/js/'
                src: ['**/*.coffee']
                ext: '.js'
                dest: 'dist/assets/js/'

        compress:
            main:
                options:
                    mode: 'gzip'
                expand: true,
                cwd: 'dist/',
                src: ['**/*'],
                dest: 'dist-zipped/'

        less:
            main:
                options:
                    paths: ["assets/less"]
                files:
                    "dist/assets/css/style.min.css": "assets/less/app.less"

        uglify:
            main:
                # options:
                    # beautify: true
                    # preserveComments: true
                    # mangle: false
                files:
                    'dist/assets/js/scripts.min.js': [
                        'vendor/bower/jquery/dist/jquery.js'

                        'vendor/bower/bootstrap/js/transition.js'
                        'vendor/bower/bootstrap/js/alert.js'
                        'vendor/bower/bootstrap/js/button.js'
                        'vendor/bower/bootstrap/js/carousel.js'
                        'vendor/bower/bootstrap/js/collapse.js'
                        'vendor/bower/bootstrap/js/dropdown.js'
                        'vendor/bower/bootstrap/js/modal.js'
                        'vendor/bower/bootstrap/js/tooltip.js'
                        'vendor/bower/bootstrap/js/popover.js'
                        'vendor/bower/bootstrap/js/scrollspy.js'
                        'vendor/bower/bootstrap/js/tab.js'
                        'vendor/bower/bootstrap/js/affix.js'

                        'vendor/bower/stellar/jquery.stellar.js'

                        # 'vendor/bower/jquery-waypoints/waypoints.js'

                        'vendor/bower/slabText/js/jquery.slabtext.js'

                        # 'vendor/bower/smooth-scroll.js/smooth-scroll.js'

                        # 'vendor/bower/fancybox/source/jquery.fancybox.js'

                        # 'vendor/bower/appear/jquery.appear.js'

                        # 'vendor/bower/jail/dist/jail.min.js'

                        # 'assets/js/jquery.parallax-1.1.3.js'

                        'dist/assets/js/*.js'
                    ]

        watch:
            options:
                livereload: true
            less:
                files: ['assets/css/*', 'assets/less/*']
                tasks: ['less']
            copy:
                files: ['*.html', 'assets/img/*', 'assets/img/**/*', 'assets/font/*']
                tasks: ['copy']
            uglify:
                files: ['assets/js/*']
                tasks: ['clean:js', 'coffee', 'uglify']

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-compress'


    grunt.registerTask 'default', [
        'clean:all', 'coffee', 'uglify', 'less', 'copy', 'compress'
    ]

    grunt.registerTask 'dev', [
        'clean:all', 'coffee', 'uglify', 'less', 'copy', 'watch'
    ]
