// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequired _$AuthRequiredFromJson(Map<String, dynamic> json) => AuthRequired(
      json['ha_version'] as String,
    )..type = json['type'] as String?;

Map<String, dynamic> _$AuthRequiredToJson(AuthRequired instance) =>
    <String, dynamic>{
      'type': instance.type,
      'ha_version': instance.haVersion,
    };

AuthOk _$AuthOkFromJson(Map<String, dynamic> json) => AuthOk(
      json['ha_version'] as String,
    )..type = json['type'] as String?;

Map<String, dynamic> _$AuthOkToJson(AuthOk instance) => <String, dynamic>{
      'type': instance.type,
      'ha_version': instance.haVersion,
    };

AuthInvalid _$AuthInvalidFromJson(Map<String, dynamic> json) => AuthInvalid(
      json['message'] as String,
    )..type = json['type'] as String?;

Map<String, dynamic> _$AuthInvalidToJson(AuthInvalid instance) =>
    <String, dynamic>{
      'type': instance.type,
      'message': instance.message,
    };

AuthMessage _$AuthMessageFromJson(Map<String, dynamic> json) => AuthMessage(
      json['access_token'] as String,
    )..type = json['type'] as String?;

Map<String, dynamic> _$AuthMessageToJson(AuthMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'access_token': instance.accessToken,
    };

SubscribeRequest _$SubscribeRequestFromJson(Map<String, dynamic> json) =>
    SubscribeRequest(
      json['event_type'] as String?,
    )
      ..type = json['type'] as String?
      ..id = json['id'] as int;

Map<String, dynamic> _$SubscribeRequestToJson(SubscribeRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'event_type': instance.eventType,
    };

UnsubscribeRequest _$UnsubscribeRequestFromJson(Map<String, dynamic> json) =>
    UnsubscribeRequest(
      json['subscription'] as int,
    )
      ..type = json['type'] as String?
      ..id = json['id'] as int;

Map<String, dynamic> _$UnsubscribeRequestToJson(UnsubscribeRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'subscription': instance.subscription,
    };

ServiceMessage _$ServiceMessageFromJson(Map<String, dynamic> json) =>
    ServiceMessage(
      json['domain'] as String,
      json['service'] as String,
      json['service_data'] as Map<String, dynamic>?,
      json['target'] as Map<String, dynamic>?,
    )
      ..type = json['type'] as String?
      ..id = json['id'] as int;

Map<String, dynamic> _$ServiceMessageToJson(ServiceMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  val['id'] = instance.id;
  val['domain'] = instance.domain;
  val['service'] = instance.service;
  writeNotNull('service_data', instance.serviceData);
  writeNotNull('target', instance.target);
  return val;
}

StateMessage _$StateMessageFromJson(Map<String, dynamic> json) => StateMessage()
  ..type = json['type'] as String?
  ..id = json['id'] as int;

Map<String, dynamic> _$StateMessageToJson(StateMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };

ConfigMessage _$ConfigMessageFromJson(Map<String, dynamic> json) =>
    ConfigMessage()
      ..type = json['type'] as String?
      ..id = json['id'] as int;

Map<String, dynamic> _$ConfigMessageToJson(ConfigMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };

ServicesMessage _$ServicesMessageFromJson(Map<String, dynamic> json) =>
    ServicesMessage()
      ..type = json['type'] as String?
      ..id = json['id'] as int;

Map<String, dynamic> _$ServicesMessageToJson(ServicesMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };

PanelsMessage _$PanelsMessageFromJson(Map<String, dynamic> json) =>
    PanelsMessage()
      ..type = json['type'] as String?
      ..id = json['id'] as int;

Map<String, dynamic> _$PanelsMessageToJson(PanelsMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) =>
    DefaultResponse(
      json['success'] as bool,
      json['id'] as int?,
    )
      ..type = json['type'] as String?
      ..result = json['result'];

Map<String, dynamic> _$DefaultResponseToJson(DefaultResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'success': instance.success,
      'result': instance.result,
    };

StateResponse _$StateResponseFromJson(Map<String, dynamic> json) =>
    StateResponse(
      json['success'] as bool,
      (json['result'] as List<dynamic>?)
          ?.map((e) => State.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int?,
    )..type = json['type'] as String?;

Map<String, dynamic> _$StateResponseToJson(StateResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'success': instance.success,
      'result': instance.result,
    };

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      json['success'] as bool,
      json['result'] == null
          ? null
          : Config.fromJson(json['result'] as Map<String, dynamic>),
      json['id'] as int?,
    )..type = json['type'] as String?;

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'success': instance.success,
      'result': instance.result,
    };

