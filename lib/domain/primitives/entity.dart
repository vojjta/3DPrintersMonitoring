import 'package:uuid/uuid.dart';

base class Entity {
  late int id;

  Entity(this.id);

  Entity.createNew() {
    id = _fastHash(const Uuid().v4());
  }

  // Entities are equal if their ids are equal.
  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is Entity && other.id == id;
  }

  // https://isar.dev/recipes/string_ids.html#fast-hash-function
  int _fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
