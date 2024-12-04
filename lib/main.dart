import 'package:budget_tracker/core/utils/localization_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'config/dependency_injection/di.dart';
import 'core/settings/settings_controller.dart';
import 'core/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

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
  runApp(
      // Builder(builder: (context) {
      // Initialize localization service
      // LocalizationService.initialize(AppLocalizations.of(context)!);
      MyApp()
      // })
      );
}
