// grab the packages we need
var express = require('express');
var app = express();
var rel = 'v1.0.1';

var body_parser = require('body-parser');
app.use(body_parser.json()); // support json encoded bodies
app.use(body_parser.urlencoded({ extended: true })); // support encoded bodies

//var port = process.env.PORT || 8080;
var port = 2000;

function run_cmd(cmd, res) {
  const child_process = require('child_process');
  try {
    stdout = child_process.execSync(cmd);
    //console.log(`${stdout}`);
    res.status(200);
    res.set('Content-Type', 'text/plain');
    res.end(stdout);
  } catch (error) {
    res.status(200);
    res.set('Content-Type', 'text/plain');
    res.end("error");
  }
}

// start the server
app.listen(port);
console.log('Server started at http://localhost:' + port);

app.get('/', function(req, res) {
  //run_cmd('echo -n $(hostname) ": ' + rel + ' : " $(uname) " : " $(date)',res);
  run_cmd('echo Hello. AUSF ' + rel + ' is here',res);
});