import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

const _fileActionsChannel = MethodChannel('crossdrop/file_actions');

Future<void> revealFileInFileManager(String path) async {
  final entityType = FileSystemEntity.typeSync(path);
  if (entityType == FileSystemEntityType.notFound) {
    throw FileSystemException('File does not exist', path);
  }

  if (Platform.isMacOS) {
    await _runFileManagerCommand('open', ['-R', path]);
    return;
  }

  if (Platform.isWindows) {
    final normalizedPath = p.normalize(path);
    final result = await Process.run('explorer.exe', [
      '/select,$normalizedPath',
    ]);
    if (result.exitCode == 0) return;
    await _runFileManagerCommand('explorer.exe', [_parentDirectory(path)]);
    return;
  }

  if (Platform.isLinux) {
    final uri = Uri.file(path).toString();
    final shown = await _tryRunFileManagerCommand('dbus-send', [
      '--session',
      '--dest=org.freedesktop.FileManager1',
      '--type=method_call',
      '/org/freedesktop/FileManager1',
      'org.freedesktop.FileManager1.ShowItems',
      'array:string:$uri',
      'string:',
    ]);
    if (shown) return;

    await _runFileManagerCommand('xdg-open', [_parentDirectory(path)]);
    return;
  }

  throw UnsupportedError('No file manager reveal command for this platform');
}

Future<void> openFileWithDefaultApp(String path) async {
  final entityType = FileSystemEntity.typeSync(path);
  if (entityType == FileSystemEntityType.notFound) {
    throw FileSystemException('File does not exist', path);
  }

  if (Platform.isIOS) {
    await _fileActionsChannel.invokeMethod<void>('openFile', {'path': path});
    return;
  }

  if (Platform.isMacOS) {
    await _runFileManagerCommand('open', [path]);
    return;
  }

  if (Platform.isWindows) {
    await _runFileManagerCommand('rundll32', [
      'url.dll,FileProtocolHandler',
      path,
    ]);
    return;
  }

  if (Platform.isLinux) {
    await _runFileManagerCommand('xdg-open', [path]);
    return;
  }

  throw UnsupportedError('No open-file command for this platform');
}

Future<void> _runFileManagerCommand(
  String executable,
  List<String> arguments,
) async {
  final result = await Process.run(executable, arguments);
  if (result.exitCode != 0) {
    throw ProcessException(
      executable,
      arguments,
      '${result.stderr}'.trim(),
      result.exitCode,
    );
  }
}

Future<bool> _tryRunFileManagerCommand(
  String executable,
  List<String> arguments,
) async {
  try {
    final result = await Process.run(executable, arguments);
    return result.exitCode == 0;
  } on Object {
    return false;
  }
}

String _parentDirectory(String path) {
  return FileSystemEntity.isDirectorySync(path) ? path : p.dirname(path);
}
