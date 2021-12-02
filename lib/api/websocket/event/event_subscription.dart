import '../web_socket_models.dart';

abstract class EventSubscription<T> {
  SubscribeRequest request;

  EventSubscription(String? event) : request = SubscribeRequest(event);

  void fireSubscription(T data);
}

typedef StateChangeCallback = void Function(
    Map<String, dynamic> oldState, Map<String, dynamic> newState);

class StateChangeSubscription extends EventSubscription<StateChange> {
  final Map<String, StateChangeCallback> _subscribedEntities;

  StateChangeSubscription([Map<String, StateChangeCallback>? entities])
      : _subscribedEntities = entities ?? <String, StateChangeCallback>{},
        super('state_changed');

  StateChangeSubscription.of(String entityId, StateChangeCallback callback)
      : this({entityId: callback});

  void subscribeEntity(String entityId, StateChangeCallback callback) =>
      _subscribedEntities[entityId] = callback;

  void unsubscribeEntity(String entityId) =>
      _subscribedEntities.remove(entityId);

  @override
  void fireSubscription(StateChange data) {
    _subscribedEntities[data.entityId]?.call(data.oldState, data.newState);
  }

  bool get isEmpty => _subscribedEntities.isEmpty;
}

class TimeChangedSubscription extends EventSubscription<TimeChange> {
  void Function(String data) onTimeChange;

  TimeChangedSubscription(this.onTimeChange) : super('time_changed');

  @override
  void fireSubscription(TimeChange data) => onTimeChange(data.now);
}

class ServiceRegisteredSubscription
    extends EventSubscription<ServiceRegistered> {
  void Function(String domain, String service) onServiceRegistered;

  ServiceRegisteredSubscription(this.onServiceRegistered)
      : super('service_registered');

  @override
  void fireSubscription(ServiceRegistered data) =>
      onServiceRegistered(data.domain, data.service);
}

class CallServiceSubscription extends EventSubscription<CallService> {
  void Function(String domain, String service, Map<String, dynamic> serviceData,
      String serviceCallId) onCallService;

  CallServiceSubscription(this.onCallService) : super('call_service');

  @override
  void fireSubscription(CallService data) => onCallService(
      data.domain, data.service, data.serviceData, data.serviceCallId);
}

class AutomationReloadedSubscription
    extends EventSubscription<AutomationReloaded> {
  void Function() onAutomationReloaded;

  AutomationReloadedSubscription(this.onAutomationReloaded)
      : super('automation_reloaded');

  @override
  void fireSubscription(AutomationReloaded data) => onAutomationReloaded();
}

class SceneReloadedSubscription extends EventSubscription<SceneReloaded> {
  void Function() onSceneReloaded;

  SceneReloadedSubscription(this.onSceneReloaded) : super('scene_reloaded');

  @override
  void fireSubscription(SceneReloaded data) => onSceneReloaded();
}

class PlatformDiscoveredSubscription
    extends EventSubscription<PlatformDiscovered> {
  void Function(String service, Map<String, dynamic> discovered)
      onPlatformDiscovered;

  PlatformDiscoveredSubscription(this.onPlatformDiscovered)
      : super('platform_discovered');

  @override
  void fireSubscription(PlatformDiscovered data) =>
      onPlatformDiscovered(data.service, data.discovered);
}

class ComponentLoadedSubscription extends EventSubscription<ComponentLoaded> {
  void Function(String component) onComponentLoaded;

  ComponentLoadedSubscription(this.onComponentLoaded)
      : super('component_loaded');

  @override
  void fireSubscription(ComponentLoaded data) =>
      onComponentLoaded(data.component);
}
