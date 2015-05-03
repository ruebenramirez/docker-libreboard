var forever = require('forever-monitor');
 
var libreboard = new (forever.Monitor)('/home/app/build/bundle/main.js', {
  max: 100,
  silent: true,
  pidFile: '/home/app/libreboard.pid',
  env: {'PORT':'5555', 
        'MONGO_URL':process.env.MONGO_URL,
        'ROOT_URL':process.env.ROOT_URL,
        'DISABLE_WEBSOCKETS':'true'
       },
  cwd: '/home/app/build/bundle',
  logFile:'/home/app/logs/libreboard.log',
  outFile:'/home/app/logs/stdout.log',
  errFile:'/home/app/logs/stderr.log',
  watch: true,
  watchDirectory: '/home/app/build/bundle',
  args: []
});
 
libreboard.on('exit', function () {
  console.log('libreboard has exited after 10 restarts');
});

libreboard.on('watch:restart', function(info) {
  console.log('Restaring script because ' + info.file + ' changed');
});
 
libreboard.start();
