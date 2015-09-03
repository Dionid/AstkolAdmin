'use strict';
var gulp = require('gulp');
var $ = require('gulp-load-plugins')();

var config = {
    jadePath: 'app/jade',
    htmlPath: 'dist/html',

    imgPath: 'app/img',
    imgDistPath: 'dist/img',

    sassPath: 'app/sass',
    cssPath: 'dist/css',

    coffeePath: 'app/coffee',
    jsPath: 'dist/js',

    bowerPath: 'bower_components',
    vendorPath: 'app/vendor',
    vendorDistPath: 'dist/vendor'
};

var errorLog = function(error) {
    console.log(error.stack);
};

gulp.task('jade', ['clean:html'], function() {
    var jade_vars = {};

    return gulp.src(config.jadePath+'/*.jade')
        .pipe($.sourcemaps.init())
        .pipe($.jade({
            pretty: true,
            locals: jade_vars
        }))
        .on('error', $.notify.onError({
            title:    'Jade compiler problem',
            message:  "<%= error.name %>: <%= error.message %> \nin file <%= error.path %>"
        }))
        .pipe($.sourcemaps.write())
        .pipe(gulp.dest(config.htmlPath));
});

gulp.task('image', ['clean:img'], function() {
    return gulp.src(config.imgPath+'/**/*')
        .pipe(gulp.dest(config.imgDistPath));
});

gulp.task('vendor', ['clean:vendor'], function() {
    gulp.src(config.vendorPath+'/**/*')
        .pipe(gulp.dest(config.vendorDistPath));

    /* Material design icons */

    var materialDesignIcons = config.bowerPath + '/material-design-iconic-font/dist';

    gulp.src(materialDesignIcons+'/fonts/**/*')
        .pipe(gulp.dest(config.vendorDistPath+'/fonts'));

    gulp.src(materialDesignIcons+'/css/**/*')
        .pipe(gulp.dest(config.vendorDistPath+'/css'));

    /* wnumb */

    var wnumb = config.bowerPath + '/wnumb';
    gulp.src(wnumb+'/**/*.js')
        .pipe(gulp.dest(config.vendorDistPath+'/wnumb'));

    /* nouislider */

    var nouislider = config.bowerPath + '/nouislider/distribute';

    gulp.src(nouislider+'/**/*')
        .pipe(gulp.dest(config.vendorDistPath+'/nouislider'));

    /* swiper */

    var swiper = config.bowerPath + '/swiper/dist';

    gulp.src(swiper+'/**/*')
        .pipe(gulp.dest(config.vendorDistPath+'/swiper'));
});

gulp.task('sass', ['clean:css'], function() {
    return gulp.src(config.sassPath+'/**/*.scss')
        .pipe($.sourcemaps.init())
        .pipe($.sass({
            outputStyle: 'nested', // change to 'compressed' for production
            precision: 10,
            includePaths: ['.'],
            onError: function(err) {
                return $.notify().write(err);
            }
        }))
       .pipe($.postcss([
            require('autoprefixer-core')({browsers: ['last 1 version']})
        ]))
        .pipe($.sourcemaps.write())
        .pipe(gulp.dest(config.cssPath));
});

gulp.task('coffee', ['clean:js'], function() {
    return gulp.src(config.coffeePath+'/**/*.coffee')
        .pipe($.sourcemaps.init())
        .pipe(
            $.coffee()
            .on('error', $.notify.onError({
                    title:    'Coffeescript compiler error',
                    message:  "<%= error.name%>: <%= error.message %> in file <%= error.filename %>"
            }))
            .on('error', errorLog)
        )
        .pipe($.sourcemaps.write())
        .pipe(gulp.dest(config.jsPath));
});

gulp.task('clean', require('del').bind(null, ['.tmp']));

gulp.task('clean:html', require('del').bind(null, [
    config.htmlPath+'/**.*'
]));

gulp.task('clean:img', require('del').bind(null, [
    config.imgDistPath+'/**.*'
]));

gulp.task('clean:vendor', require('del').bind(null, [
    config.vendorDistPath+'/**'
]));

gulp.task('clean:css', require('del').bind(null, [
    config.cssPath+'/**.*'
]));

gulp.task('clean:js', require('del').bind(null, [
    config.jsPath+'/**.*'
]));

gulp.task('watch', ['jade', 'image', 'vendor', 'sass', 'coffee'], function () {
    gulp.watch(config.jadePath+'/**/*.jade', ['jade']);
    gulp.watch(config.imgPath+'/**/*', ['image']);
    gulp.watch(config.vendorPath+'/**/*', ['vendor']);
    gulp.watch(config.sassPath+'/**/*.scss', ['sass']);
    gulp.watch(config.coffeePath+'/**/*.coffee', ['coffee']);
});

gulp.task('default', ['clean'], function() {
    gulp.start('watch');
});
