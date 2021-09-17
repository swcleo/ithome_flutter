import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

class Connection {
  bool _connected = false;

  Uri uri;

  late IOWebSocketChannel _channel;

  late StreamSubscription _subscription;

  PublishSubject<dynamic> stream = PublishSubject();

  BehaviorSubject<bool> connected = BehaviorSubject();

  Connection({required this.uri}) {
    _connect();
  }

  _connect() {
    if (_connected) {
      _subscription.cancel();
    }
    _channel = IOWebSocketChannel.connect(uri);
    _connected = true;

    _subscription =
        _channel.stream.listen(_onMessage, onError: _onError, onDone: _onDone);

    connected.add(_connected);
  }

  void reconnect({Uri? uri}) {
    if (uri != null) {
      this.uri = uri;
    }
    _connect();
  }

  trigger(dynamic message) {
    _channel.sink.add(json.encode(message));
  }

  void _onMessage(dynamic message) {
    stream.add(jsonDecode(message));
  }

  void _onError(e) {
    stream.addError(e);
  }

  void _onDone() {
    _connected = false;
    connected.add(_connected);
  }
}
