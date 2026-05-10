import 'dart:io';

List<String> filePathsFromArgs(Iterable<Object?> args) {
  final paths = <String>[];
  for (final arg in args) {
    if (arg is! String || arg.isEmpty) continue;
    String path;
    if (arg.startsWith('file:')) {
      try {
        path = Uri.parse(arg).toFilePath();
      } catch (_) {
        continue;
      }
    } else {
      path = arg;
    }

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.file &&
        !paths.contains(path)) {
      paths.add(path);
    }
  }
  return paths;
}
