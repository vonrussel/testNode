# Generated by CoffeeScript 1.6.3
(->
  http = require("http")
  WebSocketServer = require("ws").Server
  url = require("url")
  _ = require("underscore")
  ip = process.env.OPENSHIFT_NODEJS_IP or "127.0.0.1"
  port = process.env.OPENSHIFT_NODEJS_PORT or 8080
  server = undefined
  http = require("http")
  server = http.createServer((request, response) ->
    response.writeHead 200,
      "Content-Type": "text/plain"

    response.write "Hello World"
    response.end()
  ).listen(port, ip)
  wss = new WebSocketServer(server: server)
  console.log "websocket server created"
  wss.on "connection", (ws) ->
    id = setInterval(->
      ws.send JSON.stringify(new Date()), ->

    , 1000)
    console.log "websocket connection open"
    ws.on "close", ->
      console.log "websocket connection close"
      clearInterval id


  console.log "Server is running at " + ip + ":" + port
).call this
