import 'package:dio/dio.dart';
import 'package:hassio_api/api/rest/hassio_client.dart';

import 'websocket/hassio_web_socket.dart';

class HassIO {
  String token;
  String serverHost;
  int serverPort;
  bool ssl;

  HassIOClient? _restClient;
  HassIOWebSocket? _webSocket;

  HassIO(
      {required this.token,
      required this.serverHost,
      this.serverPort = 8123,
      this.ssl = false});

  HassIOClient get restClient => _restClient ??= HassIOClient(
      Dio()
        ..options.headers.addAll({
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        }),
      baseUrl: '${_securify('http')}://$serverHost:$serverPort/api');

  HassIOWebSocket get webSocket => _webSocket ??= HassIOWebSocket(
      '${_securify('ws')}://$serverHost:$serverPort/api/websocket', token);

  String _securify(String prefix) => ssl ? '${prefix}s' : prefix;
}
