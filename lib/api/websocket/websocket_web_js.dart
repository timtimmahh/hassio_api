// import 'dart:html';
@JS('Websocket')
library websocket.js;

import 'package:js/js.dart';

@JS()
class AuthData {
  external String hassUrl;
  external String? clientId;
  external num expires;
  external String refreshToken;
  external String accessToken;
  external num expiresIn;
}

@JS()
class getAuthOptions {
  external String? hassUrl;
  external String? clientId;
  external String? redirectUrl;
  external String? authCode;
  external void Function(AuthData? data)? saveTokens;
  external Future<AuthData?> Function()? loadTokens;
}

/*class Auth {
  void Function(AuthData? data)? _saveTokens;
  AuthData data;

  Auth(this.data, void Function(AuthData? data)? saveTokens)
      : _saveTokens = saveTokens;

  String get wsUrl => 'ws${data.hassUrl.substring(4)}/api/websocket';

  String get accessToken => data.accessToken;

  bool get expired =>
      DateTime
          .now()
          .millisecondsSinceEpoch > data.expires;

  Future<void> refreshAccessToken() async {
    if (this.data.refreshToken.isEmpty)
      throw ArgumentError("No refresh_token");
    final data = await tokenRequest(this.data.hassUrl, this.data.clientId, {
      'grant_type': 'refresh_token',
      'refresh_token': this.data.refreshToken
    });
    data['refresh_token'] = this.data.refreshToken;
    this.data = data;
    if (_saveTokens != null) {
      _saveTokens!(data);
    }
  }

  Future<void> revoke() async {
    if (data.refreshToken.isEmpty)
      throw ArgumentError("No refresh_token to revoke");

    final formData = FormData()
      ..append("action", "revoke")..append("token", data.refreshToken);

    await fetch
  }
}*/

@JS()
class Auth {
  external void Function(AuthData? data) get _saveTokens;

  external set _saveTokens(void Function(AuthData? data) value);

  external AuthData get data;

  external set data(AuthData value);

  external factory Auth(
      AuthData data, void Function(AuthData? data)? saveTokens);

  external String get wsUrl;

  external String get accessToken;

  external bool get expired;

  external Future<void> refreshAccessToken();

  external Future<void> revoke();
}

@JS()
class ConnectionOptions {
  external num setupRetry;
  external Auth? auth;
  external Future<HaWebSocket> Function(ConnectionOptions options) createSocket;
}

@JS()
class EventTarget {
  external void addEventListener(
      String type, dynamic callback, dynamic options);

  external bool dispatchEvent(dynamic event);

  external void removeEventListener(
      String type, dynamic callback, dynamic options);
}

@JS()
class WebSocket extends EventTarget {
  external dynamic binaryType;

  external num get bufferedAmount;

  external String get extensions;

  /*external dynamic Function()onclose: ((this: WebSocket, ev: CloseEvent) => any) | null;
  onerror: ((this: WebSocket, ev: Event) => any) | null;
  onmessage: ((this: WebSocket, ev: MessageEvent) => any) | null;
  onopen: ((this: WebSocket, ev: Event) => any) | null;*/
  external String get protocol;

  external num get readyState;

  external String get url;

  external void close(num? code, String? reason);

  external void send(dynamic data);

  external num get CLOSED;

  external num get CLOSING;

  external num get CONNECTING;

  external num get OPEN;
/*external void addEventListener<K extends  WebSocketEventMap>(K type, listener: (this: WebSocket, ev: WebSocketEventMap[K]) => any, options?: boolean | AddEventListenerOptions): void;
  addEventListener(type: string, listener: EventListenerOrEventListenerObject, options?: boolean | AddEventListenerOptions): void;
  removeEventListener<K extends keyof WebSocketEventMap>(type: K, listener: (this: WebSocket, ev: WebSocketEventMap[K]) => any, options?: boolean | EventListenerOptions): void;
  removeEventListener(type: string, listener: EventListenerOrEventListenerObject, options?: boolean | EventListenerOptions): void;*/
}

@JS()
class HaWebSocket extends WebSocket {
  external String haVersion;
}

@JS()
class Connection {
  external ConnectionOptions options;
  external num commandId;
  external Map<num, dynamic> commands;
  external Map<String, dynamic> eventListeners;
  external bool closeRequested;
  external Future<void>? suspendReconnectPromise;
  external HaWebSocket socket;

  external factory Connection(HaWebSocket socket, ConnectionOptions options);

  external String get haVersion;

  external bool get connected;

  external void setSocket(HaWebSocket socket);

  external void suspendReconnectUntil(Future<void> suspendPromise);

  external void suspend();

  external void close();
}

external Future<Auth> doAuth(getAuthOptions options
    /*{String? hassUrl,
        String? clientId,
        String? redirectUrl,
        void Function(AuthData? data)? saveTokens,
        Future<AuthData?> Function()? loadTokens,
        String? authCode}*/
    ) /* =>
    js.context.callMethod('doAuth', [
      {
        'hassUrl': hassUrl,
        'clientId': clientId,
        'redirectUrl': redirectUrl,
        'authCode': authCode,
        'saveTokens': saveTokens,
        'loadTokens': loadTokens
      }
    ])*/
;

external Future<Connection> createConnection(ConnectionOptions? options);
