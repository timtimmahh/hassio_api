// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hassio_api/hassio_api.dart';

const token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIwN2M0NmU1YmI3YjQ0YWQ4YjdiMmRjOWMxY2FiMDQxZiIsImlhdCI6MTYzNjUxOTE5OCwiZXhwIjoxOTUxODc5MTk4fQ.nFus5sE-TKUi5mT7Yt6QGUYZSDIQ1RvvZKClzNltP2Q';

void main() {
  var hassio = HassIO(
      token: token, serverHost: 'condo-homeassistant.duckdns.org', ssl: true);
  group('Home Assistant REST APIs', () {
    test('Get Status', () async {
      expect(
          await hassio.restClient.getStatus(), Status(message: "API running."));
    });
    test('Get Config', () async {
      expect(
          await hassio.restClient.getConfig(),
          Config.fromJson(jsonDecode(
              '{"latitude": 38.958620390994575, "longitude": -77.33045698695379, "elevation": 0, "unit_system": {"length": "mi", "mass": "lb", "pressure": "psi", "temperature": "\u00b0F", "volume": "gal"}, "location_name": "Home", "time_zone": "America/New_York", "components": ["remote.roku", "network", "sensor.mobile_app", "yeelight", "device_tracker.mobile_app", "binary_sensor.updater", "cloud", "switch", "timer", "api", "homeassistant", "ssdp", "google_assistant", "media_player", "usb", "system_log", "image", "my", "trace", "input_select", "sensor.mqtt_room", "onboarding", "cast", "analytics", "binary_sensor.yeelight", "dhcp", "persistent_notification", "media_player.cast", "energy", "default_config", "input_number", "websocket_api", "group", "device_automation", "counter", "mobile_app", "switch.mqtt", "light.yeelight", "logbook", "mqtt", "binary_sensor.mqtt", "lovelace", "binary_sensor.upnp", "http", "remote", "input_datetime", "zone", "notify.mobile_app", "tag", "tts", "number", "updater", "light", "automation", "binary_sensor", "sensor.energy", "number.mqtt", "weather", "ipp", "media_player.roku", "binary_sensor.mobile_app", "sensor", "weather.met", "recorder", "webhook", "search", "map", "device_tracker", "samsungtv", "sun", "binary_sensor.hassio", "history", "blueprint", "binary_sensor.rpi_power", "tts.google_translate", "sensor.hassio", "auth", "system_health", "frontend", "stream", "sensor.upnp", "person", "upnp", "input_boolean", "zeroconf", "rpi_power", "hassio", "notify", "script", "media_player.samsungtv", "met", "input_text", "scene", "config", "media_source", "scene.homeassistant", "media_player.androidtv", "roku"], "config_dir": "/config", "whitelist_external_dirs": ["/config/www", "/media"], "allowlist_external_dirs": ["/config/www", "/media"], "allowlist_external_urls": [], "version": "2021.11.2", "config_source": "storage", "safe_mode": false, "state": "RUNNING", "external_url": null, "internal_url": null, "currency": "USD"}')));
    });
  });

  group('Home Assistant Websocket APIs', () {
    // var auth = await doAuth(hassUrl: '${hassio.ssl ? 'https://' : 'http://'}${hassio.serverHost}:${hassio.serverPort}');
    // print('Auth data: $auth\n');
    // var connection = await createConnection(auth);
    // print('Connection data: $connection\n');
  });
}
