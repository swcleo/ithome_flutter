import WebSocket, { WebSocketServer } from "ws";
import { UniqueID } from "nodejs-snowflake";
import { createServer } from "http";
import url from "url";

const uid = new UniqueID();

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

  if (!query.token) {
    // 身分驗證
    callback(new Error("token is no defined"));
    return;
  }

  callback(null, new User(query.token));
}

wss.on("connection", function connection(ws, request, user) {
  ws.on("message", function message(msg) {
    console.log(`Received message from user ${user.name}`);

    var data = msg.toString();

    var json

    try {
      json = JSON.parse(data);
    } catch (e) {
      console.error(e.toString());
      json = {};
    }

    if (json.eventName === "chat:send") {
      const obj = { eventName: "chat:msg", mid: uid.getUniqueID(), by: user.name, msg: json.data, time: Date.now() };

      wss.clients.forEach(function each(client) {
        if (client.readyState === WebSocket.OPEN) {
          client.send(JSON.stringify(obj));
        }
      });
    }
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
