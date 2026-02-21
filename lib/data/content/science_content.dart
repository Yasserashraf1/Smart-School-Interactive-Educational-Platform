import '../models/models.dart';
import '../../core/constants/app_constants.dart';

/// Hard-coded science content for the Aquatic Ecosystem unit.
/// All string values are ARB keys that get resolved via AppLocalizations.
class ScienceContent {
  ScienceContent._();

  static Subject getSubject() {
    return Subject(
      id: AppConstants.subjectId,
      nameKey: 'subjectIntegratedScience',
      descriptionKey: 'subjectDescription',
      iconEmoji: '🔬',
      lessons: _lessons,
      quiz: _quiz,
    );
  }

  static const List<Lesson> _lessons = [
    // Lesson 1: The Hydrosphere
    Lesson(
      id: 'lesson_1',
      order: 1,
      titleKey: 'lesson1Title',
      descriptionKey: 'lesson1Description',
      estimatedMinutes: 10,
      iconEmoji: '🌊',
      // Locale-specific videos provided by user
      videoIds: {
        'ar': 'kvmVRTb5ZmE',
        'fr': 'MCZF1lo5Xfw',
        'it': 'WFuhyGJmWkY',
        'en': 'y5gFI3pMvoI',
      },
      steps: [
        LessonStep(
          id: 'l1_s1',
          type: StepType.text,
          titleKey: 'lesson1Step1Title',
          contentKey: 'lesson1Step1Content',
        ),
        LessonStep(
          id: 'l1_s2',
          type: StepType.text,
          titleKey: 'lesson1Step2Title',
          contentKey: 'lesson1Step2Content',
        ),
        LessonStep(
          id: 'l1_s3',
          type: StepType.text,
          titleKey: 'lesson1Step3Title',
          contentKey: 'lesson1Step3Content',
        ),
        LessonStep(
          id: 'l1_check',
          type: StepType.interactiveQuestion,
          titleKey: 'lesson1CheckQ',
          contentKey: 'lesson1CheckQ',
          questionKey: 'lesson1CheckQ',
          optionKeys: [
            'lesson1CheckA1',
            'lesson1CheckA2',
            'lesson1CheckA3',
            'lesson1CheckA4',
          ],
          correctOptionIndex: 1,
          explanationKey: 'lesson1CheckExplanation',
        ),
        LessonStep(
          id: 'l1_game',
          type: StepType.sortGame,
          titleKey:
              'sortGameInstructions', // Reusing the instruction key as title for now
          contentKey: 'sortGameInstructions',
        ),
      ],
    ),
    // Lesson 2: Chemical Properties of Water
    Lesson(
      id: 'lesson_2',
      order: 2,
      titleKey: 'lesson2Title',
      descriptionKey: 'lesson2Description',
      estimatedMinutes: 12,
      iconEmoji: '⚗️',
      // Locale-specific videos provided by user
      videoIds: {
        'ar': 'kvmVRTb5ZmE',
        'fr': 'MCZF1lo5Xfw',
        'it': 'WFuhyGJmWkY',
        'en': 'y5gFI3pMvoI',
      },
      steps: [
        LessonStep(
          id: 'l2_s1',
          type: StepType.text,
          titleKey: 'lesson2Step1Title',
          contentKey: 'lesson2Step1Content',
        ),
        LessonStep(
          id: 'l2_s2',
          type: StepType.text,
          titleKey: 'lesson2Step2Title',
          contentKey: 'lesson2Step2Content',
        ),
        LessonStep(
          id: 'l2_s3',
          type: StepType.text,
          titleKey: 'lesson2Step3Title',
          contentKey: 'lesson2Step3Content',
        ),
        LessonStep(
          id: 'l2_check',
          type: StepType.interactiveQuestion,
          titleKey: 'lesson2CheckQ',
          contentKey: 'lesson2CheckQ',
          questionKey: 'lesson2CheckQ',
          optionKeys: [
            'lesson2CheckA1',
            'lesson2CheckA2',
            'lesson2CheckA3',
            'lesson2CheckA4',
          ],
          correctOptionIndex: 1,
          explanationKey: 'lesson2CheckExplanation',
        ),
      ],
    ),
    // Lesson 3: Biological Importance of Water
    Lesson(
      id: 'lesson_3',
      order: 3,
      titleKey: 'lesson3Title',
      descriptionKey: 'lesson3Description',
      estimatedMinutes: 12,
      iconEmoji: '🧬',
      // Locale-specific videos provided by user
      videoIds: {
        'ar': 'kvmVRTb5ZmE',
        'fr': 'MCZF1lo5Xfw',
        'it': 'WFuhyGJmWkY',
        'en': 'y5gFI3pMvoI',
      },
      steps: [
        LessonStep(
          id: 'l3_s1',
          type: StepType.text,
          titleKey: 'lesson3Step1Title',
          contentKey: 'lesson3Step1Content',
        ),
        LessonStep(
          id: 'l3_s2',
          type: StepType.text,
          titleKey: 'lesson3Step2Title',
          contentKey: 'lesson3Step2Content',
        ),
        LessonStep(
          id: 'l3_s3',
          type: StepType.text,
          titleKey: 'lesson3Step3Title',
          contentKey: 'lesson3Step3Content',
        ),
        LessonStep(
          id: 'l3_check',
          type: StepType.interactiveQuestion,
          titleKey: 'lesson3CheckQ',
          contentKey: 'lesson3CheckQ',
          questionKey: 'lesson3CheckQ',
          optionKeys: [
            'lesson3CheckA1',
            'lesson3CheckA2',
            'lesson3CheckA3',
            'lesson3CheckA4',
          ],
          correctOptionIndex: 2,
          explanationKey: 'lesson3CheckExplanation',
        ),
      ],
    ),
  ];

