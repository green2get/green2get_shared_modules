import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../models/picsum_photos_models.dart';

class PicsumPhotosServices {
  Future<Uint8List?> getPicsumImageBytes({
    required int width,
    int? height,
    int? id,
    String? randomSeed,
    bool? grayscale,
    int? blur,
    String? fileType,
  }) async {
    final path =
        '/${id != null ? 'id/$id/' : (randomSeed != null ? 'seed/$randomSeed/' : '')}$width${height != null ? '/$height' : ''}${fileType != null ? '/$fileType' : ''}${grayscale == true || blur != null ? '?${grayscale == true ? 'grayscale' : ''}${blur != null ? '${grayscale == true ? '&' : ''}blur=$blur' : ''}' : ''}';
    try {
      final response = await Dio().request<Uint8List>(
        'https://picsum.photos$path',
        options: Options(responseType: ResponseType.bytes, method: 'GET', validateStatus: (status) => true),
      );

      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<PicsumPhotosItemList?> getPicsumImageList({int? page, int? limit}) async {
    final path =
        '/v2/list${page != null || limit != null ? '?' : ''}${page != null ? 'page=$page' : ''}${limit != null ? '${page != null ? '&' : ''}limit=$limit' : ''}';
    try {
      final response = await Dio().request(
        'https://picsum.photos$path',
        options: Options(responseType: ResponseType.json, method: 'GET', validateStatus: (status) => true),
      );

      return PicsumPhotosItemList(response.data);
    } catch (_) {
      return null;
    }
  }
}
