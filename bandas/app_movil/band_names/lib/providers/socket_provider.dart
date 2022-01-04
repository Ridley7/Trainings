
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting,
}

class SocketProvider with ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;

  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  //Constructor
  SocketProvider(){
    this._initConfig();
  }

  void _initConfig(){
    // Dart client
    //Esta es la IPv4 que me da ipconfig
    _socket = IO.io('http://192.168.1.134:3000/', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    _socket.on('connect', (_){
      print("Conectando en flutter");
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.on('disconnect', (_){
      print("Desconentadome de flutter");
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

  }
}

