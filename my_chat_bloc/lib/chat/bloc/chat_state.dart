part of 'chat_bloc.dart';

enum SocketStatus { initial, open, closed }

class ChatState extends Equatable {
  final SocketStatus status;
  final List<Message> data;

  const ChatState({
    this.status = SocketStatus.initial,
    this.data = const <Message>[],
  });

  ChatState copyWith({
    SocketStatus? status,
    List<Message>? data,
  }) {
    return ChatState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return '''ChatState { status: $status, data_length: ${data.length} }''';
  }

  @override
  List<Object> get props => [data, status];
}
