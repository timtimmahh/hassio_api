import 'dart:collection';
import 'dart:convert';

import 'package:hassio_api/api/websocket/event/event_subscription.dart';
import 'package:hassio_api/api/websocket/web_socket_models.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../hassio_api.dart' hide StateChange;

typedef CallbackFunc
    = MapEntry<dynamic Function(dynamic json), void Function(dynamic data)>;

class HassIOWebSocket {
  static int interactions = 0;
  final WebSocketChannel _channel;
  final _callbacks = <int, Map<String, CallbackFunc>>{};
  final String token;
  bool _authenticated = false;
  final _messageQueue = ListQueue<void Function()>();
  late final _eventSubscriptions = <String, EventSubscription>{};

  HassIOWebSocket(String url, this.token)
      : _channel = WebSocketChannel.connect(Uri.parse(url)) {
    _channel.stream.listen((event) {
      var jsonEvent = jsonDecode(event);
      // print(
      //     'Event data:\n${const JsonEncoder.withIndent('  ').convert(jsonEvent)}');
      if (_onEventInternal(jsonEvent)) {
        var callback = _callbacks[jsonEvent['id']]?[jsonEvent['type']];

        if (callback != null) {
          callback.value(callback.key(jsonEvent));
        }
      }
    });
  }

  bool get isAuthenticated => _authenticated;

  set isAuthenticated(bool value) {
    bool _shouldSendQueue = value && !isAuthenticated;
    _authenticated = value;
    if (_shouldSendQueue) {
      while (_messageQueue.isNotEmpty) {
        _messageQueue.removeFirst().call();
      }
    }
  }

  void _subscribeEvents(
      List<String> events, void Function<T>(T data) callback) {
    for (var event in events) {
      _subscribeEvent(event);
    }
  }

  void subscribeStateChanges(
      String entityId,
      void Function(
              Map<String, dynamic> oldState, Map<String, dynamic> newState)
          callback) {
    if (!_eventSubscriptions.containsKey('state_changed')) {
      _eventSubscriptions['state_changed'] =
          StateChangeSubscription.of(entityId, callback);
      _subscribeEvent('state_changed');
    } else {
      (_eventSubscriptions['state_changed'] as StateChangeSubscription)
          .subscribeEntity(entityId, callback);
    }
  }

  void subscribeTimeChanges(void Function(String time) onTimeChange) {
    if (!_eventSubscriptions.containsKey('time_changed')) {
      _eventSubscriptions['time_changed'] =
          TimeChangedSubscription(onTimeChange);
      _subscribeEvent('time_changed');
    } else {
      (_eventSubscriptions['time_changed'] as TimeChangedSubscription)
          .onTimeChange = onTimeChange;
    }
  }

  void subscribeServiceRegistered(
      void Function(String domain, String service) onServiceRegistered) {
    if (!_eventSubscriptions.containsKey('service_registered')) {
      _eventSubscriptions['service_registered'] =
          ServiceRegisteredSubscription(onServiceRegistered);
      _subscribeEvent('service_registered');
    } else {
      (_eventSubscriptions['service_registered']
              as ServiceRegisteredSubscription)
          .onServiceRegistered = onServiceRegistered;
    }
  }

  void subscribeCallService(
      void Function(String domain, String service,
              Map<String, dynamic> serviceData, String serviceCallId)
          onCallService) {
    if (!_eventSubscriptions.containsKey('call_service')) {
      _eventSubscriptions['call_service'] =
          CallServiceSubscription(onCallService);
      _subscribeEvent('call_service');
    } else {
      (_eventSubscriptions['call_service'] as CallServiceSubscription)
          .onCallService = onCallService;
    }
  }

  void subscribeAutomationReloaded(void Function() onAutomationReloaded) {
    if (!_eventSubscriptions.containsKey('automation_reloaded')) {
      _eventSubscriptions['automation_reloaded'] =
          AutomationReloadedSubscription(onAutomationReloaded);
      _subscribeEvent('automation_reloaded');
    } else {
      (_eventSubscriptions['automation_reloaded']
              as AutomationReloadedSubscription)
          .onAutomationReloaded = onAutomationReloaded;
    }
  }

  void subscribeSceneReloaded(void Function() onSceneReloaded) {
    if (!_eventSubscriptions.containsKey('scene_reloaded')) {
      _eventSubscriptions['scene_reloaded'] =
          SceneReloadedSubscription(onSceneReloaded);
      _subscribeEvent('scene_reloaded');
    } else {
      (_eventSubscriptions['scene_reloaded'] as SceneReloadedSubscription)
          .onSceneReloaded = onSceneReloaded;
    }
  }

  void subscribePlatformDiscovered(
      void Function(String service, Map<String, dynamic> discovered)
          onPlatformDiscovered) {
    if (!_eventSubscriptions.containsKey('platform_discovered')) {
      _eventSubscriptions['platform_discovered'] =
          PlatformDiscoveredSubscription(onPlatformDiscovered);
      _subscribeEvent('platform_discovered');
    } else {
      (_eventSubscriptions['platform_discovered']
              as PlatformDiscoveredSubscription)
          .onPlatformDiscovered = onPlatformDiscovered;
    }
  }

