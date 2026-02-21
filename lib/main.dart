import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'features/home/home_screen.dart';
import 'features/progress/progress_provider.dart';
import 'features/settings/locale_provider.dart';
import 'core/gamification/gamification_provider.dart';
import 'features/profile/profile_provider.dart';
import 'features/profile/welcome_screen.dart';
import 'features/onboarding/onboarding_screen.dart';

/// Notifier so the app rebuilds when onboarding completes
final ValueNotifier<bool> showOnboardingNotifier = ValueNotifier(true);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Content security — prevent screenshots and screen recording (Android)
  try {
    const platform = MethodChannel('smart_school/security');
    await platform.invokeMethod('enableSecureMode');
  } catch (_) {
    // Silently fail on platforms without native handler
  }

  // Check if this is the first launch
  showOnboardingNotifier.value = await OnboardingScreen.isFirstLaunch();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider()..loadProfiles(),
        ),

        ChangeNotifierProxyProvider<ProfileProvider, ProgressProvider>(
          create: (_) => ProgressProvider(),
          update: (_, profile, progress) =>
              progress!..updateUserId(profile.currentUser?.id),
        ),

        ChangeNotifierProxyProvider<ProfileProvider, GamificationProvider>(
          create: (_) => GamificationProvider(),
          update: (_, profile, gamification) =>
              gamification!..updateUserId(profile.currentUser?.id),
        ),
      ],
      child: const SmartSchoolApp(),
    ),
  );
}

class SmartSchoolApp extends StatelessWidget {
  const SmartSchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final profileProvider = context.watch<ProfileProvider>();

    return ValueListenableBuilder<bool>(
      valueListenable: showOnboardingNotifier,
      builder: (context, showOnboarding, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart School',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          locale: localeProvider.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
            Locale('fr'),
            Locale('it'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: showOnboarding
              ? const OnboardingScreen()
              : profileProvider.currentUser != null
              ? const HomeScreen()
              : const WelcomeScreen(),
        );
      },
    );
  }
}
