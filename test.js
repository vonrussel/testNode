// Generated by CoffeeScript 1.6.3
(function() {
    var http = require("http"),
        WebSocketServer = require("ws").Server,
        url = require("url"),
        _ = require("underscore"),
        server;

    http = require("http");

    server = http.createServer(function(request, response) {
        console.log(url.parse(request.url, true));
        response.writeHead(200, {
            "Content-Type": "text/plain"
        });
        response.write("Hello World");
        return response.end();
    }).listen(process.env.PORT || 5000);

    var wss = new WebSocketServer({server: server});
    console.log('websocket server created');
    wss.on('connection', function(ws) {
        var id = setInterval(function() {
            ws.send(JSON.stringify(new Date()), function() {  });
        }, 1000);

        console.log('websocket connection open');
        ws.on('close', function() {
            console.log('websocket connection close');
            clearInterval(id);
        });
    });

}).call(this);
