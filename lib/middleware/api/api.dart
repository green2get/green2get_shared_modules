import 'dart:async';

import 'package:dio/dio.dart';

import '../logger/logger.dart';
import 'partials/api_adapter/api_adapter_default.dart' if (dart.library.io) 'partials/api_adapter/api_adapter_io.dart';

part 'partials/api_interceptors.dart';
part 'partials/api_client.dart';
part 'partials/api_response.dart';
part 'partials/api_helpers.dart';
