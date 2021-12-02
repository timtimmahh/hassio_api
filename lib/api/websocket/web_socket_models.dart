import 'package:hassio_api/api/rest/rest_models.dart';
import 'package:hassio_api/api/websocket/hassio_web_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_socket_models.g.dart';

// @JsonSerializable()
class BaseMessage {
  String? type;

  BaseMessage(this.type);

// factory BaseMessage.fromJson(Map<String, dynamic> json) =>
//     _$BaseMessageFromJson(json);
// Map<String, dynamic> toJson() => _$BaseMessageToJson(this);
}

// @JsonSerializable()
class CommandMessage extends BaseMessage {
  // @JsonKey(name: 'id')
  int id;

  CommandMessage(String? type, [int? id])
      : id = id ?? ++HassIOWebSocket.interactions,
        super(type);

// @JsonKey(ignore: true)
// int get id => _id;

// factory CommandMessage.fromJson(Map<String, dynamic> json) =>
//     _$CommandMessageFromJson(json);

// @override
// Map<String, dynamic> toJson() => _$CommandMessageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthRequired extends BaseMessage {
  String haVersion;

  AuthRequired(this.haVersion) : super('auth_required');

  factory AuthRequired.fromJson(Map<String, dynamic> json) =>
      _$AuthRequiredFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$AuthRequiredToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthOk extends BaseMessage {
  String haVersion;

  AuthOk(this.haVersion) : super('auth_ok');

  factory AuthOk.fromJson(Map<String, dynamic> json) => _$AuthOkFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$AuthOkToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthInvalid extends BaseMessage {
  String message;

  AuthInvalid(this.message) : super('auth_invalid');

  factory AuthInvalid.fromJson(Map<String, dynamic> json) =>
      _$AuthInvalidFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$AuthInvalidToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthMessage extends BaseMessage {
  String accessToken;

  AuthMessage(this.accessToken) : super('auth');

  factory AuthMessage.fromJson(Map<String, dynamic> json) =>
      _$AuthMessageFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$AuthMessageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SubscribeRequest extends CommandMessage {
  String? eventType;

  SubscribeRequest(this.eventType) : super('subscribe_events');

  factory SubscribeRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscribeRequestFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$SubscribeRequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UnsubscribeRequest extends CommandMessage {
  int subscription;

  UnsubscribeRequest(this.subscription) : super('unsubscribe_events');

  factory UnsubscribeRequest.fromJson(Map<String, dynamic> json) =>
      _$UnsubscribeRequestFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$UnsubscribeRequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ServiceMessage extends CommandMessage {
  String domain;
  String service;
  Map<String, dynamic>? serviceData;
  Map<String, dynamic>? target;

  ServiceMessage(this.domain, this.service, this.serviceData, this.target)
      : super('call_service');

  factory ServiceMessage.fromJson(Map<String, dynamic> json) =>
      _$ServiceMessageFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$ServiceMessageToJson(this);
}

@JsonSerializable()
class StateMessage extends CommandMessage {
  StateMessage() : super('get_states');

  factory StateMessage.fromJson(Map<String, dynamic> json) =>
      _$StateMessageFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$StateMessageToJson(this);
}

@JsonSerializable()
class ConfigMessage extends CommandMessage {
  ConfigMessage() : super('get_config');

  factory ConfigMessage.fromJson(Map<String, dynamic> json) =>
      _$ConfigMessageFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$ConfigMessageToJson(this);
}

@JsonSerializable()
class ServicesMessage extends CommandMessage {
  ServicesMessage() : super('get_services');

  factory ServicesMessage.fromJson(Map<String, dynamic> json) =>
      _$ServicesMessageFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$ServicesMessageToJson(this);
}

@JsonSerializable()
class PanelsMessage extends CommandMessage {
  PanelsMessage() : super('get_panels');

  factory PanelsMessage.fromJson(Map<String, dynamic> json) =>
      _$PanelsMessageFromJson(json);

  // @override
  Map<String, dynamic> toJson() => _$PanelsMessageToJson(this);
}

class ResponseMessage<T> extends CommandMessage {
  bool success;
  T? result;

  ResponseMessage(this.success, this.result, [int? id]) : super('result', id);

// factory ResponseMessage.fromJson(Map<String, dynamic> json) =>
//     ResponseMessage(json['success'], json['result'], json['id']);

// @override
// Map<String, dynamic> toJson() =>
//     {'id': id, 'type': 'result', 'success': success, 'result': result};
}

@JsonSerializable()
class DefaultResponse extends ResponseMessage<dynamic> {
  DefaultResponse(bool success, [int? id]) : super(success, null, id);

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);
// @override
// Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}

@JsonSerializable()
class StateResponse extends ResponseMessage<List<State>> {
  StateResponse(bool success, List<State>? result, [int? id])
      : super(success, result, id);

  factory StateResponse.fromJson(Map<String, dynamic> json) =>
      _$StateResponseFromJson(json);

// @override
// Map<String, dynamic> toJson() => _$StateResponseToJson(this);
}

@JsonSerializable()
class ConfigResponse extends ResponseMessage<Config> implements CommandMessage {
  ConfigResponse(bool success, Config? result, [int? id])
      : super(success, result, id);

  factory ConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigResponseFromJson(json);

// @override
// Map<String, dynamic> toJson() => _$ConfigResponseToJson(this);
}

@JsonSerializable()
class ServiceResponse extends ResponseMessage<Service> {
  ServiceResponse(bool success, Service? result, [int? id])
      : super(success, result, id);

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);

// @override
// Map<String, dynamic> toJson() => _$ServiceResponseToJson(this);
}

@JsonSerializable()
class ServicesResponse extends ResponseMessage<List<Service>> {
  ServicesResponse(bool success, List<Service>? result, [int? id])
      : super(success, result, id);

  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);

// @override
// Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}

@JsonSerializable()
class PanelResponse extends ResponseMessage<List<Map<String, dynamic>>> {
  PanelResponse(bool success, List<Map<String, dynamic>>? result, [int? id])
      : super(success, result, id);

  factory PanelResponse.fromJson(Map<String, dynamic> json) =>
      _$PanelResponseFromJson(json);

// @override
// Map<String, dynamic> toJson() => _$PanelResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class EventResponse extends CommandMessage {
  Event event;

  EventResponse(this.event, [int? id]) : super('event', id);

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
// @override
// Map<String, dynamic> toJson() => _$EventResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class EventBase {
  String? origin;
  String? timeFired;
  Context context;

  EventBase(this.origin, this.timeFired, this.context);

  factory EventBase.fromJson(Map<String, dynamic> json) =>
      _$EventBaseFromJson(json);

  Map<String, dynamic> toJson() => _$EventBaseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Context {
  String? id;
  String? userId;

  Context(this.id, this.userId);

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);

  Map<String, dynamic> toJson() => _$ContextToJson(this);
}

// @JsonSerializable(fieldRename: FieldRename.snake)
class Event<T> extends EventBase {
  String? eventType;
  T data;

  Event(String? origin, String? timeFired, Context context, this.eventType,
      this.data)
      : super(origin, timeFired, context);

  factory Event.fromJson(Map<String, dynamic> json) {
    var timeFired = json['time_fired'] as String?;
    var origin = json['origin'] as String?;
    var context = Context.fromJson(json['context'] as Map<String, dynamic>);
    var eventType = json['event_type'] as String?;
    switch (eventType) {
      case 'state_changed':
        return Event<StateChange>(origin, timeFired, context, eventType,
            StateChange.fromJson(json['data'])) as Event<T>;
      case 'time_changed':
        return Event<TimeChange>(origin, timeFired, context, eventType,
            TimeChange.fromJson(json['data'])) as Event<T>;
      case 'service_registered':
        return Event<ServiceRegistered>(origin, timeFired, context, eventType,
            ServiceRegistered.fromJson(json['data'])) as Event<T>;
      case 'call_service':
        return Event<CallService>(origin, timeFired, context, eventType,
            CallService.fromJson(json['data'])) as Event<T>;
      case 'automation_reloaded':
        return Event<AutomationReloaded>(origin, timeFired, context, eventType,
            AutomationReloaded.fromJson(json['data'])) as Event<T>;
      case 'scene_reloaded':
        return Event<SceneReloaded>(origin, timeFired, context, eventType,
            SceneReloaded.fromJson(json['data'])) as Event<T>;
      case 'platform_discovered':
        return Event<PlatformDiscovered>(origin, timeFired, context, eventType,
            PlatformDiscovered.fromJson(json['data'])) as Event<T>;
      case 'component_loaded':
        return Event<ComponentLoaded>(origin, timeFired, context, eventType,
            ComponentLoaded.fromJson(json['data'])) as Event<T>;
      default:
        return Event<Map<String, dynamic>>(
            origin, timeFired, context, eventType, json['data']) as Event<T>;
    }
  }
// @override
// Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StateChange {
  String entityId;
  Map<String, dynamic> oldState;
  Map<String, dynamic> newState;

  StateChange(this.entityId, this.oldState, this.newState);

  factory StateChange.fromJson(Map<String, dynamic> json) =>
      _$StateChangeFromJson(json);
}

@JsonSerializable()
class TimeChange {
  String now;

  TimeChange(this.now);

  factory TimeChange.fromJson(Map<String, dynamic> json) =>
      _$TimeChangeFromJson(json);
}

@JsonSerializable()
class ServiceRegistered {
  String domain;
  String service;

  ServiceRegistered(this.domain, this.service);

  factory ServiceRegistered.fromJson(Map<String, dynamic> json) =>
      _$ServiceRegisteredFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CallService {
  String domain;
  String service;
  Map<String, dynamic> serviceData;
  String serviceCallId;

  CallService(this.domain, this.service, this.serviceData, this.serviceCallId);

  factory CallService.fromJson(Map<String, dynamic> json) =>
      _$CallServiceFromJson(json);
}

@JsonSerializable()
class AutomationReloaded {
  AutomationReloaded();

  factory AutomationReloaded.fromJson(Map<String, dynamic> json) =>
      _$AutomationReloadedFromJson(json);
}

@JsonSerializable()
class SceneReloaded {
  SceneReloaded();

  factory SceneReloaded.fromJson(Map<String, dynamic> json) =>
      _$SceneReloadedFromJson(json);
}

@JsonSerializable()
class PlatformDiscovered {
  String service;
  Map<String, dynamic> discovered;

  PlatformDiscovered(this.service, this.discovered);

  factory PlatformDiscovered.fromJson(Map<String, dynamic> json) =>
      _$PlatformDiscoveredFromJson(json);
}

@JsonSerializable()
class ComponentLoaded {
  String component;

  ComponentLoaded(this.component);

  factory ComponentLoaded.fromJson(Map<String, dynamic> json) =>
      _$ComponentLoadedFromJson(json);
}
