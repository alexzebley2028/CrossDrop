import 'dart:async';
import 'dart:io';

import 'package:crossdrop/app/widgets/device_name_field.dart';
import 'package:crossdrop/app/widgets/visibility_control.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:crossdrop/autostart/autostart_service.dart';
import 'package:crossdrop/settings/settings_controller.dart';
import 'package:crossdrop/update/update_checker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shows the settings as a modal sheet anchored to the bottom of [context].
Future<void> showSettingsSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (sheetContext) => FractionallySizedBox(
      heightFactor: 0.9,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          child: SingleChildScrollView(child: SettingsPanel()),
        ),
      ),
    ),
  );
}

/// The full settings surface: visibility, download folder, launch-at-login,
/// appearance, and an update check.
class SettingsPanel extends StatefulWidget {
  const SettingsPanel({super.key});

  @override
  State<SettingsPanel> createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  late final TextEditingController _deviceNameController;
  bool _editingName = false;
  bool _autostartSupported = false;
  bool _autostartBusy = false;
  bool _checkingUpdate = false;
  String? _updateStatus;

  @override
  void initState() {
    super.initState();
    _deviceNameController = TextEditingController(
      text: context.read<SettingsController>().deviceName,
    );
    _autostartSupported = AutostartService.instance.isSupported;
    _syncAutostart();
  }

  @override
  void dispose() {
    _deviceNameController.dispose();
    super.dispose();
  }

  Future<void> _saveDeviceName() async {
    FocusScope.of(context).unfocus();
    final settings = context.read<SettingsController>();
    final newName = _deviceNameController.text.trim();
    if (newName.isEmpty) {
      _deviceNameController.text = settings.deviceName;
    } else {
      await settings.setDeviceName(newName);
    }
    if (mounted) setState(() => _editingName = false);
  }

  Future<void> _syncAutostart() async {
    if (!_autostartSupported) return;
    final enabled = await AutostartService.instance.isEnabled();
    if (!mounted) return;
    final settings = context.read<SettingsController>();
    if (settings.launchAtStartup != enabled) {
      await settings.setLaunchAtStartup(enabled);
    }
  }

  Future<void> _toggleAutostart(bool value) async {
    setState(() => _autostartBusy = true);
    final settings = context.read<SettingsController>();
    final effective = await AutostartService.instance.setEnabled(value);
    await settings.setLaunchAtStartup(effective);
    if (!mounted) return;
    setState(() => _autostartBusy = false);
    if (value && !effective) {
      _showSnack('Could not enable launch at login on this system.');
    }
  }

  /// Directory picking is only available on desktop platforms.
  bool get _canChooseDownloadDirectory =>
      Platform.isMacOS || Platform.isLinux || Platform.isWindows;

  Future<void> _pickDownloadDirectory() async {
    final settings = context.read<SettingsController>();
    try {
      final path = await getDirectoryPath();
      if (path == null) return;
      await settings.setDownloadDirectory(path);
    } catch (_) {
      if (mounted) _showSnack('Choosing a folder isn\'t available here.');
    }
  }

  Future<void> _checkForUpdates() async {
    setState(() {
      _checkingUpdate = true;
      _updateStatus = null;
    });
    final checker = UpdateChecker();
    final result = await checker.check();
    checker.dispose();
    if (!mounted) return;
    setState(() {
      _checkingUpdate = false;
      if (result == null) {
        _updateStatus = 'Could not check for updates right now.';
      } else if (result.updateAvailable) {
        _updateStatus =
            'Update available: ${result.latestVersion} '
            '(you have ${result.currentVersion}).';
      } else {
        _updateStatus = 'You\'re up to date (${result.currentVersion}).';
      }
    });
    if (result != null && result.updateAvailable) {
      unawaited(
        launchUrl(result.releaseUrl, mode: LaunchMode.externalApplication),
      );
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.maybeOf(
      context,
    )?.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final appTheme = context.watch<AppTheme>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Settings', style: theme.textTheme.titleLarge),
        const SizedBox(height: 16),

        _SettingsSection(
          title: 'Device name',
          child: DeviceNameField(
            controller: _deviceNameController,
            isEditing: _editingName,
            onChanged: (_) => setState(() => _editingName = true),
            onSave: () => unawaited(_saveDeviceName()),
          ),
        ),

        _SettingsSection(
          title: 'Visibility',
          child: VisibilityControl(
            visibility: settings.visibility,
            temporaryDuration: settings.temporaryVisibilityDuration,
            onChanged: (value) => unawaited(settings.setVisibility(value)),
          ),
        ),

        _SettingsSection(
          title: 'Received files',
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _canChooseDownloadDirectory
                      ? (settings.downloadDirectory ??
                            'Default Downloads folder')
                      : 'Saved in the CrossDrop app folder',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              if (_canChooseDownloadDirectory) ...[
                const SizedBox(width: 8),
                if (settings.downloadDirectory != null)
                  IconButton(
                    tooltip: 'Reset to default',
                    onPressed: () =>
                        unawaited(settings.setDownloadDirectory(null)),
                    icon: const Icon(Icons.restart_alt),
                  ),
                TextButton(
                  onPressed: () => unawaited(_pickDownloadDirectory()),
                  child: const Text('Change'),
                ),
              ],
            ],
          ),
        ),

        if (_autostartSupported)
          _SettingsSection(
            title: 'Startup',
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Launch at login'),
              subtitle: const Text('Start CrossDrop automatically.'),
              value: settings.launchAtStartup,
              onChanged: _autostartBusy
                  ? null
                  : (value) => unawaited(_toggleAutostart(value)),
            ),
          ),

        _SettingsSection(
          title: 'Appearance',
          child: SegmentedButton<ThemeMode>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: ThemeMode.system, label: Text('System')),
              ButtonSegment(value: ThemeMode.light, label: Text('Light')),
              ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
            ],
            selected: {appTheme.mode},
            onSelectionChanged: (selection) => appTheme.mode = selection.first,
          ),
        ),

        _SettingsSection(
          title: 'Updates',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton.icon(
                onPressed: _checkingUpdate
                    ? null
                    : () => unawaited(_checkForUpdates()),
                icon: _checkingUpdate
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.system_update_alt),
                label: const Text('Check for updates'),
              ),
              if (_updateStatus != null) ...[
                const SizedBox(height: 8),
                Text(_updateStatus!, style: theme.textTheme.bodySmall),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _SettingsSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
