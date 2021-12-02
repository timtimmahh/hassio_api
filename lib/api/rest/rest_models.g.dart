// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      message: json['message'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'message': instance.message,
    };

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      (json['components'] as List<dynamic>).map((e) => e as String).toList(),
      json['config_dir'] as String,
      (json['elevation'] as num).toDouble(),
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      json['location_name'] as String,
      json['time_zone'] as String,
      UnitSystem.fromJson(json['unit_system'] as Map<String, dynamic>),
      json['version'] as String,
      (json['whitelist_external_dirs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'components': instance.components,
      'config_dir': instance.configDir,
      'elevation': instance.elevation,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location_name': instance.locationName,
      'time_zone': instance.timeZone,
      'unit_system': instance.unitSystem,
      'version': instance.version,
      'whitelist_external_dirs': instance.whitelistExternalDirs,
    };

UnitSystem _$UnitSystemFromJson(Map<String, dynamic> json) => UnitSystem(
      json['length'] as String,
      json['mass'] as String,
      json['temperature'] as String,
      json['volume'] as String,
    );

Map<String, dynamic> _$UnitSystemToJson(UnitSystem instance) =>
    <String, dynamic>{
      'length': instance.length,
      'mass': instance.mass,
      'temperature': instance.temperature,
      'volume': instance.volume,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['event'] as String,
      json['listener_count'] as int,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'event': instance.event,
      'listener_count': instance.listenerCount,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      json['domain'] as String,
      (json['services'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'domain': instance.domain,
      'services': instance.services,
    };

StateChange _$StateChangeFromJson(Map<String, dynamic> json) => StateChange(
      json['attributes'] as Map<String, dynamic>?,
      json['entity_id'] as String?,
      json['last_changed'] as String,
      json['last_updated'] as String?,
      json['state'] as String,
    );

Map<String, dynamic> _$StateChangeToJson(StateChange instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'entity_id': instance.entityId,
      'last_changed': instance.lastChanged,
      'last_updated': instance.lastUpdated,
      'state': instance.state,
    };

LogbookEntry _$LogbookEntryFromJson(Map<String, dynamic> json) => LogbookEntry(
      json['context_user_id'] as String?,
      json['domain'] as String,
      json['entity_id'] as String,
      json['message'] as String,
      json['name'] as String,
      json['when'] as String,
    );

Map<String, dynamic> _$LogbookEntryToJson(LogbookEntry instance) =>
    <String, dynamic>{
      'context_user_id': instance.contextUserId,
      'domain': instance.domain,
      'entity_id': instance.entityId,
      'message': instance.message,
      'name': instance.name,
      'when': instance.when,
    };

State _$StateFromJson(Map<String, dynamic> json) => State(
      json['attributes'] as Map<String, dynamic>,
      json['entity_id'] as String,
      json['last_changed'] as String,
      json['state'] as String,
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'attributes': instance.attributes,
      'entity_id': instance.entityId,
      'last_changed': instance.lastChanged,
      'state': instance.state,
    };

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
      json['template'] as String,
    );

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
      'template': instance.template,
    };

ConfigCheck _$ConfigCheckFromJson(Map<String, dynamic> json) => ConfigCheck(
      json['errors'] as String?,
      json['result'] as String,
    );

Map<String, dynamic> _$ConfigCheckToJson(ConfigCheck instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'result': instance.result,
    };
