import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import '../logic/picsum_photos_instructions.dart';

class PicsumWidget extends StatelessWidget {
  const PicsumWidget({
    super.key,
    required this.width,
    this.height,
    this.id,
    this.randomSeed,
    this.grayscale,
    this.blur,
    this.fileType,
  });

  final int width;
  final int? height;
  final int? id;
  final String? randomSeed;
  final bool? grayscale;
  final int? blur;
  final String? fileType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _injected().getPicsumImageBytes(
        width: width,
        height: height,
        id: id,
        randomSeed: randomSeed,
        grayscale: grayscale,
        blur: blur,
        fileType: fileType,
      ),
      builder: (context, snapshot) {
        final imageBytes = snapshot.data;
        if (imageBytes != null && imageBytes.isNotEmpty) return Image.memory(imageBytes);
        return const SizedBox();
      },
    );
  }

  static PicsumPhotosInstructions Function() _injected = () => PicsumPhotosInstructions();
  static void setLoadingPicsumPhotoBuilder(PicsumPhotosInstructions Function() builder) => _injected = builder;
}
