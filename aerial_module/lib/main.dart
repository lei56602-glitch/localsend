import 'package:localsend_app/main.dart' as localsend;

/// Flutter add-to-app entry point used by Aerial TV.
///
/// Keep LocalSend's original bootstrap intact: it initializes Rust FFI,
/// persistence, localization, network discovery, transfer services and UI.
Future<void> main() => localsend.main(const <String>[]);
