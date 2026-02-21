import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/l10n/app_localizations.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class SortGameWidget extends StatefulWidget {
  final VoidCallback onCompleted;

  const SortGameWidget({super.key, required this.onCompleted});

  @override
  State<SortGameWidget> createState() => _SortGameWidgetState();
}

class _SortGameWidgetState extends State<SortGameWidget> {
  final Map<String, String> _items = {
    '🌊': 'salt', // Ocean
    '🏞️': 'fresh', // River
    '🌧️': 'fresh', // Rain
    '🦈': 'salt', // Shark (Sea)
  };

  final Map<String, bool> _placedItems = {};
  late ConfettiController _confettiController;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _checkCompletion() {
    if (_placedItems.length == _items.length) {
      setState(() {
        _isCompleted = true;
      });
      _confettiController.play();
      Future.delayed(const Duration(seconds: 2), () {
        widget.onCompleted();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                l10n.sortGameInstructions,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            // Draggable Items Area
            Container(
              height: 100,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _items.keys.map((emoji) {
                  if (_placedItems.containsKey(emoji)) {
                    return const SizedBox(
                      width: 60,
                      height: 60,
                    ); // Empty placeholder
                  }
                  return Draggable<String>(
                    data: emoji,
                    feedback: _buildItem(emoji, dragging: true),
                    childWhenDragging: Opacity(
                      opacity: 0.3,
                      child: _buildItem(emoji),
                    ),
                    child: _buildItem(emoji),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Targets
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildTargetZone(
                      context,
                      l10n.freshWater,
                      'fresh',
                      Colors.blue.shade300,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTargetZone(
                      context,
                      l10n.saltWater,
                      'salt',
                      Colors.indigo.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: pi / 2,
            numberOfParticles: 20,
            gravity: 0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildItem(String emoji, {bool dragging = false}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: dragging
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
        ),
        child: Center(child: Text(emoji, style: const TextStyle(fontSize: 32))),
      ),
    );
  }

  Widget _buildTargetZone(
    BuildContext context,
    String label,
    String type,
    Color color,
  ) {
    return DragTarget<String>(
      onWillAccept: (data) => !_isCompleted,
      onAccept: (data) {
        if (_items[data] == type) {
          setState(() {
            _placedItems[data] = true;
          });
          _checkCompletion();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.tryAgain),
              duration: Duration(milliseconds: 500),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: candidateData.isNotEmpty ? AppColors.success : color,
              width: candidateData.isNotEmpty ? 3 : 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color.withOpacity(1.0), // Fully opaque text
                ),
              ),
              const SizedBox(height: 20),
              // Show placed items in the zone
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _placedItems.entries
                    .where((e) => _items[e.key] == type)
                    .map((e) => _buildItem(e.key))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
