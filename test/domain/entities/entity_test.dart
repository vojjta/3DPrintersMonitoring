import 'package:flutter_test/flutter_test.dart';
import 'package:printer_monitoring/domain/primitives/entity.dart';

void main() {
  test('Testing new entity id', () {
    for (int i = 0; i < 1000; i++) {
      final Entity entity1 = Entity.createNew();
      final Entity entity2 = Entity.createNew();

      expect(
        entity1 != entity2,
        isTrue,
        reason: 'Every newly created entity ID should be unique',
      );
    }
  });

  test('Testing same entity id', () {
    final Entity entity1 = Entity(1);
    final Entity entity2 = Entity(1);

    expect(
      entity1 == entity2,
      isTrue,
      reason: 'Entities are compared by ID',
    );
  });
}
