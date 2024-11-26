import 'package:flutter/material.dart';

import 'app.dart';
import 'core/dependency_injection/di.dart';
import 'core/settings/settings_controller.dart';
import 'core/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// waiting to inject the application dependencies
  await setupDi();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
