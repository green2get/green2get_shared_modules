part of '../api.dart';

String _baseUrl = '';
String? _authorization;
String? _language;
const _connectTimeout = Duration(minutes: 2);
const _receiveTimeout = Duration(minutes: 2);
const _headers = {"Accept": "application/json", "Content-Type": "application/json"};

class _DioBaseOption extends BaseOptions {
  @override
  String get baseUrl => _baseUrl;

  @override
  Duration get connectTimeout => _connectTimeout;

  @override
  Duration get receiveTimeout => _receiveTimeout;

  @override
  Map<String, dynamic> get headers => _headers;
}

class ApiClient {
  factory ApiClient() {
    try {
      return _instance = ApiClient._instantiate();
    } catch (_) {
      return _instance;
    }
  }

  ApiClient._instantiate() {
    final client = _dio = Dio(_DioBaseOption())..interceptors.add(_ApiInterceptors());

    final adapter = generateHttpClientAdapter();

    if (adapter != null) client.httpClientAdapter = adapter;

    if (!_dioInitializedCompleter.isCompleted) _dioInitializedCompleter.complete();
  }

  static late final Dio _dio;
  static late final ApiClient _instance;
  static final _dioInitializedCompleter = Completer<void>();

  static void setLanguage(String lang) {
    _language = lang;
  }

  static void setAuthorization(String token) {
    _authorization = token;
  }

  static void unsetAuthorization() {
    _authorization = null;
  }

  static void unsetLanguage() {
    _language = null;
  }

