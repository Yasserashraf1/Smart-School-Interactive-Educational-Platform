import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
    Locale('it'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart School'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @lessons.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get lessons;

  /// No description provided for @quiz.
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quiz;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @continueWith.
  ///
  /// In en, this message translates to:
  /// **'Continue with'**
  String get continueWith;

  /// No description provided for @startLearning.
  ///
  /// In en, this message translates to:
  /// **'Start Learning'**
  String get startLearning;

  /// No description provided for @continueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue Learning'**
  String get continueLearning;

  /// No description provided for @overallProgress.
  ///
  /// In en, this message translates to:
  /// **'Overall Progress'**
  String get overallProgress;

  /// No description provided for @lessonsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Lessons Completed'**
  String get lessonsCompleted;

  /// No description provided for @bestScore.
  ///
  /// In en, this message translates to:
  /// **'Best Score'**
  String get bestScore;

  /// No description provided for @quizScore.
  ///
  /// In en, this message translates to:
  /// **'Quiz Score'**
  String get quizScore;

  /// No description provided for @noProgressYet.
  ///
  /// In en, this message translates to:
  /// **'No progress yet. Start your first lesson!'**
  String get noProgressYet;

  /// No description provided for @lessonOf.
  ///
  /// In en, this message translates to:
  /// **'Lesson {current} of {total}'**
  String lessonOf(int current, int total);

  /// No description provided for @stepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepOf(int current, int total);

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @markAsComplete.
  ///
  /// In en, this message translates to:
  /// **'Mark as Complete'**
  String get markAsComplete;

  /// No description provided for @lessonCompleted.
  ///
  /// In en, this message translates to:
  /// **'Lesson Completed!'**
  String get lessonCompleted;

  /// No description provided for @lessonCompletedMsg.
  ///
  /// In en, this message translates to:
  /// **'Great job! You\'ve completed this lesson.'**
  String get lessonCompletedMsg;

  /// No description provided for @continueToNext.
  ///
  /// In en, this message translates to:
  /// **'Continue to Next'**
  String get continueToNext;

  /// No description provided for @backToSubject.
  ///
  /// In en, this message translates to:
  /// **'Back to Subject'**
  String get backToSubject;

  /// No description provided for @startQuiz.
  ///
  /// In en, this message translates to:
  /// **'Start Quiz'**
  String get startQuiz;

  /// No description provided for @submitQuiz.
  ///
  /// In en, this message translates to:
  /// **'Submit Quiz'**
  String get submitQuiz;

  /// No description provided for @retryQuiz.
  ///
  /// In en, this message translates to:
  /// **'Retry Quiz'**
  String get retryQuiz;

  /// No description provided for @quizResults.
  ///
  /// In en, this message translates to:
  /// **'Quiz Results'**
  String get quizResults;

  /// No description provided for @yourScore.
  ///
  /// In en, this message translates to:
  /// **'Your Score'**
  String get yourScore;

  /// No description provided for @scorePercent.
  ///
  /// In en, this message translates to:
  /// **'{score}%'**
  String scorePercent(int score);

  /// No description provided for @questionsCorrect.
  ///
  /// In en, this message translates to:
  /// **'{correct} of {total} correct'**
  String questionsCorrect(int correct, int total);

  /// No description provided for @passed.
  ///
  /// In en, this message translates to:
  /// **'Passed!'**
  String get passed;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Keep Trying!'**
  String get failed;

  /// No description provided for @passedMsg.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve passed the quiz!'**
  String get passedMsg;

  /// No description provided for @failedMsg.
  ///
  /// In en, this message translates to:
  /// **'You need 70% to pass. Review the lessons and try again.'**
  String get failedMsg;

  /// No description provided for @correctAnswer.
  ///
  /// In en, this message translates to:
  /// **'Correct Answer'**
  String get correctAnswer;

  /// No description provided for @yourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Your Answer'**
  String get yourAnswer;

  /// No description provided for @explanation.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get explanation;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question {number}'**
  String question(int number);

  /// No description provided for @selectAnswer.
  ///
  /// In en, this message translates to:
  /// **'Select an answer'**
  String get selectAnswer;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get french;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italiano'**
  String get italian;

  /// No description provided for @studentName.
  ///
  /// In en, this message translates to:
  /// **'Student Name'**
  String get studentName;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @badges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get badges;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get unlocked;

  /// No description provided for @badgeFirstLesson.
  ///
  /// In en, this message translates to:
  /// **'First Steps'**
  String get badgeFirstLesson;

  /// No description provided for @badgeFirstLessonDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete your first lesson'**
  String get badgeFirstLessonDesc;

  /// No description provided for @badgeQuizMaster.
  ///
  /// In en, this message translates to:
  /// **'Quiz Master'**
  String get badgeQuizMaster;

  /// No description provided for @badgeQuizMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Score 100% on a quiz'**
  String get badgeQuizMasterDesc;

  /// No description provided for @badgeAllLessons.
  ///
  /// In en, this message translates to:
  /// **'Scholar'**
  String get badgeAllLessons;

  /// No description provided for @badgeAllLessonsDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete all lessons'**
  String get badgeAllLessonsDesc;

  /// No description provided for @badgeQuizPassed.
  ///
  /// In en, this message translates to:
  /// **'Passing Grade'**
  String get badgeQuizPassed;

  /// No description provided for @badgeQuizPassedDesc.
  ///
  /// In en, this message translates to:
  /// **'Pass a quiz with 70% or more'**
  String get badgeQuizPassedDesc;

  /// No description provided for @minutesShort.
  ///
  /// In en, this message translates to:
  /// **'{min} min'**
  String minutesShort(int min);

  /// No description provided for @subjectIntegratedScience.
  ///
  /// In en, this message translates to:
  /// **'Integrated Science'**
  String get subjectIntegratedScience;

  /// No description provided for @subjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Aquatic Ecosystem — 1st Year Secondary'**
  String get subjectDescription;

  /// No description provided for @lesson1Title.
  ///
  /// In en, this message translates to:
  /// **'The Hydrosphere'**
  String get lesson1Title;

  /// No description provided for @lesson1Description.
  ///
  /// In en, this message translates to:
  /// **'Water distribution on Earth and the water cycle'**
  String get lesson1Description;

  /// No description provided for @lesson2Title.
  ///
  /// In en, this message translates to:
  /// **'Chemical Properties of Water'**
  String get lesson2Title;

  /// No description provided for @lesson2Description.
  ///
  /// In en, this message translates to:
  /// **'Water molecule structure, polarity, and hydrogen bonding'**
  String get lesson2Description;

  /// No description provided for @lesson3Title.
  ///
  /// In en, this message translates to:
  /// **'Biological Importance of Water'**
  String get lesson3Title;

  /// No description provided for @lesson3Description.
  ///
  /// In en, this message translates to:
  /// **'Role of water in life and aquatic ecosystems'**
  String get lesson3Description;

  /// No description provided for @quizTitle.
  ///
  /// In en, this message translates to:
  /// **'Aquatic Ecosystem Assessment'**
  String get quizTitle;

  /// No description provided for @quizDescription.
  ///
  /// In en, this message translates to:
  /// **'Test your knowledge of the aquatic ecosystem'**
  String get quizDescription;

  /// No description provided for @lesson1Step1Title.
  ///
  /// In en, this message translates to:
  /// **'Water on Our Planet'**
  String get lesson1Step1Title;

  /// No description provided for @lesson1Step1Content.
  ///
  /// In en, this message translates to:
  /// **'Earth is often called the \'Blue Planet\' because about 71% of its surface is covered with water. The total volume of water on Earth is approximately 1.4 billion cubic kilometers.\n\nThis vast body of water is called the Hydrosphere.\n\nWater is distributed as follows:\n• Saltwater (oceans & seas): 97.5%\n• Freshwater: only 2.5%\n\nOf the 2.5% freshwater:\n• Glaciers & ice caps: 68.7%\n• Groundwater: 30.1%\n• Surface water (rivers, lakes): 1.2%'**
  String get lesson1Step1Content;

  /// No description provided for @lesson1Step2Title.
  ///
  /// In en, this message translates to:
  /// **'Types of Water Bodies'**
  String get lesson1Step2Title;

  /// No description provided for @lesson1Step2Content.
  ///
  /// In en, this message translates to:
  /// **'Water exists in many forms on our planet:\n\n🌊 Oceans & Seas — The largest water bodies, containing saltwater. The five oceans are the Pacific, Atlantic, Indian, Southern, and Arctic.\n\n🏞️ Rivers — Flowing freshwater bodies that carry water from mountains to seas.\n\n🏔️ Glaciers — Massive ice bodies formed from compressed snow over thousands of years.\n\n💧 Groundwater — Water stored beneath the Earth\'s surface in rock formations called aquifers.\n\n☁️ Atmospheric Water — Water vapor in the air, forming clouds and precipitation.'**
  String get lesson1Step2Content;

  /// No description provided for @lesson1Step3Title.
  ///
  /// In en, this message translates to:
  /// **'The Water Cycle'**
  String get lesson1Step3Title;

  /// No description provided for @lesson1Step3Content.
  ///
  /// In en, this message translates to:
  /// **'The Water Cycle is the continuous movement of water through the Earth system. It is driven by two forces: the Sun\'s energy and gravity.\n\nThe stages are:\n\n1️⃣ Evaporation — The Sun heats water in oceans, lakes, and rivers, turning it into water vapor that rises into the atmosphere.\n\n2️⃣ Transpiration — Plants release water vapor through their leaves, adding to atmospheric moisture.\n\n3️⃣ Condensation — As water vapor rises and cools, it condenses into tiny droplets, forming clouds.\n\n4️⃣ Precipitation — When droplets combine and become heavy enough, they fall as rain, snow, sleet, or hail.\n\n5️⃣ Collection — Water flows back into oceans, rivers, and lakes, or seeps into the ground to become groundwater.\n\nThis cycle has been running for billions of years and is essential for life on Earth.'**
  String get lesson1Step3Content;

  /// No description provided for @lesson1CheckQ.
  ///
  /// In en, this message translates to:
  /// **'What percentage of Earth\'s water is freshwater?'**
  String get lesson1CheckQ;

  /// No description provided for @lesson1CheckA1.
  ///
  /// In en, this message translates to:
  /// **'97.5%'**
  String get lesson1CheckA1;

  /// No description provided for @lesson1CheckA2.
  ///
  /// In en, this message translates to:
  /// **'2.5%'**
  String get lesson1CheckA2;

  /// No description provided for @lesson1CheckA3.
  ///
  /// In en, this message translates to:
  /// **'50%'**
  String get lesson1CheckA3;

  /// No description provided for @lesson1CheckA4.
  ///
  /// In en, this message translates to:
  /// **'25%'**
  String get lesson1CheckA4;

  /// No description provided for @lesson1CheckCorrect.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get lesson1CheckCorrect;

  /// No description provided for @lesson1CheckExplanation.
  ///
  /// In en, this message translates to:
  /// **'Only 2.5% of Earth\'s total water is freshwater. The remaining 97.5% is saltwater in oceans and seas.'**
  String get lesson1CheckExplanation;

  /// No description provided for @lesson2Step1Title.
  ///
  /// In en, this message translates to:
  /// **'The Water Molecule'**
  String get lesson2Step1Title;

  /// No description provided for @lesson2Step1Content.
  ///
  /// In en, this message translates to:
  /// **'Water (H₂O) is one of the most remarkable molecules in nature. Each water molecule consists of:\n• 2 Hydrogen atoms (H)\n• 1 Oxygen atom (O)\n\nThe oxygen atom is more electronegative than hydrogen, meaning it attracts the shared electrons more strongly. This creates an uneven distribution of electrical charge.\n\nAs a result, the water molecule is polar:\n• The oxygen side carries a slight negative charge (δ−)\n• The hydrogen side carries a slight positive charge (δ+)\n\nThis polarity is the key to almost all of water\'s special properties.'**
  String get lesson2Step1Content;

  /// No description provided for @lesson2Step2Title.
  ///
  /// In en, this message translates to:
  /// **'Hydrogen Bonding'**
  String get lesson2Step2Title;

  /// No description provided for @lesson2Step2Content.
  ///
  /// In en, this message translates to:
  /// **'Because water molecules are polar, the positive hydrogen end of one molecule is attracted to the negative oxygen end of another. This attraction is called a Hydrogen Bond.\n\nHydrogen bonds give water unique properties:\n\n🔬 High Boiling Point — Water stays liquid at temperatures where similar molecules would be gas.\n\n🧊 Ice Floats — Water expands when frozen, making ice less dense than liquid water. This protects aquatic life in winter.\n\n💪 Surface Tension — Water molecules at the surface hold together tightly, allowing small insects to walk on water.\n\n🌡️ High Specific Heat — Water can absorb a lot of heat before its temperature rises, stabilizing Earth\'s climate.'**
  String get lesson2Step2Content;

  /// No description provided for @lesson2Step3Title.
  ///
  /// In en, this message translates to:
  /// **'Water as a Solvent'**
  String get lesson2Step3Title;

  /// No description provided for @lesson2Step3Content.
  ///
  /// In en, this message translates to:
  /// **'Water is called the \'Universal Solvent\' because it can dissolve more substances than any other liquid.\n\nHow it works:\nWhen a substance like table salt (NaCl) enters water, the polar water molecules surround the ions:\n• The negative oxygen side attracts Na⁺ ions\n• The positive hydrogen side attracts Cl⁻ ions\n\nThis pulls the crystal apart and dissolves it.\n\nAqueous Solutions in Nature:\n• Seawater contains dissolved salts (average 35 g/L)\n• Blood is an aqueous solution carrying nutrients\n• Plant sap transports dissolved minerals from roots to leaves\n\npH & Water Quality:\npH measures how acidic or basic water is:\n• pH 7 = neutral (pure water)\n• pH < 7 = acidic\n• pH > 7 = basic\nAquatic organisms require specific pH ranges to survive.'**
  String get lesson2Step3Content;

  /// No description provided for @lesson2CheckQ.
  ///
  /// In en, this message translates to:
  /// **'Why is water called a \'polar molecule\'?'**
  String get lesson2CheckQ;

  /// No description provided for @lesson2CheckA1.
  ///
  /// In en, this message translates to:
  /// **'Because it exists at the North and South Poles'**
  String get lesson2CheckA1;

  /// No description provided for @lesson2CheckA2.
  ///
  /// In en, this message translates to:
  /// **'Because the charge is unevenly distributed in the molecule'**
  String get lesson2CheckA2;

  /// No description provided for @lesson2CheckA3.
  ///
  /// In en, this message translates to:
  /// **'Because it can dissolve any substance'**
  String get lesson2CheckA3;

  /// No description provided for @lesson2CheckA4.
  ///
  /// In en, this message translates to:
  /// **'Because it has a high boiling point'**
  String get lesson2CheckA4;

  /// No description provided for @lesson2CheckCorrect.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get lesson2CheckCorrect;

  /// No description provided for @lesson2CheckExplanation.
  ///
  /// In en, this message translates to:
  /// **'Water is polar because oxygen attracts electrons more strongly than hydrogen, creating an uneven charge distribution — negative near oxygen, positive near hydrogen.'**
  String get lesson2CheckExplanation;

  /// No description provided for @lesson3Step1Title.
  ///
  /// In en, this message translates to:
  /// **'Water and Life'**
  String get lesson3Step1Title;

  /// No description provided for @lesson3Step1Content.
  ///
  /// In en, this message translates to:
  /// **'Water is the foundation of all known life. Consider these facts:\n\n💧 The human body is about 60-70% water\n💧 A jellyfish is about 95% water\n💧 Even a tree is about 60% water\n\nWater plays critical roles in living organisms:\n\n🔄 Transport — Blood (which is mostly water) carries oxygen and nutrients to cells, and removes waste products.\n\n⚗️ Chemical Reactions — Most biochemical reactions happen in water. It\'s the medium where enzymes work.\n\n🌡️ Temperature Regulation — Sweating cools the body through evaporation. Water\'s high specific heat prevents rapid temperature changes.\n\n🏗️ Structure — Water gives cells their shape and volume through turgor pressure in plants.'**
  String get lesson3Step1Content;

  /// No description provided for @lesson3Step2Title.
  ///
  /// In en, this message translates to:
  /// **'Aquatic Adaptations'**
  String get lesson3Step2Title;

  /// No description provided for @lesson3Step2Content.
  ///
  /// In en, this message translates to:
  /// **'Living organisms have evolved remarkable adaptations to survive in water:\n\n🐟 Fish:\n• Gills extract dissolved oxygen from water\n• Streamlined bodies reduce water resistance\n• Swim bladders control buoyancy\n\n🐋 Marine Mammals:\n• Thick blubber for insulation in cold water\n• Can hold breath for extended periods\n• Echolocation for navigation\n\n🌿 Aquatic Plants:\n• Air spaces in tissues for buoyancy\n• Flexible stems that bend with currents\n• Stomata on upper leaf surfaces (in floating plants)\n\n🦠 Microscopic Organisms:\n• Phytoplankton — tiny plants that produce 50-70% of Earth\'s oxygen\n• Zooplankton — tiny animals that form the base of aquatic food chains'**
  String get lesson3Step2Content;

  /// No description provided for @lesson3Step3Title.
  ///
  /// In en, this message translates to:
  /// **'Ecological Balance & Human Impact'**
  String get lesson3Step3Title;

  /// No description provided for @lesson3Step3Content.
  ///
  /// In en, this message translates to:
  /// **'Aquatic ecosystems maintain a delicate balance. Here\'s how it works:\n\n⚖️ The Balance:\n• Producers (algae, water plants) make food using sunlight\n• Consumers (fish, animals) eat producers or other consumers\n• Decomposers break down dead organisms, recycling nutrients\n\n⚠️ Human Threats to This Balance:\n\n🏭 Industrial Pollution — Factories dumping chemicals into rivers and seas\n🧴 Plastic Pollution — 8 million tons of plastic enter oceans yearly\n🌡️ Global Warming — Rising temperatures harm coral reefs and change habitats\n🚰 Over-extraction — Taking too much groundwater faster than it\'s replenished\n\n🛡️ How We Can Help:\n• Reduce plastic use and recycle\n• Support wastewater treatment\n• Protect wetlands and coral reefs\n• Use water responsibly\n\nThe sustainability of aquatic ecosystems depends on responsible human action.'**
  String get lesson3Step3Content;

  /// No description provided for @lesson3CheckQ.
  ///
  /// In en, this message translates to:
  /// **'What percentage of Earth\'s oxygen is produced by phytoplankton?'**
  String get lesson3CheckQ;

  /// No description provided for @lesson3CheckA1.
  ///
  /// In en, this message translates to:
  /// **'10-20%'**
  String get lesson3CheckA1;

  /// No description provided for @lesson3CheckA2.
  ///
  /// In en, this message translates to:
  /// **'30-40%'**
  String get lesson3CheckA2;

  /// No description provided for @lesson3CheckA3.
  ///
  /// In en, this message translates to:
  /// **'50-70%'**
  String get lesson3CheckA3;

  /// No description provided for @lesson3CheckA4.
  ///
  /// In en, this message translates to:
  /// **'90-100%'**
  String get lesson3CheckA4;

  /// No description provided for @lesson3CheckCorrect.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get lesson3CheckCorrect;

  /// No description provided for @lesson3CheckExplanation.
  ///
  /// In en, this message translates to:
  /// **'Phytoplankton — tiny photosynthetic organisms in the ocean — produce approximately 50-70% of Earth\'s oxygen, making them crucial for life on our planet.'**
  String get lesson3CheckExplanation;

  /// No description provided for @quiz1Q.
  ///
  /// In en, this message translates to:
  /// **'What percentage of Earth\'s surface is covered by water?'**
  String get quiz1Q;

  /// No description provided for @quiz1A1.
  ///
  /// In en, this message translates to:
  /// **'50%'**
  String get quiz1A1;

  /// No description provided for @quiz1A2.
  ///
  /// In en, this message translates to:
  /// **'71%'**
  String get quiz1A2;

  /// No description provided for @quiz1A3.
  ///
  /// In en, this message translates to:
  /// **'85%'**
  String get quiz1A3;

  /// No description provided for @quiz1A4.
  ///
  /// In en, this message translates to:
  /// **'60%'**
  String get quiz1A4;

  /// No description provided for @quiz1Correct.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get quiz1Correct;

  /// No description provided for @quiz1Explanation.
  ///
  /// In en, this message translates to:
  /// **'About 71% of Earth\'s surface is covered by water, which is why our planet is called the \'Blue Planet.\''**
  String get quiz1Explanation;

  /// No description provided for @quiz2Q.
  ///
  /// In en, this message translates to:
  /// **'What are the two forces that drive the water cycle?'**
  String get quiz2Q;

  /// No description provided for @quiz2A1.
  ///
  /// In en, this message translates to:
  /// **'Wind and rain'**
  String get quiz2A1;

  /// No description provided for @quiz2A2.
  ///
  /// In en, this message translates to:
  /// **'The Moon and tides'**
  String get quiz2A2;

  /// No description provided for @quiz2A3.
  ///
  /// In en, this message translates to:
  /// **'The Sun\'s energy and gravity'**
  String get quiz2A3;

  /// No description provided for @quiz2A4.
  ///
  /// In en, this message translates to:
  /// **'Atmospheric pressure and humidity'**
  String get quiz2A4;

  /// No description provided for @quiz2Correct.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get quiz2Correct;

  /// No description provided for @quiz2Explanation.
  ///
  /// In en, this message translates to:
  /// **'The water cycle is driven by the Sun\'s energy (which causes evaporation) and gravity (which pulls precipitation down).'**
  String get quiz2Explanation;

  /// No description provided for @quiz3Q.
  ///
  /// In en, this message translates to:
  /// **'What type of bond forms between water molecules?'**
  String get quiz3Q;

  /// No description provided for @quiz3A1.
  ///
  /// In en, this message translates to:
  /// **'Ionic bond'**
  String get quiz3A1;

  /// No description provided for @quiz3A2.
  ///
  /// In en, this message translates to:
  /// **'Covalent bond'**
  String get quiz3A2;

  /// No description provided for @quiz3A3.
  ///
  /// In en, this message translates to:
  /// **'Hydrogen bond'**
  String get quiz3A3;

  /// No description provided for @quiz3A4.
  ///
  /// In en, this message translates to:
  /// **'Metallic bond'**
  String get quiz3A4;

  /// No description provided for @quiz3Correct.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get quiz3Correct;

  /// No description provided for @quiz3Explanation.
  ///
  /// In en, this message translates to:
  /// **'Hydrogen bonds form between water molecules due to the attraction between the positive hydrogen end and the negative oxygen end of neighboring molecules.'**
  String get quiz3Explanation;

  /// No description provided for @quiz4Q.
  ///
  /// In en, this message translates to:
  /// **'Why does ice float on water?'**
  String get quiz4Q;

  /// No description provided for @quiz4A1.
  ///
  /// In en, this message translates to:
  /// **'Ice is warmer than water'**
  String get quiz4A1;

  /// No description provided for @quiz4A2.
  ///
  /// In en, this message translates to:
  /// **'Water pushes ice up'**
  String get quiz4A2;

  /// No description provided for @quiz4A3.
  ///
  /// In en, this message translates to:
  /// **'Ice is less dense than liquid water'**
  String get quiz4A3;

  /// No description provided for @quiz4A4.
  ///
  /// In en, this message translates to:
  /// **'Ice contains air bubbles'**
  String get quiz4A4;

  /// No description provided for @quiz4Correct.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get quiz4Correct;

  /// No description provided for @quiz4Explanation.
  ///
  /// In en, this message translates to:
  /// **'When water freezes, it expands and becomes less dense than liquid water. This is why ice floats — a unique property caused by hydrogen bonding.'**
  String get quiz4Explanation;

  /// No description provided for @quiz5Q.
  ///
  /// In en, this message translates to:
  /// **'Why is water called the \'Universal Solvent\'?'**
  String get quiz5Q;

  /// No description provided for @quiz5A1.
  ///
  /// In en, this message translates to:
  /// **'It is found everywhere on Earth'**
  String get quiz5A1;

  /// No description provided for @quiz5A2.
  ///
  /// In en, this message translates to:
  /// **'It can dissolve more substances than any other liquid'**
  String get quiz5A2;

  /// No description provided for @quiz5A3.
  ///
  /// In en, this message translates to:
  /// **'It is used in all industries'**
  String get quiz5A3;

  /// No description provided for @quiz5A4.
  ///
  /// In en, this message translates to:
  /// **'It can exist in three states'**
  String get quiz5A4;

  /// No description provided for @quiz5Correct.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get quiz5Correct;

  /// No description provided for @quiz5Explanation.
  ///
  /// In en, this message translates to:
  /// **'Water\'s polarity allows it to dissolve more substances than any other liquid, earning the name \'Universal Solvent.\''**
  String get quiz5Explanation;

  /// No description provided for @quiz6Q.
  ///
  /// In en, this message translates to:
  /// **'What is the average salinity of seawater?'**
  String get quiz6Q;

  /// No description provided for @quiz6A1.
  ///
  /// In en, this message translates to:
  /// **'3.5 g/L'**
  String get quiz6A1;

  /// No description provided for @quiz6A2.
  ///
  /// In en, this message translates to:
  /// **'35 g/L'**
  String get quiz6A2;

  /// No description provided for @quiz6A3.
  ///
  /// In en, this message translates to:
  /// **'350 g/L'**
  String get quiz6A3;

  /// No description provided for @quiz6A4.
  ///
  /// In en, this message translates to:
  /// **'0.35 g/L'**
  String get quiz6A4;

  /// No description provided for @quiz6Correct.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get quiz6Correct;

  /// No description provided for @quiz6Explanation.
  ///
  /// In en, this message translates to:
  /// **'Seawater has an average salinity of about 35 grams per liter (3.5%), mainly due to dissolved sodium chloride (table salt).'**
  String get quiz6Explanation;

  /// No description provided for @quiz7Q.
  ///
  /// In en, this message translates to:
  /// **'What percentage of the human body is water?'**
  String get quiz7Q;

  /// No description provided for @quiz7A1.
  ///
  /// In en, this message translates to:
  /// **'30-40%'**
  String get quiz7A1;

  /// No description provided for @quiz7A2.
  ///
  /// In en, this message translates to:
  /// **'45-55%'**
  String get quiz7A2;

  /// No description provided for @quiz7A3.
  ///
  /// In en, this message translates to:
  /// **'60-70%'**
  String get quiz7A3;

  /// No description provided for @quiz7A4.
  ///
  /// In en, this message translates to:
  /// **'80-90%'**
  String get quiz7A4;

  /// No description provided for @quiz7Correct.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get quiz7Correct;

  /// No description provided for @quiz7Explanation.
  ///
  /// In en, this message translates to:
  /// **'The human body is approximately 60-70% water, which is essential for all bodily functions.'**
  String get quiz7Explanation;

  /// No description provided for @quiz8Q.
  ///
  /// In en, this message translates to:
  /// **'How do fish extract oxygen from water?'**
  String get quiz8Q;

  /// No description provided for @quiz8A1.
  ///
  /// In en, this message translates to:
  /// **'Through their skin'**
  String get quiz8A1;

  /// No description provided for @quiz8A2.
  ///
  /// In en, this message translates to:
  /// **'Through their gills'**
  String get quiz8A2;

  /// No description provided for @quiz8A3.
  ///
  /// In en, this message translates to:
  /// **'Through their fins'**
  String get quiz8A3;

  /// No description provided for @quiz8A4.
  ///
  /// In en, this message translates to:
  /// **'They come to the surface to breathe'**
  String get quiz8A4;

  /// No description provided for @quiz8Correct.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get quiz8Correct;

  /// No description provided for @quiz8Explanation.
  ///
  /// In en, this message translates to:
  /// **'Fish use gills to extract dissolved oxygen from water as it passes over the gill membranes.'**
  String get quiz8Explanation;

  /// No description provided for @quiz9Q.
  ///
  /// In en, this message translates to:
  /// **'What is pH 7 considered?'**
  String get quiz9Q;

  /// No description provided for @quiz9A1.
  ///
  /// In en, this message translates to:
  /// **'Acidic'**
  String get quiz9A1;

  /// No description provided for @quiz9A2.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get quiz9A2;

  /// No description provided for @quiz9A3.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get quiz9A3;

  /// No description provided for @quiz9A4.
  ///
  /// In en, this message translates to:
  /// **'Toxic'**
  String get quiz9A4;

  /// No description provided for @quiz9Correct.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get quiz9Correct;

  /// No description provided for @quiz9Explanation.
  ///
  /// In en, this message translates to:
  /// **'pH 7 is neutral — neither acidic nor basic. Pure water has a pH of 7.'**
  String get quiz9Explanation;

  /// No description provided for @quiz10Q.
  ///
  /// In en, this message translates to:
  /// **'How much plastic enters the oceans each year?'**
  String get quiz10Q;

  /// No description provided for @quiz10A1.
  ///
  /// In en, this message translates to:
  /// **'1 million tons'**
  String get quiz10A1;

  /// No description provided for @quiz10A2.
  ///
  /// In en, this message translates to:
  /// **'8 million tons'**
  String get quiz10A2;

  /// No description provided for @quiz10A3.
  ///
  /// In en, this message translates to:
  /// **'100 million tons'**
  String get quiz10A3;

  /// No description provided for @quiz10A4.
  ///
  /// In en, this message translates to:
  /// **'500 thousand tons'**
  String get quiz10A4;

  /// No description provided for @quiz10Correct.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get quiz10Correct;

  /// No description provided for @quiz10Explanation.
  ///
  /// In en, this message translates to:
  /// **'Approximately 8 million tons of plastic enter the oceans every year, posing a major threat to marine ecosystems.'**
  String get quiz10Explanation;

  /// No description provided for @watchVideo.
  ///
  /// In en, this message translates to:
  /// **'Watch Video Explanation'**
  String get watchVideo;

  /// No description provided for @videoUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Video Unavailable'**
  String get videoUnavailable;

  /// No description provided for @videoRequiresInternet.
  ///
  /// In en, this message translates to:
  /// **'Video requires an internet connection.'**
  String get videoRequiresInternet;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @timeTaken.
  ///
  /// In en, this message translates to:
  /// **'Time Taken:'**
  String get timeTaken;

  /// No description provided for @speedBonus.
  ///
  /// In en, this message translates to:
  /// **'Speed Bonus'**
  String get speedBonus;

  /// No description provided for @autoSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Time\'s up! Your quiz was automatically submitted.'**
  String get autoSubmitted;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @videoPlaybackError.
  ///
  /// In en, this message translates to:
  /// **'This video cannot be played in the app. Please try again later.'**
  String get videoPlaybackError;

  /// No description provided for @openInYoutube.
  ///
  /// In en, this message translates to:
  /// **'Watch on YouTube App'**
  String get openInYoutube;

  /// No description provided for @xpGained.
  ///
  /// In en, this message translates to:
  /// **'+{amount} XP'**
  String xpGained(int amount);

  /// No description provided for @levelUp.
  ///
  /// In en, this message translates to:
  /// **'Level Up!'**
  String get levelUp;

  /// No description provided for @currentLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String currentLevel(int level);

  /// No description provided for @totalXp.
  ///
  /// In en, this message translates to:
  /// **'Total XP: {xp}'**
  String totalXp(int xp);

  /// No description provided for @badgeUnlocked.
  ///
  /// In en, this message translates to:
  /// **'New Badge Unlocked!'**
  String get badgeUnlocked;

  /// No description provided for @freshWater.
  ///
  /// In en, this message translates to:
  /// **'Fresh Water'**
  String get freshWater;

  /// No description provided for @saltWater.
  ///
  /// In en, this message translates to:
  /// **'Salt Water'**
  String get saltWater;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get correct;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again!'**
  String get tryAgain;

  /// No description provided for @sortGameInstructions.
  ///
  /// In en, this message translates to:
  /// **'Drag the items to the correct water source!'**
  String get sortGameInstructions;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Learning Journey Starts Here'**
  String get welcomeTitle;

  /// No description provided for @welcomeCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get welcomeCreateAccount;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginTitle;

  /// No description provided for @loginEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get loginEmail;

  /// No description provided for @loginPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signupTitle;

  /// No description provided for @signupConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get signupConfirmPassword;

  /// No description provided for @signupNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get signupNext;

  /// No description provided for @avatarTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Avatar'**
  String get avatarTitle;

  /// No description provided for @avatarFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish Setup'**
  String get avatarFinish;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
