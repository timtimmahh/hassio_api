import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import 'rest_models.dart';

part 'hassio_client.g.dart';

@RestApi()
abstract class HassIOClient {
  factory HassIOClient(Dio dio, {String baseUrl}) = _HassIOClient;

  @GET("/")
  Future<Status> getStatus();

  @GET("/config")
  Future<Config> getConfig();

  @GET("/events")
  Future<List<Event>> getEvents();

  @GET("/services")
  Future<List<Service>> getServices();

  @GET("/history/period/{timestamp}")
  Future<List<List<StateChange>>> getStateHistory(
      @Path() String timestamp,
      @Query("filter_entity_id") List<String> entityIds,
      @Query("end_time") String endTime,
      @Query("minimal_response") bool minimalResponse,
      @Query("significant_changes_only") bool significantChangesOnly);

  @GET("/logbook/{timestamp}")
  Future<List<LogbookEntry>> getLogbookHistory(@Path() String timestamp,
      @Query("entity") String entity, @Query("end_time") String endTime);

  @GET("/states")
  Future<List<State>> getStates();

  @GET("/states/{entityId}")
  Future<State> getEntityState(@Path() String entityId);

  @GET("/error_log")
  Future<String> getErrorLog();

  @GET("/camera_proxy/{entityId}")
  Future<HttpResponse> getCameraImage(@Path() String entityId);

  @POST("/states/{entityId}")
  Future<State> updateState(@Path() String entityId, @Body() State stateBody);

  @POST("/events/{eventType}")
  Future<Status> fireEvent<T>(@Path() String eventType, @Body() T eventBody);

  @POST("/services/{domain}/{service}")
  Future<List<State>> callService<T>(
      @Path() String domain, @Path() String service, @Body() T serviceData);

  @POST("/template")
  Future<String> renderTemplate(@Body() Template template);

  @POST("/config/core/check_config")
  Future<ConfigCheck> checkConfig();
}
