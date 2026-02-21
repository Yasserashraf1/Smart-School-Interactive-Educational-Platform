/// Represents a step within an interactive lesson.
enum StepType { text, interactiveQuestion, sortGame }

class LessonStep {
  final String id;
  final StepType type;
  // For localization, these are ARB keys, not raw strings
  final String titleKey;
  final String contentKey;
  // For interactive questions
  final String? questionKey;
  final List<String>? optionKeys;
  final int? correctOptionIndex;
  final String? explanationKey;

  const LessonStep({
    required this.id,
    required this.type,
    required this.titleKey,
    required this.contentKey,
    this.questionKey,
    this.optionKeys,
    this.correctOptionIndex,
    this.explanationKey,
  });
}

class Lesson {
  final String id;
  final int order;
  final String titleKey;
  final String descriptionKey;
  final int estimatedMinutes;
  final List<LessonStep> steps;
  final String iconEmoji;

  /// Map of locale code -> YouTube video ID for lesson video.
  /// Fallback order: current locale -> 'ar' -> first available.
  final Map<String, String> videoIds;

  const Lesson({
    required this.id,
    required this.order,
    required this.titleKey,
    required this.descriptionKey,
    required this.estimatedMinutes,
    required this.steps,
    required this.iconEmoji,
    this.videoIds = const {},
  });

  /// Get the best video ID for the given locale code.
  String? getVideoIdForLocale(String localeCode) {
    return videoIds[localeCode] ??
        videoIds['ar'] ??
        (videoIds.isNotEmpty ? videoIds.values.first : null);
  }
}

class Question {
  final String id;
  final String textKey;
  final List<String> optionKeys;
  final int correctOptionIndex;
  final String explanationKey;

  const Question({
    required this.id,
    required this.textKey,
    required this.optionKeys,
    required this.correctOptionIndex,
    required this.explanationKey,
  });
}

class Quiz {
  final String id;
  final String titleKey;
  final String descriptionKey;
  final List<Question> questions;
  final double passThreshold;

  const Quiz({
    required this.id,
    required this.titleKey,
    required this.descriptionKey,
    required this.questions,
    this.passThreshold = 0.7,
  });
}

class Subject {
  final String id;
  final String nameKey;
  final String descriptionKey;
  final String iconEmoji;
  final List<Lesson> lessons;
  final Quiz quiz;

  const Subject({
    required this.id,
    required this.nameKey,
    required this.descriptionKey,
    required this.iconEmoji,
    required this.lessons,
    required this.quiz,
  });
}
