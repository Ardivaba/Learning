var express = require('express')
var PORT = 8080
var app = express()

app.get('/', function (req, res) {
  res.send('Hello from docker container...')
})

app.listen(PORT)
console.log('Running on http://localhost' + PORT)
