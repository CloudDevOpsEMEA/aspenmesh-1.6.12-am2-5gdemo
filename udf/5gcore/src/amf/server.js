// grab the packages we need
var http = require('http');
var express = require('express');
var app = express();
var rel = 'v1.0.1';

var body_parser = require('body-parser');
app.use(body_parser.json()); // support json encoded bodies
app.use(body_parser.urlencoded({ extended: true })); // support encoded bodies

//var port = process.env.PORT || 8080;
var port = 2000;

function auth(req, res) {
  if ( req.headers.authorization != 'Basic YmFzaWM6YQ==' ) { //basic:a
    res.status(401);
    res.set('WWW-Authenticate', 'Basic realm="401"');
    res.send('Authenticate');
    throw new Error('Authentication error');
  }
}

// start the server
app.listen(port);
console.log('Server started at http://localhost:' + port);

// routes will go here

app.get('/', function(req, res) {
  var arr = [];
  var num = 4;

  try {
    auth(req, res);

    for (var i = 0; i < num; i++) {
      http.get('http://smf:2000', (resp) => {
        var str = '';
        resp.on('data', function(chunk) {
          str += chunk;
        });
        resp.on('end', function() {
          arr.push(str);
        });
      }).on('error', (error) => {
        info1 = error.message;
      });
    }
    for (var i = 0; i < 4; i++) {
      http.get('http://ausf:2000', (resp) => {
        var str = '';
        resp.on('data', function(chunk) {
          str += chunk;
        });
        resp.on('end', function() {
          arr.push(str);
        });
      }).on('error', (error) => {
        info1 = error.message;
      });
    }
    setTimeout(() => {
       var resp = '<html><body><h3>5G SBA ' + rel + '</h3>';
       for (const value of arr) {
         resp = resp + value + '<p>';
       }
       resp = resp + '</body></html>';
       res.send(resp);
       //res.send('<html><body><h3>Http-router ' + rel + '</h3>' + arr[1] + '<p>' + arr[2] + '<p>' + arr[3] + '<p>' + '</body></html>');
    }, 1000)
   } catch (error) {
     console.log(error.message);
     res.end();
   }
});