import 'dart:typed_data';

import '../../models/picsum_photos_models.dart';
import '../../services/picsum_photos_service.dart';

mixin PicsumPhotosMixin {
  final _picsumPhotosServices = PicsumPhotosServices();

  Future<Uint8List?> getPicsumImageBytes({
    required int width,
    int? height,
    int? id,
    String? randomSeed,
    bool? grayscale,
    int? blur,
    String? fileType,
  }) =>
      _picsumPhotosServices.getPicsumImageBytes(
        width: width,
        height: height,
        randomSeed: randomSeed,
        id: id,
        grayscale: grayscale,
        blur: blur,
        fileType: fileType,
      );

  Future<PicsumPhotosItemList?> getPicsumImageList({int? page, int? limit}) => _picsumPhotosServices.getPicsumImageList(
        page: page,
        limit: limit,
      );
}
