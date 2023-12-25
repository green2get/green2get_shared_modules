import '../../../../shared/models/json_models.dart';

class PicsumPhotosItemList extends JsonList<PicsumPhotosItem> {
  PicsumPhotosItemList(super.source);

  @override
  PicsumPhotosItem deserialize(int index, value) => PicsumPhotosItem(value);
}

class PicsumPhotosItem extends JsonObject {
  PicsumPhotosItem(super.source);

  String get id => source['id'];
  String get author => source['author'];
  int get width => source['width'];
  int get height => source['height'];
  String get url => source['url'];
  String get downloadUrl => source['download_url'];
}