  static const Quiz _quiz = Quiz(
    id: AppConstants.quizId,
    titleKey: 'quizTitle',
    descriptionKey: 'quizDescription',
    passThreshold: 0.7,
    questions: [
      Question(
        id: 'q1',
        textKey: 'quiz1Q',
        optionKeys: ['quiz1A1', 'quiz1A2', 'quiz1A3', 'quiz1A4'],
        correctOptionIndex: 1,
        explanationKey: 'quiz1Explanation',
      ),
      Question(
        id: 'q2',
        textKey: 'quiz2Q',
        optionKeys: ['quiz2A1', 'quiz2A2', 'quiz2A3', 'quiz2A4'],
        correctOptionIndex: 2,
        explanationKey: 'quiz2Explanation',
      ),
      Question(
        id: 'q3',
        textKey: 'quiz3Q',
        optionKeys: ['quiz3A1', 'quiz3A2', 'quiz3A3', 'quiz3A4'],
        correctOptionIndex: 2,
        explanationKey: 'quiz3Explanation',
      ),
      Question(
        id: 'q4',
        textKey: 'quiz4Q',
        optionKeys: ['quiz4A1', 'quiz4A2', 'quiz4A3', 'quiz4A4'],
        correctOptionIndex: 2,
        explanationKey: 'quiz4Explanation',
      ),
      Question(
        id: 'q5',
        textKey: 'quiz5Q',
        optionKeys: ['quiz5A1', 'quiz5A2', 'quiz5A3', 'quiz5A4'],
        correctOptionIndex: 1,
        explanationKey: 'quiz5Explanation',
      ),
      Question(
        id: 'q6',
        textKey: 'quiz6Q',
        optionKeys: ['quiz6A1', 'quiz6A2', 'quiz6A3', 'quiz6A4'],
        correctOptionIndex: 1,
        explanationKey: 'quiz6Explanation',
      ),
      Question(
        id: 'q7',
        textKey: 'quiz7Q',
        optionKeys: ['quiz7A1', 'quiz7A2', 'quiz7A3', 'quiz7A4'],
        correctOptionIndex: 2,
        explanationKey: 'quiz7Explanation',
      ),
      Question(
        id: 'q8',
        textKey: 'quiz8Q',
        optionKeys: ['quiz8A1', 'quiz8A2', 'quiz8A3', 'quiz8A4'],
        correctOptionIndex: 1,
        explanationKey: 'quiz8Explanation',
      ),
      Question(
        id: 'q9',
        textKey: 'quiz9Q',
        optionKeys: ['quiz9A1', 'quiz9A2', 'quiz9A3', 'quiz9A4'],
        correctOptionIndex: 1,
        explanationKey: 'quiz9Explanation',
      ),
      Question(
        id: 'q10',
        textKey: 'quiz10Q',
        optionKeys: ['quiz10A1', 'quiz10A2', 'quiz10A3', 'quiz10A4'],
        correctOptionIndex: 1,
        explanationKey: 'quiz10Explanation',
      ),
    ],
  );
}
