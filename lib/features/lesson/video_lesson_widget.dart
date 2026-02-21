import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/models.dart';

/// A crash-proof widget for embedding a YouTube lesson video.
/// Uses the first available video ID (English). Shows friendly error
/// states when offline or when playback fails — never crashes.
class VideoLessonWidget extends StatefulWidget {
  final Lesson lesson;

  const VideoLessonWidget({super.key, required this.lesson});

  @override
  State<VideoLessonWidget> createState() => _VideoLessonWidgetState();
}

class _VideoLessonWidgetState extends State<VideoLessonWidget> {
  YoutubePlayerController? _controller;
  String? _currentVideoId;
  _VideoState _state = _VideoState.loading;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller == null) {
      _initVideo();
    }
  }

  Future<void> _initVideo() async {
    try {
      // Use actual locale to pick the right video
      final locale = Localizations.localeOf(context).languageCode;
      final videoId = widget.lesson.getVideoIdForLocale(locale);

      if (videoId == null || videoId.isEmpty) {
        if (mounted) {
          setState(() => _state = _VideoState.error);
        }
        return;
      }

      // Don't rebuild if same video
      if (videoId == _currentVideoId && _controller != null) {
        return;
      }

      // Check connectivity first
      final online = await _checkConnectivity();
      if (!online) {
        if (mounted) {
          setState(() => _state = _VideoState.offline);
        }
        return;
      }

      _currentVideoId = videoId;
      _controller?.dispose();
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          controlsVisibleAtStart: true,
          enableCaption: true,
          forceHD: false,
        ),
      );

      if (mounted) {
        setState(() => _state = _VideoState.ready);
      }
    } catch (_) {
      // Any error during init → show error placeholder, never crash
      if (mounted) {
        setState(() => _state = _VideoState.error);
      }
    }
  }

  /// Quick DNS-based connectivity check
  Future<bool> _checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 3));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void _retry() {
    setState(() {
      _state = _VideoState.loading;
      _currentVideoId = null;
    });
    _controller?.dispose();
    _controller = null;
    _initVideo();
  }

  Future<void> _openInYouTube() async {
    if (_currentVideoId == null) return;
    final url = Uri.parse('https://www.youtube.com/watch?v=$_currentVideoId');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        // Fallback: try launching without checking
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      // Ignore errors opening external app
    }
  }

  @override
  void dispose() {
    try {
      _controller?.dispose();
    } catch (_) {
      // Ignore dispose errors
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (_state) {
      case _VideoState.loading:
        return _buildLoading(l10n, isDark);
      case _VideoState.offline:
        return _buildOffline(context, l10n, isDark);
      case _VideoState.error:
        return _buildError(context, l10n, isDark);
      case _VideoState.ready:
        return _buildPlayer(l10n, isDark);
    }
  }

  // ─── Player ───────────────────────────────────────────────

  Widget _buildPlayer(AppLocalizations l10n, bool isDark) {
    if (_controller == null) {
      return _buildError(context, l10n, isDark);
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(l10n, isDark),
          YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: AppColors.primary,
            progressColors: const ProgressBarColors(
              playedColor: AppColors.primary,
              handleColor: AppColors.primaryLight,
            ),
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 8),
              ProgressBar(isExpanded: true),
              const SizedBox(width: 8),
              RemainingDuration(),
              const SizedBox(width: 4),
              FullScreenButton(),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Header ───────────────────────────────────────────────

  Widget _buildHeader(AppLocalizations l10n, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [AppColors.primaryDark, AppColors.primary]
              : AppColors.primaryGradient,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.play_circle_filled_rounded,
            color: Colors.white,
            size: 22,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.watchVideo,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Loading ──────────────────────────────────────────────

  Widget _buildLoading(AppLocalizations l10n, bool isDark) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          _buildHeader(l10n, isDark),
          Container(
            height: 200,
            alignment: Alignment.center,
            color: isDark ? AppColors.surfaceDark : Colors.grey[100],
            child: const CircularProgressIndicator(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  // ─── Offline ──────────────────────────────────────────────

  Widget _buildOffline(
    BuildContext context,
    AppLocalizations l10n,
    bool isDark,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.wifi_off_rounded,
                size: 48,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.videoRequiresInternet,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _retry,
              icon: const Icon(Icons.refresh_rounded, size: 20),
              label: Text(l10n.retry),
              style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Error ────────────────────────────────────────────────

  Widget _buildError(BuildContext context, AppLocalizations l10n, bool isDark) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.videoPlaybackError,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: _retry,
                  icon: const Icon(Icons.refresh_rounded, size: 18),
                  label: Text(l10n.retry),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _openInYouTube,
                  icon: const Icon(Icons.open_in_new_rounded, size: 18),
                  label: Text(l10n.openInYoutube),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDark ? Colors.white : AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal state for the video widget
enum _VideoState { loading, offline, error, ready }