  static void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  static void unsetBaseUrl() {
    _baseUrl = '';
  }

  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? data,
    String Function(String path)? replaceWith,
    bool? useAuthorization,
  }) async {
    if (!_dioInitializedCompleter.isCompleted) await _dioInitializedCompleter.future;

    final finalizedPath = replaceWith?.call(path) ?? path;

    try {
      final auth = _authorization, lang = _language;

      final response = await _dio.get(
        finalizedPath,
        queryParameters: data,
        options: Options(
          headers: {
            if (auth != null && (useAuthorization ?? _canAcquireAuthorization(path))) "Authorization": auth,
            if (lang != null) "Lang": lang,
          },
        ),
      );
      return ApiResponse._instantiate(response);
    } on DioException catch (e, stackTrace) {
      int? statusCode = e.response?.statusCode;
      String errorMsg = e.response?.data.toString() ?? '';
      logger.e('API: $finalizedPath, StatusCode: $statusCode, Error: $errorMsg ', error: e, stackTrace: stackTrace);
      return ApiResponse._instantiate(e.response, e);
    }
  }

  Future<ApiResponse> post(
    String path, {
    dynamic data,
    String Function(String path)? replaceWith,
    bool? useAuthorization,
  }) async {
    if (!_dioInitializedCompleter.isCompleted) await _dioInitializedCompleter.future;

    final finalizedPath = replaceWith?.call(path) ?? path;

    try {
      final auth = _authorization, lang = _language;

      final response = await _dio.post(
        finalizedPath,
        data: data,
        options: Options(
          headers: {
            if (auth != null && (useAuthorization ?? _canAcquireAuthorization(path))) "Authorization": auth,
            if (lang != null) "Lang": lang,
          },
        ),
      );
      return ApiResponse._instantiate(response);
    } on DioException catch (e, stackTrace) {
      int? statusCode = e.response?.statusCode;
      String errorMsg = e.response?.data.toString() ?? '';
      logger.e('API: $finalizedPath, StatusCode: $statusCode, Error: $errorMsg ', error: e, stackTrace: stackTrace);
      return ApiResponse._instantiate(e.response, e);
    }
  }

  Future<ApiResponse> postFormData(
    String path,
    FormData formData, {
    String Function(String path)? replaceWith,
    bool? useAuthorization,
  }) async {
    if (!_dioInitializedCompleter.isCompleted) await _dioInitializedCompleter.future;

    final finalizedPath = replaceWith?.call(path) ?? path;

    try {
      final auth = _authorization, lang = _language;

      final response = await _dio.post(
        finalizedPath,
        data: formData,
        options: Options(
          headers: {
            if (auth != null && (useAuthorization ?? _canAcquireAuthorization(path))) "Authorization": auth,
            if (lang != null) "Lang": lang,
          },
        ),
      );
      return ApiResponse._instantiate(response);
    } on DioException catch (e, stackTrace) {
      int? statusCode = e.response?.statusCode;
      String errorMsg = e.response?.data.toString() ?? '';
      logger.e('API: $finalizedPath, StatusCode: $statusCode, Error: $errorMsg ', error: e, stackTrace: stackTrace);
      return ApiResponse._instantiate(e.response, e);
    }
  }

  Future<ApiResponse> put(
    String path, {
    dynamic data,
    String Function(String path)? replaceWith,
    bool? useAuthorization,
  }) async {
    if (!_dioInitializedCompleter.isCompleted) await _dioInitializedCompleter.future;

    final finalizedPath = replaceWith?.call(path) ?? path;

    try {
      final auth = _authorization, lang = _language;

      final response = await _dio.put(
        finalizedPath,
        data: data,
        options: Options(
          headers: {
            if (auth != null && (useAuthorization ?? _canAcquireAuthorization(path))) "Authorization": auth,
            if (lang != null) "Lang": lang,
          },
        ),
      );
      return ApiResponse._instantiate(response);
    } on DioException catch (e, stackTrace) {
      int? statusCode = e.response?.statusCode;
      String errorMsg = e.response?.data.toString() ?? '';
      logger.e('API: $finalizedPath, StatusCode: $statusCode, Error: $errorMsg ', error: e, stackTrace: stackTrace);
      return ApiResponse._instantiate(e.response, e);
    }
  }

  Future<ApiResponse> delete(
    String path, {
    dynamic data,
    String Function(String path)? replaceWith,
    bool? useAuthorization,
  }) async {
    if (!_dioInitializedCompleter.isCompleted) await _dioInitializedCompleter.future;

    final finalizedPath = replaceWith?.call(path) ?? path;

    try {
      final auth = _authorization, lang = _language;

      final response = await _dio.delete(
        finalizedPath,
        data: data,
        options: Options(
          headers: {
            if (auth != null && (useAuthorization ?? _canAcquireAuthorization(path))) "Authorization": auth,
            if (lang != null) "Lang": lang,
          },
        ),
      );
      return ApiResponse._instantiate(response);
    } on DioException catch (e, stackTrace) {
      int? statusCode = e.response?.statusCode;
      String errorMsg = e.response?.data.toString() ?? '';
      logger.e('API: $finalizedPath, StatusCode: $statusCode, Error: $errorMsg ', error: e, stackTrace: stackTrace);
      return ApiResponse._instantiate(e.response, e);
    }
  }

  Future<ApiResponse> patch(
    String path, {
    dynamic data,
    String Function(String path)? replaceWith,
    bool? useAuthorization,
  }) async {
    if (!_dioInitializedCompleter.isCompleted) await _dioInitializedCompleter.future;

    final finalizedPath = replaceWith?.call(path) ?? path;

    try {
      final auth = _authorization, lang = _language;

      final response = await _dio.patch(
        finalizedPath,
        data: data,
        options: Options(
          headers: {
            if (auth != null && (useAuthorization ?? _canAcquireAuthorization(path))) "Authorization": auth,
            if (lang != null) "Lang": lang,
          },
        ),
      );
      return ApiResponse._instantiate(response);
    } on DioException catch (e, stackTrace) {
      int? statusCode = e.response?.statusCode;
      String errorMsg = e.response?.data.toString() ?? '';
      logger.e('API: $finalizedPath, StatusCode: $statusCode, Error: $errorMsg ', error: e, stackTrace: stackTrace);
      return ApiResponse._instantiate(e.response, e);
    }
  }

  Future<ApiResponse> patchFormData(
    String path,
    FormData formData, {
    String Function(String path)? replaceWith,
    bool? useAuthorization,
  }) async {
    if (!_dioInitializedCompleter.isCompleted) await _dioInitializedCompleter.future;

    final finalizedPath = replaceWith?.call(path) ?? path;

    try {
      final auth = _authorization, lang = _language;

      final response = await _dio.patch(
        finalizedPath,
        data: formData,
        options: Options(
          headers: {
            if (auth != null && (useAuthorization ?? _canAcquireAuthorization(path))) "Authorization": auth,
            if (lang != null) "Lang": lang,
          },
        ),
      );
      return ApiResponse._instantiate(response);
    } on DioException catch (e, stackTrace) {
      int? statusCode = e.response?.statusCode;
      String errorMsg = e.response?.data.toString() ?? '';
      logger.e('API: $finalizedPath, StatusCode: $statusCode, Error: $errorMsg ', error: e, stackTrace: stackTrace);
      return ApiResponse._instantiate(e.response, e);
    }
  }
}
