import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rest_models.g.dart';

@JsonSerializable()
class Status {
  String message;

  Status({required this.message});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Status &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Config {
  List<String> components;
  String configDir;
  double elevation;
  double latitude;
  double longitude;
  String locationName;
  String timeZone;
  UnitSystem unitSystem;
  String version;
  List<String> whitelistExternalDirs;

  Config(
      this.components,
      this.configDir,
      this.elevation,
      this.latitude,
      this.longitude,
      this.locationName,
      this.timeZone,
      this.unitSystem,
      this.version,
      this.whitelistExternalDirs);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Config &&
          runtimeType == other.runtimeType &&
          setEquals(components.toSet(), other.components.toSet()) &&
          configDir == other.configDir &&
          elevation == other.elevation &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          locationName == other.locationName &&
          timeZone == other.timeZone &&
          unitSystem == other.unitSystem &&
          version == other.version &&
          setEquals(whitelistExternalDirs.toSet(),
              other.whitelistExternalDirs.toSet());

  @override
  int get hashCode =>
      components.hashCode ^
      configDir.hashCode ^
      elevation.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      locationName.hashCode ^
      timeZone.hashCode ^
      unitSystem.hashCode ^
      version.hashCode ^
      whitelistExternalDirs.hashCode;
}

@JsonSerializable()
class UnitSystem {
  String length;
  String mass;
  String temperature;
  String volume;

  UnitSystem(this.length, this.mass, this.temperature, this.volume);

  factory UnitSystem.fromJson(Map<String, dynamic> json) =>
      _$UnitSystemFromJson(json);

  Map<String, dynamic> toJson() => _$UnitSystemToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitSystem &&
          runtimeType == other.runtimeType &&
          length == other.length &&
          mass == other.mass &&
          temperature == other.temperature &&
          volume == other.volume;

  @override
  int get hashCode =>
      length.hashCode ^ mass.hashCode ^ temperature.hashCode ^ volume.hashCode;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Event {
  String event;
  int listenerCount;

  Event(this.event, this.listenerCount);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Service {
  String domain;
  List<String> services;

  Service(this.domain, this.services);

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

// @JsonSerializable()
class StateChanges extends ListBase<StateChange> {
  // @JsonKey(ignore: true)
  final List<StateChange> _stateChanges;

  StateChanges._([List<StateChange>? stateChanges])
      : _stateChanges = stateChanges ?? [];

  factory StateChanges.filled(int length, StateChange fill,
          {bool growable = false}) =>
      StateChanges._(
          List<StateChange>.filled(length, fill, growable: growable));

  factory StateChanges.empty({bool growable = false}) =>
      StateChanges._(List<StateChange>.empty(growable: growable));

  factory StateChanges.from(Iterable elements, {bool growable = true}) =>
      StateChanges._(List<StateChange>.from(elements, growable: growable));

  factory StateChanges.of(Iterable<StateChange> elements,
          {bool growable = true}) =>
      StateChanges._(List<StateChange>.of(elements, growable: growable));

  factory StateChanges.generate(
          int length, StateChange Function(int index) generator,
          {bool growable = true}) =>
      StateChanges._(
          List<StateChange>.generate(length, generator, growable: growable));

  factory StateChanges.unmodifiable(Iterable elements) =>
      StateChanges._(List<StateChange>.unmodifiable(elements));

  @override
  int get length => _stateChanges.length;

  @override
  operator [](int index) => _stateChanges[index];

  @override
  void operator []=(int index, value) => _stateChanges[index] = value;

  @override
  set length(int newLength) => _stateChanges.length = newLength;

  factory StateChanges.fromJson(List<dynamic> json) =>
      StateChanges._(json.map((e) => StateChange.fromJson(e)).toList());
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StateChange {
  Map<String, dynamic>? attributes;
  String? entityId;
  String lastChanged;
  String? lastUpdated;
  String state;

  StateChange(this.attributes, this.entityId, this.lastChanged,
      this.lastUpdated, this.state);

  factory StateChange.fromJson(Map<String, dynamic> json) =>
      _$StateChangeFromJson(json);

  Map<String, dynamic> toJson() => _$StateChangeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LogbookEntry {
  String? contextUserId;
  String domain;
  String entityId;
  String message;
  String name;
  String when;

  LogbookEntry(this.contextUserId, this.domain, this.entityId, this.message,
      this.name, this.when);

  factory LogbookEntry.fromJson(Map<String, dynamic> json) =>
      _$LogbookEntryFromJson(json);

  Map<String, dynamic> toJson() => _$LogbookEntryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class State {
  Map<String, dynamic> attributes;
  String entityId;
  String lastChanged;
  String state;

  State(this.attributes, this.entityId, this.lastChanged, this.state);

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

@JsonSerializable()
class Template {
  String template;

  Template(this.template);

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

@JsonSerializable()
class ConfigCheck {
  String? errors;
  String result;

  ConfigCheck(this.errors, this.result);

  factory ConfigCheck.fromJson(Map<String, dynamic> json) =>
      _$ConfigCheckFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigCheckToJson(this);
}
