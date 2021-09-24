part of 'chat_bloc.dart';

// Chat Bloc Event
abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatReceiveMessage extends ChatEvent {
  final Message msg;
  const ChatReceiveMessage(this.msg);
}

class ChatSocketStatusChange extends ChatEvent {
  final bool status;
  const ChatSocketStatusChange(this.status);
}

class ChatDBInit extends ChatEvent {}

// Chat SocketEvent Model
class ChatSocketEvent {}

class ChatSendEvent extends ChatSocketEvent {
  final String eventName = "chat:send";
  final String message;

  ChatSendEvent(this.message);

  Map<String, dynamic> toJson() {
    return {"eventName": eventName, "data": message};
  }
}