ServiceResponse _$ServiceResponseFromJson(Map<String, dynamic> json) =>
    ServiceResponse(
      json['success'] as bool,
      json['result'] == null
          ? null
          : Service.fromJson(json['result'] as Map<String, dynamic>),
      json['id'] as int?,
    )..type = json['type'] as String?;

Map<String, dynamic> _$ServiceResponseToJson(ServiceResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'success': instance.success,
      'result': instance.result,
    };

ServicesResponse _$ServicesResponseFromJson(Map<String, dynamic> json) =>
    ServicesResponse(
      json['success'] as bool,
      (json['result'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int?,
    )..type = json['type'] as String?;

Map<String, dynamic> _$ServicesResponseToJson(ServicesResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'success': instance.success,
      'result': instance.result,
    };

PanelResponse _$PanelResponseFromJson(Map<String, dynamic> json) =>
    PanelResponse(
      json['success'] as bool,
      (json['result'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      json['id'] as int?,
    )..type = json['type'] as String?;

Map<String, dynamic> _$PanelResponseToJson(PanelResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'success': instance.success,
      'result': instance.result,
    };

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) =>
    EventResponse(
      Event<dynamic>.fromJson(json['event'] as Map<String, dynamic>),
      json['id'] as int?,
    )..type = json['type'] as String?;

Map<String, dynamic> _$EventResponseToJson(EventResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'event': instance.event,
    };

EventBase _$EventBaseFromJson(Map<String, dynamic> json) => EventBase(
      json['origin'] as String?,
      json['time_fired'] as String?,
      Context.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventBaseToJson(EventBase instance) => <String, dynamic>{
      'origin': instance.origin,
      'time_fired': instance.timeFired,
      'context': instance.context,
    };

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      json['id'] as String?,
      json['user_id'] as String?,
    );

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
    };

StateChange _$StateChangeFromJson(Map<String, dynamic> json) => StateChange(
      json['entity_id'] as String,
      json['old_state'] as Map<String, dynamic>,
      json['new_state'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$StateChangeToJson(StateChange instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'old_state': instance.oldState,
      'new_state': instance.newState,
    };

TimeChange _$TimeChangeFromJson(Map<String, dynamic> json) => TimeChange(
      json['now'] as String,
    );

Map<String, dynamic> _$TimeChangeToJson(TimeChange instance) =>
    <String, dynamic>{
      'now': instance.now,
    };

ServiceRegistered _$ServiceRegisteredFromJson(Map<String, dynamic> json) =>
    ServiceRegistered(
      json['domain'] as String,
      json['service'] as String,
    );

Map<String, dynamic> _$ServiceRegisteredToJson(ServiceRegistered instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'service': instance.service,
    };

CallService _$CallServiceFromJson(Map<String, dynamic> json) => CallService(
      json['domain'] as String,
      json['service'] as String,
      json['service_data'] as Map<String, dynamic>,
      json['service_call_id'] as String,
    );

Map<String, dynamic> _$CallServiceToJson(CallService instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'service': instance.service,
      'service_data': instance.serviceData,
      'service_call_id': instance.serviceCallId,
    };

AutomationReloaded _$AutomationReloadedFromJson(Map<String, dynamic> json) =>
    AutomationReloaded();

Map<String, dynamic> _$AutomationReloadedToJson(AutomationReloaded instance) =>
    <String, dynamic>{};

SceneReloaded _$SceneReloadedFromJson(Map<String, dynamic> json) =>
    SceneReloaded();

Map<String, dynamic> _$SceneReloadedToJson(SceneReloaded instance) =>
    <String, dynamic>{};

PlatformDiscovered _$PlatformDiscoveredFromJson(Map<String, dynamic> json) =>
    PlatformDiscovered(
      json['service'] as String,
      json['discovered'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PlatformDiscoveredToJson(PlatformDiscovered instance) =>
    <String, dynamic>{
      'service': instance.service,
      'discovered': instance.discovered,
    };

ComponentLoaded _$ComponentLoadedFromJson(Map<String, dynamic> json) =>
    ComponentLoaded(
      json['component'] as String,
    );

Map<String, dynamic> _$ComponentLoadedToJson(ComponentLoaded instance) =>
    <String, dynamic>{
      'component': instance.component,
    };
