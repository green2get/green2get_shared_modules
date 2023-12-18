/// คลาสโมเดลสำหรับใช้เป็นตัวแทนของอ็อปเจค JSON
abstract class JsonObject {
  final Map<String, dynamic> source;
  JsonObject(this.source);
  JsonObject.immutable(Map<String, dynamic> source) : source = Map.unmodifiable(source);

  operator [](String key) => source[key];

  @override
  operator ==(Object other) => other is JsonObject && other.runtimeType == runtimeType && other.source == source;

  @override
  int get hashCode => Object.hash(source, null);
}

/// คลาสโมเดลสำหรับใช้เป็นตัวแทนของลิสต์ JSON
abstract class JsonList<T> extends Iterable<T> {
  final List source;

  JsonList(this.source);
  JsonList.immutable(List list) : source = list;

  T operator [](int index) => deserialize(index, source[index]);

  @override
  int get length => source.length;

  @override
  Iterator<T> get iterator => JsonListIterator<T>(source.iterator, deserialize);

  T deserialize(int index, dynamic value) => value;

  @override
  operator ==(Object other) => other is JsonList && other.runtimeType == runtimeType && other.source == source;

  @override
  int get hashCode => Object.hash(source, null);
}

class JsonListIterator<E> extends Iterator<E> {
  final Iterator iterator;
  final E Function(int index, dynamic value) deserialize;
  int _index = 0;

  JsonListIterator(this.iterator, this.deserialize);

  int get index => _index;

  @override
  E get current => deserialize(_index++, iterator.current);

  @override
  bool moveNext() => iterator.moveNext();
}
