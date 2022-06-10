// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hassio_api/hassio_api.dart';

const token = 'YOUR-HOMEASSISTANT-TOKEN';

void main() {
  var hassio = HassIO(
      token: token, serverHost: 'homeassistant.local', ssl: true);
  group('Home Assistant REST APIs', () {
    test('Get Status', () async {
      expect(
          await hassio.restClient.getStatus(), Status(message: "API running."));
    });
    test('Get Config', () async {
      expect(
          await hassio.restClient.getConfig(),
    });
  });

  group('Home Assistant Websocket APIs', () {
    // var auth = await doAuth(hassUrl: '${hassio.ssl ? 'https://' : 'http://'}${hassio.serverHost}:${hassio.serverPort}');
    // print('Auth data: $auth\n');
    // var connection = await createConnection(auth);
    // print('Connection data: $connection\n');
  });
}
