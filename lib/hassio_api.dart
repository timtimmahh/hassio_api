import 'dart:convert';

import 'api/hassio.dart';

export 'api/hassio.dart';
export 'api/rest/hassio_client.dart';
export 'api/rest/rest_models.dart';
export 'api/websocket/hassio_web_socket.dart';

const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIwN2M0NmU1YmI3YjQ0YWQ4YjdiMmRjOWMxY2FiMDQxZiIsImlhdCI6MTYzNjUxOTE5OCwiZXhwIjoxOTUxODc5MTk4fQ.nFus5sE-TKUi5mT7Yt6QGUYZSDIQ1RvvZKClzNltP2Q';

void main() async {
  var hassio = HassIO(
      token: token, serverHost: 'condo-homeassistant.duckdns.org', ssl: true);
  /*group('Home Assistant REST APIs', () {
    test('Get Status', () async {
      expect(
          await hassio.restClient.getStatus(), Status(message: "API running."));
    });
  });*/
  hassio.webSocket.getConfig((data) {
    print('Config data:\n${const JsonEncoder.withIndent('  ').convert(data)}');
  });
  /*var auth = await doAuth(getAuthOptions()..hassUrl = '${hassio.ssl ? 'https://' : 'http://'}${hassio.serverHost}:${hassio.serverPort}');
  print('Auth data: $auth\n');
  var connection = await createConnection(ConnectionOptions()..auth = auth);
  print('Connection data: $connection\n');*/
}
