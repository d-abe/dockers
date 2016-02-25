var project = process.env.PROJECT_NAME;

var gulp = require('gulp');
var gulpProcess = require('gulp-process');
var fs = require('fs');
var exec = require('child_process').execFile;

gulp.task('build', function(cb) {
    exec('./build.sh', function(err,stdout,stderr) {
        console.log(stdout);
        gulpProcess.restart('kitura');
        cb(err);
    });
});

gulp.task('watch', function(){
    gulpProcess.start('kitura','.build/debug/'+project);

    gulp.watch(['Package.swift','Sources/*.swift','Sources/**/*.swift','Tests/*.swift','Tests/**/*.swift'],['build']);
});
