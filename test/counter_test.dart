import 'package:inno_testing/counter.dart';
import 'package:test/test.dart';

void main() {
  group('CounterManager tests', () {
    test('Counter value should be incremented', () {
      /// Arange
      final counter = Counter();

      /// Act
      counter.increment();

      /// Assert
      expect(counter.value, 1);
    });
    test('Counter value should be decremented', () {
      /// Arange
      final counter = Counter();

      /// Act
      counter.decrement();

      /// Assert
      expect(counter.value, isNegative);
    });
  });
}
