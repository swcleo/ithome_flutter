// ignore_for_file: avoid_print, invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/core/chat_db.dart';
import 'package:my_chat/core/connection.dart';
import 'package:my_chat/models/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final Connection _connection;
  final ScrollController controller = ScrollController();

  ChatDB db = ChatDB();

  StreamSubscription? _connectionSubscription;
  StreamSubscription? _stausSubscription;

  ChatBloc(this._connection) : super(const ChatState()) {
    on<ChatReceiveMessage>(_onMessage);
    on<ChatSocketStatusChange>(_onStateChange);
    on<ChatDBInit>(_initDB);

    add(ChatDBInit());
  }

  void _initDB(event, emit) async {
    emit(state.copyWith(data: await db.query()));

    _connectionSubscription = _connection.connected.listen((bool status) {
      add(ChatSocketStatusChange(status));
    });
    _connectionSubscription = _connection.stream.listen((data) {
      if (data["eventName"] == "chat:msg") {
        add(ChatReceiveMessage(Message.fromJson(data)));
      }
    });

    _autoScroll(firstTime: true);
  }

  void _onMessage(ChatReceiveMessage event, emit) async {
    await db.insert(event.msg);

    emit(state.copyWith(
      data: List.of(state.data)..add(event.msg),
    ));

    _autoScroll();
  }

  void _autoScroll({bool firstTime = false}) {
    Future.delayed(const Duration(milliseconds: 100), () {
      final offset = controller.position.maxScrollExtent - controller.offset;

      // 大於一列且小於二列時自動移動
      if (offset > 70 && offset < 140 && !controller.position.outOfRange) {
        controller.jumpTo(controller.position.maxScrollExtent);
      }

      if (firstTime && offset > 70) {
        controller.jumpTo(controller.position.maxScrollExtent);
        return;
      }
    });
  }

  void _onStateChange(ChatSocketStatusChange event, emit) {
    emit(state.copyWith(
      status: event.status ? SocketStatus.open : SocketStatus.closed,
    ));
  }

  void send(String text) {
    _connection.trigger(ChatSendEvent(text).toJson());
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    _stausSubscription?.cancel();
    controller.dispose();
    return super.close();
  }

  void reconnect() {
    _connection.reconnect();
  }
}
