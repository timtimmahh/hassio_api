// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hassio_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _HassIOClient implements HassIOClient {
  _HassIOClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Status> getStatus() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Status>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Status.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Config> getConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Config>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/config',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Config.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Event>> getEvents() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Event>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/events',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Event.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Service>> getServices() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Service>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/services',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Service.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<List<StateChange>>> getStateHistory(timestamp, entityIds, endTime,
      minimalResponse, significantChangesOnly) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'filter_entity_id': entityIds,
      r'end_time': endTime,
      r'minimal_response': minimalResponse,
      r'significant_changes_only': significantChangesOnly
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<List<StateChange>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/history/period/$timestamp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => (i as List<dynamic>)
            .map((dynamic j) => StateChange.fromJson(j as Map<String, dynamic>))
            .toList())
        .toList();
    return value;
  }

  @override
  Future<List<LogbookEntry>> getLogbookHistory(
      timestamp, entity, endTime) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'entity': entity,
      r'end_time': endTime
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<LogbookEntry>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/logbook/$timestamp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => LogbookEntry.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<State>> getStates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<State>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/states',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => State.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<State> getEntityState(entityId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<State>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/states/$entityId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = State.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> getErrorLog() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/error_log',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> getCameraImage(entityId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/camera_proxy/$entityId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<State> updateState(entityId, stateBody) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(stateBody.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<State>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/states/$entityId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = State.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Status> fireEvent<T>(eventType, eventBody) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = eventBody;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Status>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/events/$eventType',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Status.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<State>> callService<T>(domain, service, serviceData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = serviceData;
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<State>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/services/$domain/$service',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => State.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<String> renderTemplate(template) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(template.toJson());
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/template',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<ConfigCheck> checkConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConfigCheck>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/config/core/check_config',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConfigCheck.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
