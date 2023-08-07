// ignore_for_file: library_prefixes

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  onLine,
  offLine,
  conencting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.conencting;
  late IO.Socket _socket;

  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  ServerStatus get serverStatus => _serverStatus;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    // Dart client
    _socket = IO.io('http://192.168.104.12:3000/', {
      'transports': ['websocket'],
      "autoConnect": true,
    });

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.onLine;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offLine;
      notifyListeners();
    });

    _socket.on('nuevo-mensaje', (payload) {
      print('nuevo-mensaje $payload');
    });
  }
}
