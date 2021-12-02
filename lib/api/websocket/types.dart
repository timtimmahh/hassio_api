/*
import 'package:hassio_api/api/websocket/hassio_web_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

typedef UnsubscribeFunc = void Function();

@JsonSerializable(fieldRename: FieldRename.snake)
class MessageBase {
  final Map<String, dynamic> _data;
  int? id;
  String type;

  dynamic operator [](String key) => _data[key];

  MessageBase({int? id, required this.type, Map<String, dynamic>? data})
      : _data = data ?? {},
        id = id ?? ++HassIOWebSocket.interactions;

  factory MessageBase.fromJson(Map<String, dynamic> json) =>
      _$MessageBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageBaseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HassEventBase {
  String origin;
  String timeFired;
  HassContext context;

  HassEventBase(this.origin, this.timeFired, this.context);

  factory HassEventBase.fromJson(Map<String, dynamic> json) =>
      _$HassEventBaseFromJson(json);

  Map<String, dynamic> toJson() => _$HassEventBaseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HassContext {
  String id;
  String? userId;

  HassContext(this.id, this.userId);

  factory HassContext.fromJson(Map<String, dynamic> json) =>
      _$HassContextFromJson(json);

  Map<String, dynamic> toJson() => _$HassContextToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HassEvent extends HassEventBase {
  String eventType;
  Map<String, dynamic> data;

  HassEvent(String origin, String timeFired, HassContext context,
      this.eventType, this.data)
      : super(origin, timeFired, context);

  factory HassEvent.fromJson(Map<String, dynamic> json) =>
      _$HassEventFromJson(json);

  Map<String, dynamic> toJson() => _$HassEventToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StateChangedEvent extends HassEventBase {
  String eventType = 'state_changed';
  _StateChangedData data;

  StateChangedEvent(
      String origin, String timeFired, HassContext context, this.data)
      : super(origin, timeFired, context);

  factory StateChangedEvent.fromJson(Map<String, dynamic> json) =>
      _$StateChangedEventFromJson(json);

  Map<String, dynamic> toJson() => _$StateChangedEventToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _StateChangedData {
  String entityId;
  HassEntity? newState;
  HassEntity? oldState;

  _StateChangedData(this.entityId, this.newState, this.oldState);

  factory _StateChangedData.fromJson(Map<String, dynamic> json) =>
      _$StateChangedDataFromJson(json);

  Map<String, dynamic> toJson() => _$StateChangedDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HassConfig {
  double latitude;
  double longitude;
  double elevation;
  _UnitSystem unitSystem;
  String locationName;
  String timeZone;
  List<String> components;
  String configDir;
  List<String> allowlistExternalDirs;
  List<String> allowlistExternalUrls;
  String version;
  String configSource;
  bool safeMode;
  HassState state;
  String? externalUrl;
  String? internalUrl;
  String currency;

  HassConfig(
      this.latitude,
      this.longitude,
      this.elevation,
      this.unitSystem,
      this.locationName,
      this.timeZone,
      this.components,
      this.configDir,
      this.allowlistExternalDirs,
      this.allowlistExternalUrls,
      this.version,
      this.configSource,
      this.safeMode,
      this.state,
      this.externalUrl,
      this.internalUrl,
      this.currency);

  factory HassConfig.fromJson(Map<String, dynamic> json) =>
      _$HassConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HassConfigToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _UnitSystem {
  String length;
  String mass;
  String volume;
  String temperature;

  _UnitSystem(this.length, this.mass, this.volume, this.temperature);

  factory _UnitSystem.fromJson(Map<String, dynamic> json) =>
      _$UnitSystemFromJson(json);

  Map<String, dynamic> toJson() => _$UnitSystemToJson(this);
}

enum HassState { notRunning, starting, running, stopping, finalWrite }

@JsonSerializable(fieldRename: FieldRename.snake)
class HassEntityBase {
  String entityId;
  String state;
  String lastChanged;
  String lastUpdated;
  HassEntityAttributeBase attributes;
  HassContext context;

  HassEntityBase(this.entityId, this.state, this.lastChanged, this.lastUpdated,
      this.attributes, this.context);

  factory HassEntityBase.fromJson(Map<String, dynamic> json) =>
      _$HassEntityBaseFromJson(json);

  Map<String, dynamic> toJson() => _$HassEntityBaseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HassEntityAttributeBase {
  String? friendlyName;
  String? unitOfMeasurement;
  String? icon;
  String? entityPicture;
  num? supportedFeatures;
  bool? hidden;
  bool? assumedState;
  String? deviceClass;
  String? stateClass;

  HassEntityAttributeBase(
      {this.friendlyName,
      this.unitOfMeasurement,
      this.icon,
      this.entityPicture,
      this.supportedFeatures,
      this.hidden,
      this.assumedState,
      this.deviceClass,
      this.stateClass});

  factory HassEntityAttributeBase.fromJson(Map<String, dynamic> json) =>
      _$HassEntityAttributeBaseFromJson(json);

  Map<String, dynamic> toJson() => _$HassEntityAttributeBaseToJson(this);
}

typedef HassEntity = HassEntityBase;

typedef HassEntities = Map<String, HassEntity>;

@JsonSerializable(fieldRename: FieldRename.snake)
class HassService {
  String? name;
  String description;
  Map<String, dynamic>? target;
  Map<String, _HassServiceFields> fields;

  HassService(this.name, this.description, this.target, this.fields);

  factory HassService.fromJson(Map<String, dynamic> json) =>
      _$HassServiceFromJson(json);

  Map<String, dynamic> toJson() => _$HassServiceToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _HassServiceFields {
  String? name;
  String description;
  dynamic example;
  Map? selector;

  _HassServiceFields(this.name, this.description, this.example, this.selector);

  factory _HassServiceFields.fromJson(Map<String, dynamic> json) =>
      _$HassServiceFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$HassServiceFieldsToJson(this);
}

typedef HassDomainServices = Map<String, HassService>;

typedef HassServices = Map<String, HassDomainServices>;

@JsonSerializable(fieldRename: FieldRename.snake)
class HassUser {
  String id;
  bool isOwner;
  String name;

  HassUser(this.id, this.isOwner, this.name);

  factory HassUser.fromJson(Map<String, dynamic> json) =>
      _$HassUserFromJson(json);

  Map<String, dynamic> toJson() => _$HassUserToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class HassServiceTarget {
  List<String>? entityId;
  List<String>? deviceId;
  List<String>? areaId;

  HassServiceTarget({this.entityId, this.deviceId, this.areaId});

  factory HassServiceTarget.fromJson(Map<String, dynamic> json) =>
      _$HassServiceTargetFromJson(json);

  Map<String, dynamic> toJson() => _$HassServiceTargetToJson(this);
}
*/
