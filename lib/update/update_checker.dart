import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

final Logger _log = Logger('update_checker');

/// Result of querying the GitHub releases API for a newer CrossDrop build.
class UpdateCheckResult {
  final String currentVersion;
  final String latestVersion;
  final bool updateAvailable;
  final Uri releaseUrl;

  const UpdateCheckResult({
    required this.currentVersion,
    required this.latestVersion,
    required this.updateAvailable,
    required this.releaseUrl,
  });
}

/// Checks GitHub Releases for a newer version of CrossDrop.
///
/// Mirrors rquickshare's "new version available" notification, but stays purely
/// informational — it never downloads or installs anything, it just compares
/// the running version against the latest published release tag.
class UpdateChecker {
  UpdateChecker({
    this.owner = 'Medformatik',
    this.repo = 'CrossDrop',
    HttpClient? httpClient,
  }) : _httpClient = httpClient ?? HttpClient();

  final String owner;
  final String repo;
  final HttpClient _httpClient;

  Uri get _apiUrl =>
      Uri.parse('https://api.github.com/repos/$owner/$repo/releases/latest');

  Future<UpdateCheckResult?> check() async {
    final info = await PackageInfo.fromPlatform();
    final current = info.version;

    try {
      final request = await _httpClient.getUrl(_apiUrl);
      request.headers.set(
        HttpHeaders.acceptHeader,
        'application/vnd.github+json',
      );
      request.headers.set(HttpHeaders.userAgentHeader, 'CrossDrop');
      final response = await request.close();
      if (response.statusCode != 200) {
        _log.info('Update check returned HTTP ${response.statusCode}');
        return null;
      }

      final body = await response.transform(utf8.decoder).join();
      final json = jsonDecode(body) as Map<String, dynamic>;
      final tag = (json['tag_name'] as String?) ?? '';
      final htmlUrl = (json['html_url'] as String?) ?? '';
      final latest = _normalizeVersion(tag);
      if (latest.isEmpty) return null;

      return UpdateCheckResult(
        currentVersion: current,
        latestVersion: latest,
        updateAvailable: isNewer(latest, current),
        releaseUrl:
            Uri.tryParse(htmlUrl) ??
            Uri.parse('https://github.com/$owner/$repo/releases/latest'),
      );
    } catch (e, s) {
      _log.info('Update check failed: $e\n$s');
      return null;
    }
  }

  void dispose() => _httpClient.close(force: true);

  /// Strips a leading `v` and any pre-release (`-rc1`) or build (`+build`)
  /// suffix from a release tag, leaving the dotted numeric core.
  static String _normalizeVersion(String tag) {
    var v = tag.trim();
    if (v.startsWith('v') || v.startsWith('V')) v = v.substring(1);
    return v.split(RegExp(r'[-+]')).first.trim();
  }

  /// Compares dotted numeric versions; returns true if [candidate] > [current].
  static bool isNewer(String candidate, String current) {
    final a = _parts(_normalizeVersion(candidate));
    final b = _parts(_normalizeVersion(current));
    final length = a.length > b.length ? a.length : b.length;
    for (var i = 0; i < length; i++) {
      final ai = i < a.length ? a[i] : 0;
      final bi = i < b.length ? b[i] : 0;
      if (ai != bi) return ai > bi;
    }
    return false;
  }

  static List<int> _parts(String version) {
    // Take the leading digits of each dotted segment so a pre-release suffix
    // (e.g. "3-rc1") compares as its base number ("3"), not "31".
    return version.split('.').map((part) {
      final match = RegExp(r'^\d+').firstMatch(part.trim());
      return match == null ? 0 : int.parse(match.group(0)!);
    }).toList();
  }
}
