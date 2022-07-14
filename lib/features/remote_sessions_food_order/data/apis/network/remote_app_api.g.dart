// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'localhost:3030';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RemoteLoginResponse> login(loginRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = loginRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteLoginResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteLoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RemoteRegisterResponse> register(registerRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = registerRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteRegisterResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteRegisterResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<RemoteSessionResponse>> getSession(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RemoteSessionResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/get-sessions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            RemoteSessionResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<RemoteSessionResponse> createSession(remoteSessionRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = remoteSessionRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteSessionResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/create-session',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteSessionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RemoteSessionResponse> searchSession(remoteSessionRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = remoteSessionRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteSessionResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/search-session',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteSessionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RemoteSessionResponse> deleteSession(remoteSessionRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = remoteSessionRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteSessionResponse>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/delete-session',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteSessionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<RemoteOrderResponse>> getOrders(sessionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RemoteOrderResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/get-orders',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            RemoteOrderResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<RemoteOrderResponse> addOrder(remoteOrderRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = remoteOrderRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteOrderResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/add-order',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RemoteOrderResponse> deleteOrder(remoteOrderRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = remoteOrderRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteOrderResponse>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/delete-order',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RemoteOrderResponse> editOrder(remoteOrderRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = remoteOrderRequest;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteOrderResponse>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/edit-order',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RemoteConclusionResponse> getConclusion(sessionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RemoteConclusionResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'localhost:3030/api/get-conclusion',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RemoteConclusionResponse.fromJson(_result.data!);
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
