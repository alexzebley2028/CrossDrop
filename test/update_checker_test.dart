import 'package:crossdrop/update/update_checker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpdateChecker.isNewer', () {
    test('detects a higher patch/minor/major version', () {
      expect(UpdateChecker.isNewer('1.0.1', '1.0.0'), isTrue);
      expect(UpdateChecker.isNewer('1.1.0', '1.0.9'), isTrue);
      expect(UpdateChecker.isNewer('2.0.0', '1.9.9'), isTrue);
    });

    test('returns false for equal or older versions', () {
      expect(UpdateChecker.isNewer('1.0.0', '1.0.0'), isFalse);
      expect(UpdateChecker.isNewer('1.0.0', '1.0.1'), isFalse);
      expect(UpdateChecker.isNewer('1.2.0', '1.10.0'), isFalse);
    });

    test('ignores a leading v and build metadata', () {
      expect(UpdateChecker.isNewer('v1.2.0', '1.1.0'), isTrue);
      expect(UpdateChecker.isNewer('1.2.0+5', '1.2.0+1'), isFalse);
      expect(UpdateChecker.isNewer('v1.2.0', '1.2.0+9'), isFalse);
    });

    test('treats missing components as zero', () {
      expect(UpdateChecker.isNewer('1.1', '1.0.5'), isTrue);
      expect(UpdateChecker.isNewer('1', '1.0.0'), isFalse);
    });

    test('does not treat a pre-release of the same version as newer', () {
      // Regression: '3-rc1' must compare as 3, not 31.
      expect(UpdateChecker.isNewer('1.2.3-rc1', '1.2.3'), isFalse);
      expect(UpdateChecker.isNewer('v1.2.3-rc1', '1.2.3'), isFalse);
      expect(UpdateChecker.isNewer('1.2.0-beta.2', '1.2.0'), isFalse);
      // A pre-release of a genuinely higher version is still newer.
      expect(UpdateChecker.isNewer('1.3.0-rc1', '1.2.0'), isTrue);
    });
  });
}
