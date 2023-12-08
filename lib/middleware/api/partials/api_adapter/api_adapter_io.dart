import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:universal_io/io.dart';

HttpClientAdapter? generateHttpClientAdapter() => IOHttpClientAdapter(
      createHttpClient: () => HttpClient()..badCertificateCallback = (X509Certificate certificate, String host, int port) => true,
    );
