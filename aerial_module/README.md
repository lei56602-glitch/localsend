# Aerial LocalSend Flutter module

This directory is the Flutter add-to-app wrapper for embedding the existing
LocalSend app into Aerial TV. It intentionally delegates to
`package:localsend_app/main.dart`; it does not fork or reimplement LocalSend's
Dart business logic.

## Workspace

This package is a member of the parent LocalSend Dart workspace. Its dependency
on `../app` resolves the existing LocalSend application package, which in turn
uses the existing `localsend_isolates`, Rust FFI bindings, and typed-isolate
packages. Do not copy the LocalSend app or Rust code into this wrapper.

## Generate the Android module wrapper

Run with Flutter 3.41.x and Dart 3.11.x from this directory:

```sh
flutter pub get
```

Flutter generates the Android add-to-app host files under `.android/`.
Those generated files are build output and should not be hand-edited. Aerial's
Gradle settings will include the generated Flutter module script, then depend
on the generated `:flutter` project.

## Host integration requirements

Aerial must:
- embed this module as a Flutter add-to-app dependency, not as a second APK;
- launch it from Personalization in Aerial's own task;
- register Flutter plugins and LocalSend's custom Android method channel;
- port the custom methods from the original LocalSend `MainActivity` into a
  host-side `FlutterActivity` subclass (file/directory picker, file I/O,
  local-network permission, notifications, share-intent readiness);
- merge only required permissions and services, not LocalSend's launcher,
  application ID, icon, quick-settings tile, or standalone app activity;
- validate ABI/native Rust libraries, foreground receiving, Android API 21+
  compatibility, and D-pad operation before enabling the entry point.

This wrapper is an integration building block; it is not independently
installable and is not a claim that Aerial's host integration is complete.
