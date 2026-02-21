import 'package:flutter/material.dart';
import '../../features/profile/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/theme_provider.dart';
import '../settings/locale_provider.dart';
import '../profile/welcome_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = context.watch<LocaleProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ─── Theme Toggle ───
          Text(l10n.theme, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Card(
            child: SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              secondary: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                  key: ValueKey(isDark),
                  color: isDark ? AppColors.gold : AppColors.warning,
                  size: 28,
                ),
              ),
              title: Text(
                isDark ? l10n.darkMode : l10n.lightMode,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              value: isDark,
              onChanged: (_) => themeProvider.toggleTheme(),
              activeTrackColor: AppColors.primary,
            ),
          ),

          const SizedBox(height: 24),

          // ─── Language Selection ───
          Text(l10n.language, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          ..._languages.map((lang) {
            final isSelected = localeProvider.locale.languageCode == lang.code;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                color: isSelected
                    ? Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.08)
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: isSelected
                      ? BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        )
                      : BorderSide.none,
                ),
                child: ListTile(
                  onTap: () {
                    localeProvider.setLocale(Locale(lang.code));
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  leading: Text(
                    lang.flag,
                    style: const TextStyle(fontSize: 28),
                  ),
                  title: Text(
                    lang.nativeName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(lang.englishName),
                  trailing: isSelected
                      ? Icon(
                          Icons.check_circle_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                ),
              ),
            );
          }),

          const SizedBox(height: 24),

          // ─── App Info ───
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('🎓', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 12),
                  Text(
                    l10n.appTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text('v1.0.0', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text(
                    'Demo — Egyptian Integrated Science Curriculum',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: const Text(
              'Switch Profile',
              style: TextStyle(color: AppColors.error),
            ),
            onTap: () {
              context.read<ProfileProvider>().logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LanguageOption {
  final String code;
  final String nativeName;
  final String englishName;
  final String flag;
  const _LanguageOption(
    this.code,
    this.nativeName,
    this.englishName,
    this.flag,
  );
}

const _languages = [
  _LanguageOption('en', 'English', 'English', '🇬🇧'),
  _LanguageOption('ar', 'العربية', 'Arabic', '🇪🇬'),
  _LanguageOption('fr', 'Français', 'French', '🇫🇷'),
  _LanguageOption('it', 'Italiano', 'Italian', '🇮🇹'),
];
