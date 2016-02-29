var project = process.env.PROJECT_NAME;
var working_dir = process.env.WORKING_DIR;

var gulp = require('gulp');
var gulpProcess = require('gulp-process');
var watch = require('gulp-watch');
var fs = require('fs');
var exec = require('child_process').execFile;

gulp.task('copy',function(){
	return 	gulp.src(['Package.swift','Sources/*.swift','Sources/**/*.swift','Tests/*.swift','Tests/**/*.swift'], {cwd: working_dir, base: working_dir})
                .pipe(gulp.dest('./'));
});

gulp.task('build', ['copy'], function(cb) {
    exec('./build.sh', function(err,stdout,stderr) {
        console.log(stdout);
        gulpProcess.restart('kitura');
        cb(err);
    });
});

gulp.task('watch', function(){
    gulpProcess.start('kitura','.build/debug/'+project);

    watch(['Package.swift','Sources/*.swift','Sources/**/*.swift','Tests/*.swift','Tests/**/*.swift'],{ cwd: working_dir },function(event){
    	gulp.start(["copy","build"]);
    });
});
