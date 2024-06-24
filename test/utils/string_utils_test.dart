import 'package:fifth_phase/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringUtils >', () {
    test('capitalize', () {
      final String value = StringUtils.capitalize('test');
      expect(
        value,
        equals('Test'),
        reason: 'Verify capitaliza function',
      );
    });
  });
}
