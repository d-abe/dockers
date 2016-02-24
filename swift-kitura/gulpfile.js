var project = process.env.PROJECT_NAME;

var gulp = require('gulp');
var gulpProcess = require('gulp-process');
var exec = require('child_process').exec;

gulp.task('build', function(cb) {
    exec('./build.sh', function(err,stdout,stderr) {
        gulpProcess.restart('kitura');
        cb(err);
    });
});

gulp.task('watch', function(){
    gulpProcess.start('kitura','.build/debug/'+project);

    gulp.watch(['Sources/*.swift','Sources/**/*.swift'],['build']);
});
