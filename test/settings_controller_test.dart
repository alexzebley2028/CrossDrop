import 'package:crossdrop/settings/download_location.dart';
import 'package:crossdrop/settings/receive_visibility.dart';
import 'package:crossdrop/settings/settings_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    DownloadLocation.instance.configuredPath = null;
  });

  test('ReceiveVisibility.shouldBroadcast only excludes hidden', () {
    expect(ReceiveVisibility.everyone.shouldBroadcast, isTrue);
    expect(ReceiveVisibility.temporary.shouldBroadcast, isTrue);
    expect(ReceiveVisibility.hidden.shouldBroadcast, isFalse);
  });

  test(
    'ReceiveVisibility.fromStorage round-trips and defaults to everyone',
    () {
      for (final value in ReceiveVisibility.values) {
        expect(ReceiveVisibility.fromStorage(value.storageValue), value);
      }
      expect(ReceiveVisibility.fromStorage(null), ReceiveVisibility.everyone);
      expect(
        ReceiveVisibility.fromStorage('bogus'),
        ReceiveVisibility.everyone,
      );
    },
  );

  test('defaults to visible to everyone', () async {
    final settings = SettingsController();
    await settings.load();

    expect(settings.visibility, ReceiveVisibility.everyone);
    expect(settings.shouldBroadcast, isTrue);
    expect(settings.downloadDirectory, isNull);
    expect(settings.launchAtStartup, isFalse);
  });

  test('visibility is persisted across instances', () async {
    final first = SettingsController();
    await first.load();
    await first.setVisibility(ReceiveVisibility.hidden);

    final second = SettingsController();
    await second.load();
    expect(second.visibility, ReceiveVisibility.hidden);
    expect(second.shouldBroadcast, isFalse);
  });

  test('persisted temporary visibility is loaded as hidden', () async {
    SharedPreferences.setMockInitialValues({
      'receiveVisibility': ReceiveVisibility.temporary.storageValue,
    });
    final settings = SettingsController();
    await settings.load();
    expect(settings.visibility, ReceiveVisibility.hidden);
  });

  test('temporary visibility reverts to hidden after the window', () async {
    final settings = SettingsController(
      temporaryVisibilityDuration: const Duration(milliseconds: 30),
    );
    await settings.load();

    var notified = 0;
    settings.addListener(() => notified++);

    await settings.setVisibility(ReceiveVisibility.temporary);
    expect(settings.visibility, ReceiveVisibility.temporary);
    expect(settings.temporaryVisibilityExpiresAt, isNotNull);

    await Future<void>.delayed(const Duration(milliseconds: 80));

    expect(settings.visibility, ReceiveVisibility.hidden);
    expect(settings.temporaryVisibilityExpiresAt, isNull);
    expect(notified, greaterThanOrEqualTo(2));
  });

  test('switching away from temporary cancels the revert timer', () async {
    final settings = SettingsController(
      temporaryVisibilityDuration: const Duration(milliseconds: 30),
    );
    await settings.load();

    await settings.setVisibility(ReceiveVisibility.temporary);
    await settings.setVisibility(ReceiveVisibility.everyone);

    await Future<void>.delayed(const Duration(milliseconds: 80));

    expect(settings.visibility, ReceiveVisibility.everyone);
  });

  test('device name defaults to a non-empty value and persists', () async {
    final first = SettingsController();
    await first.load();
    expect(first.deviceName, isNotEmpty);

    var notified = 0;
    first.addListener(() => notified++);
    await first.setDeviceName('  Living Room Mac  ');
    expect(first.deviceName, 'Living Room Mac');
    expect(notified, 1);

    final second = SettingsController();
    await second.load();
    expect(second.deviceName, 'Living Room Mac');
  });

  test('setDeviceName ignores empty and unchanged names', () async {
    final settings = SettingsController();
    await settings.load();
    await settings.setDeviceName('Studio');

    var notified = 0;
    settings.addListener(() => notified++);
    await settings.setDeviceName('   ');
    await settings.setDeviceName('Studio');
    expect(settings.deviceName, 'Studio');
    expect(notified, 0);
  });

  test('download directory is persisted and clearable', () async {
    final settings = SettingsController();
    await settings.load();

    await settings.setDownloadDirectory('/tmp/crossdrop-downloads');
    expect(settings.downloadDirectory, '/tmp/crossdrop-downloads');
    expect(
      DownloadLocation.instance.configuredPath,
      '/tmp/crossdrop-downloads',
    );

    await settings.setDownloadDirectory('   ');
    expect(settings.downloadDirectory, isNull);
    expect(DownloadLocation.instance.configuredPath, isNull);

    final reloaded = SettingsController();
    await reloaded.load();
    expect(reloaded.downloadDirectory, isNull);
  });
}
