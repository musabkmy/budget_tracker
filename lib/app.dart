import 'package:budget_tracker/config/dependency_injection/di.dart';
import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budgets_metadata/get_budgets_metadata_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/providers/create_budget_popup_appearance_provider.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/page/budget_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
// import 'core/settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    // required this.settingsController,
  });

  // final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    // return
    // ListenableBuilder(
    // listenable: settingsController,
    // builder: (BuildContext context, Widget? child) {
    // return
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetBudgetsMetadataBloc>(
            create: (_) => di<GetBudgetsMetadataBloc>()),
        BlocProvider<CreateBudgetBloc>(create: (_) => di<CreateBudgetBloc>()),
        BlocProvider<GetBudgetBloc>(create: (_) => di<GetBudgetBloc>()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<CreateBudgetPopupAppearanceProvider>(
              create: (_) => di<CreateBudgetPopupAppearanceProvider>()),
          ChangeNotifierProvider<EditingNumericFieldProvider>(
              create: (_) => di<EditingNumericFieldProvider>()),
        ],
        child: ScreenUtilInit(
          // designSize: const Size(360, 690),
          designSize: const Size(375, 812),
          ensureScreenSize: true,
          enableScaleWH: () => true,
          minTextAdapt: true,
          enableScaleText: () => false,
          child: CupertinoApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.appTitle,
            // title: AppLocalizations.of(context)!.appTitle,
            debugShowCheckedModeBanner: false,
            theme:
                appTheme(brightness: MediaQuery.of(context).platformBrightness),
            home: BudgetPage(),
          ),
        ),
      ),
    );
    // },
    // );
  }
}

// return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
//           // background.
//           restorationScopeId: 'app',

//           // Provide the generated AppLocalizations to the MaterialApp. This
//           // allows descendant Widgets to display the correct translations
//           // depending on the user's locale.
//           localizationsDelegates: const [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: const [
//             Locale('en', ''), // English, no country code
//           ],

//           // Define a light and dark color theme. Then, read the user's
//           // preferred ThemeMode (light, dark, or system default) from the
//           // SettingsController to display the correct theme.
//           theme: ThemeData(),
//           darkTheme: ThemeData.dark(),
//           themeMode: settingsController.themeMode,

//           // Define a function to handle named routes in order to support
//           // Flutter web url navigation and deep linking.
//           onGenerateRoute: (RouteSettings routeSettings) {
//             return MaterialPageRoute<void>(
//               settings: routeSettings,
//               builder: (BuildContext context) {
//                 switch (routeSettings.name) {
//                   case SettingsView.routeName:
//                     return SettingsView(controller: settingsController);
//                   default:
//                     return SettingsView(controller: settingsController);
//                 }
//               },
//             );
//           },
//         );