  void subscribeComponentLoaded(
      void Function(String component) onComponentLoaded) {
    if (!_eventSubscriptions.containsKey('component_loaded')) {
      _eventSubscriptions['component_loaded'] =
          ComponentLoadedSubscription(onComponentLoaded);
      _subscribeEvent('component_loaded');
    } else {
      (_eventSubscriptions['component_loaded'] as ComponentLoadedSubscription)
          .onComponentLoaded = onComponentLoaded;
    }
  }

  void _subscribeEvent(String? event) {
    // if (!_eventSubscriptions.containsKey(event)) {
    //   throw StateError('Already subscribed to the event type $event');
    // }
    var callbacks = <String, CallbackFunc>{
      'result': MapEntry((json) => DefaultResponse.fromJson(json), (data) {})
    };
    switch (event) {
      case 'state_changed':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;
          (_eventSubscriptions[d.event.eventType] as StateChangeSubscription)
              .fireSubscription(d.event.data as StateChange);
        });
        break;
      case 'time_changed':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;
          (_eventSubscriptions[d.event.eventType] as TimeChangedSubscription)
              .fireSubscription(d.event.data as TimeChange);
        });
        break;
      case 'service_registered':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;
          (_eventSubscriptions[d.event.eventType]
                  as ServiceRegisteredSubscription)
              .fireSubscription(d.event.data as ServiceRegistered);
        });
        break;
      case 'call_service':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;
          (_eventSubscriptions[d.event.eventType] as CallServiceSubscription)
              .fireSubscription(d.event.data as CallService);
        });
        break;
      case 'automation_reloaded':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;
          (_eventSubscriptions[d.event.eventType]
                  as AutomationReloadedSubscription)
              .fireSubscription(d.event.data as AutomationReloaded);
        });
        break;
      case 'scene_reloaded':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;
          (_eventSubscriptions[d.event.eventType] as SceneReloadedSubscription)
              .fireSubscription(d.event.data as SceneReloaded);
        });
        break;
      case 'platform_discovered':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;
          (_eventSubscriptions[d.event.eventType]
                  as PlatformDiscoveredSubscription)
              .fireSubscription(d.event.data as PlatformDiscovered);
        });
        break;
      case 'component_loaded':
        callbacks['event'] =
            MapEntry((json) => EventResponse.fromJson(json), (data) {
          var d = data as EventResponse;

          (_eventSubscriptions[d.event.eventType]
                  as ComponentLoadedSubscription)
              .fireSubscription(d.event.data as ComponentLoaded);
        });
        break;
      default:
        break;
    }
    _sendMessage(_eventSubscriptions[event]!.request, callbacks);
  }

  void unsubscribeEvent(String? eventType) {
    if (!_eventSubscriptions.containsKey(eventType)) {
      throw StateError('$eventType is not currently subscribed');
    }
    _sendMessage(
        UnsubscribeRequest(_eventSubscriptions[eventType]!.request.id));
  }

  void callService(String domain, String service,
          [Map<String, dynamic>? serviceData, Map<String, dynamic>? target]) =>
      _sendMessage(ServiceMessage(domain, service, serviceData, target), {
        'result': MapEntry(
            (json) => ServiceResponse.fromJson(json), (dynamic data) {})
      });

  void getStates(void Function(List<State>? states) callback) =>
      _sendMessage(StateMessage(), {
        'result':
            MapEntry((json) => StateResponse.fromJson(json), (dynamic data) {
          callback((data as StateResponse).result);
        })
      });

  void getConfig(void Function(ConfigResponse data)? callback) =>
      _sendMessage(ConfigMessage(), {
        'result': MapEntry((json) => ConfigResponse.fromJson(json), (data) {
          callback?.call(data as ConfigResponse);
        })
      });

  void getServices(void Function(ServicesResponse data)? callback) =>
      _sendMessage(ServicesMessage(), {
        'result': MapEntry((json) => ServicesResponse.fromJson(json), (data) {
          callback?.call(data as ServicesResponse);
        })
      });

  void getPanels(void Function(PanelResponse data)? callback) =>
      _sendMessage(PanelsMessage(), {
        'result': MapEntry((json) => PanelResponse.fromJson(json), (data) {
          callback?.call(data as PanelResponse);
        })
      });

  void close([int? closeCode, String? closeReason]) async =>
      await _channel.sink.close(closeCode, closeReason);

  void _sendMessage<T extends CommandMessage>(T message,
      [Map<String, CallbackFunc>? callbacks]) {
    if (!isAuthenticated) {
      print(
          'Authentication is required to send messages. Adding message to queue.');
      _messageQueue.add(() => _sendMessage(message, callbacks));
      return;
    }
    if (_callbacks.containsKey(message.id)) {
      throw ArgumentError.value(
          message.id, 'id', 'Message id has already been sent.');
    }
    _callbacks[message.id] = callbacks ?? <String, CallbackFunc>{};
    _channel.sink.add(jsonEncode(message));
  }

  bool _onEventInternal(dynamic json) {
    if (json is Map<String, dynamic>) {
      switch (json['type']) {
        case 'auth_required':
          print('Authentication Required: version=${json['ha_version']}');
          isAuthenticated = false;
          _channel.sink
              .add(jsonEncode({"type": "auth", "access_token": token}));
          return false;
        case 'auth_ok':
          isAuthenticated = true;
          print('Authentication Successful: version=${json['ha_version']}');
          break;
        case 'auth_invalid':
          isAuthenticated = false;
          print('Invalid Authentication: ${json['message']}\n');
          break;
        default:
          return true;
      }
    } else {
      return false;
    }
    return true;
  }
}
