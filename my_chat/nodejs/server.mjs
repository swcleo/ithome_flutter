import WebSocket, { WebSocketServer } from "ws";
import { createServer } from "http";
import url from "url";

const server = createServer();

const wss = new WebSocketServer({
  noServer: true,
});

class User {
  constructor(name) {
    this.name = name;
  }
}

function authenticate(request, callback) {
  const { query } = url.parse(request.url, true);

  if (!query.name) {
    callback(new Error("name is no defined"));
    return;
  }

  callback(null, new User(query.name));
}

wss.on("connection", function connection(ws, request, user) {
  ws.on("message", function message(msg) {
    console.log(`Received message ${msg} from user ${user.name}`);

    wss.clients.forEach(function each(client) {
      if (client.readyState === WebSocket.OPEN) {
        const obj = { from: user.name, msg: msg.toString(), time: Date.now() };
        client.send(JSON.stringify(obj));
      }
    });
  });
});

server.on("upgrade", function upgrade(request, socket, head) {
  authenticate(request, (err, client) => {
    if (err || !client) {
      socket.write("HTTP/1.1 401 Unauthorized\r\n\r\n");
      socket.destroy();
      return;
    }

    wss.handleUpgrade(request, socket, head, function done(ws) {
      wss.emit("connection", ws, request, client);
    });
  });
});

server.listen(8000);
