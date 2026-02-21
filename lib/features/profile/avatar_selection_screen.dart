import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/l10n/app_localizations.dart';
import '../home/home_screen.dart';

class AvatarSelectionScreen extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  const AvatarSelectionScreen({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  State<AvatarSelectionScreen> createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  String _selectedAvatar = 'assets/avatars/boy_1.png'; // Default
  bool _isLoading = false;

  final List<String> _avatars = [
    'assets/avatars/boy_1.png',
    'assets/avatars/girl_1.png',
    'assets/avatars/boy_2.png',
    'assets/avatars/girl_2.png',
    'assets/avatars/boy_3.png',
    'assets/avatars/girl_3.png',
  ];

  Future<void> _finishSignup() async {
    setState(() => _isLoading = true);

    final user = await context.read<ProfileProvider>().signUp(
      widget.name,
      widget.email,
      widget.password,
      _selectedAvatar,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (user != null) {
      // Show success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle_rounded, color: Colors.white, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Account created successfully! 🎉',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          duration: const Duration(seconds: 3),
          elevation: 6,
        ),
      );
      // Navigate to HomeScreen and clear entire navigation stack
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    } else {
      // Error (likely email exists)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Error creating account. Email might already be in use.',
          ),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.avatarTitle),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              l10n.avatarTitle,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                ),
                itemCount: _avatars.length,
                itemBuilder: (context, index) {
                  final path = _avatars[index];
                  final isSelected = _selectedAvatar == path;
                  final bgColor = [
                    const Color(0xFFE3F2FD), // Blue
                    const Color(0xFFFCE4EC), // Pink
                    const Color(0xFFE8F5E9), // Green
                    const Color(0xFFFFF3E0), // Orange
                    const Color(0xFFF3E5F5), // Purple
                    const Color(0xFFE0F7FA), // Cyan
                  ][index % 6];

                  return GestureDetector(
                    onTap: () => setState(() => _selectedAvatar = path),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: AppColors.primary, width: 4)
                            : Border.all(color: Colors.transparent, width: 4),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),
                      padding: const EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: bgColor,
                        child: Icon(
                          index % 2 == 0 ? Icons.face : Icons.face_3,
                          color: AppColors.primary,
                          size: 40,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _finishSignup,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          l10n.avatarFinish,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
