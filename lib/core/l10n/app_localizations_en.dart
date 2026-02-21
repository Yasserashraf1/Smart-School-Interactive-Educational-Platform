// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Smart School';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get lessons => 'Lessons';

  @override
  String get quiz => 'Quiz';

  @override
  String get progress => 'Progress';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get continueWith => 'Continue with';

  @override
  String get startLearning => 'Start Learning';

  @override
  String get continueLearning => 'Continue Learning';

  @override
  String get overallProgress => 'Overall Progress';

  @override
  String get lessonsCompleted => 'Lessons Completed';

  @override
  String get bestScore => 'Best Score';

  @override
  String get quizScore => 'Quiz Score';

  @override
  String get noProgressYet => 'No progress yet. Start your first lesson!';

  @override
  String lessonOf(int current, int total) {
    return 'Lesson $current of $total';
  }

  @override
  String stepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get complete => 'Complete';

  @override
  String get markAsComplete => 'Mark as Complete';

  @override
  String get lessonCompleted => 'Lesson Completed!';

  @override
  String get lessonCompletedMsg => 'Great job! You\'ve completed this lesson.';

  @override
  String get continueToNext => 'Continue to Next';

  @override
  String get backToSubject => 'Back to Subject';

  @override
  String get startQuiz => 'Start Quiz';

  @override
  String get submitQuiz => 'Submit Quiz';

  @override
  String get retryQuiz => 'Retry Quiz';

  @override
  String get quizResults => 'Quiz Results';

  @override
  String get yourScore => 'Your Score';

  @override
  String scorePercent(int score) {
    return '$score%';
  }

  @override
  String questionsCorrect(int correct, int total) {
    return '$correct of $total correct';
  }

  @override
  String get passed => 'Passed!';

  @override
  String get failed => 'Keep Trying!';

  @override
  String get passedMsg => 'Congratulations! You\'ve passed the quiz!';

  @override
  String get failedMsg =>
      'You need 70% to pass. Review the lessons and try again.';

  @override
  String get correctAnswer => 'Correct Answer';

  @override
  String get yourAnswer => 'Your Answer';

  @override
  String get explanation => 'Explanation';

  @override
  String question(int number) {
    return 'Question $number';
  }

  @override
  String get selectAnswer => 'Select an answer';

  @override
  String get language => 'Language';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get italian => 'Italiano';

  @override
  String get studentName => 'Student Name';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get save => 'Save';

  @override
  String get badges => 'Badges';

  @override
  String get locked => 'Locked';

  @override
  String get unlocked => 'Unlocked';

  @override
  String get badgeFirstLesson => 'First Steps';

  @override
  String get badgeFirstLessonDesc => 'Complete your first lesson';

  @override
  String get badgeQuizMaster => 'Quiz Master';

  @override
  String get badgeQuizMasterDesc => 'Score 100% on a quiz';

  @override
  String get badgeAllLessons => 'Scholar';

  @override
  String get badgeAllLessonsDesc => 'Complete all lessons';

  @override
  String get badgeQuizPassed => 'Passing Grade';

  @override
  String get badgeQuizPassedDesc => 'Pass a quiz with 70% or more';

  @override
  String minutesShort(int min) {
    return '$min min';
  }

  @override
  String get subjectIntegratedScience => 'Integrated Science';

  @override
  String get subjectDescription => 'Aquatic Ecosystem — 1st Year Secondary';

  @override
  String get lesson1Title => 'The Hydrosphere';

  @override
  String get lesson1Description =>
      'Water distribution on Earth and the water cycle';

  @override
  String get lesson2Title => 'Chemical Properties of Water';

  @override
  String get lesson2Description =>
      'Water molecule structure, polarity, and hydrogen bonding';

  @override
  String get lesson3Title => 'Biological Importance of Water';

  @override
  String get lesson3Description =>
      'Role of water in life and aquatic ecosystems';

  @override
  String get quizTitle => 'Aquatic Ecosystem Assessment';

  @override
  String get quizDescription => 'Test your knowledge of the aquatic ecosystem';

  @override
  String get lesson1Step1Title => 'Water on Our Planet';

  @override
  String get lesson1Step1Content =>
      'Earth is often called the \'Blue Planet\' because about 71% of its surface is covered with water. The total volume of water on Earth is approximately 1.4 billion cubic kilometers.\n\nThis vast body of water is called the Hydrosphere.\n\nWater is distributed as follows:\n• Saltwater (oceans & seas): 97.5%\n• Freshwater: only 2.5%\n\nOf the 2.5% freshwater:\n• Glaciers & ice caps: 68.7%\n• Groundwater: 30.1%\n• Surface water (rivers, lakes): 1.2%';

  @override
  String get lesson1Step2Title => 'Types of Water Bodies';

  @override
  String get lesson1Step2Content =>
      'Water exists in many forms on our planet:\n\n🌊 Oceans & Seas — The largest water bodies, containing saltwater. The five oceans are the Pacific, Atlantic, Indian, Southern, and Arctic.\n\n🏞️ Rivers — Flowing freshwater bodies that carry water from mountains to seas.\n\n🏔️ Glaciers — Massive ice bodies formed from compressed snow over thousands of years.\n\n💧 Groundwater — Water stored beneath the Earth\'s surface in rock formations called aquifers.\n\n☁️ Atmospheric Water — Water vapor in the air, forming clouds and precipitation.';

  @override
  String get lesson1Step3Title => 'The Water Cycle';

  @override
  String get lesson1Step3Content =>
      'The Water Cycle is the continuous movement of water through the Earth system. It is driven by two forces: the Sun\'s energy and gravity.\n\nThe stages are:\n\n1️⃣ Evaporation — The Sun heats water in oceans, lakes, and rivers, turning it into water vapor that rises into the atmosphere.\n\n2️⃣ Transpiration — Plants release water vapor through their leaves, adding to atmospheric moisture.\n\n3️⃣ Condensation — As water vapor rises and cools, it condenses into tiny droplets, forming clouds.\n\n4️⃣ Precipitation — When droplets combine and become heavy enough, they fall as rain, snow, sleet, or hail.\n\n5️⃣ Collection — Water flows back into oceans, rivers, and lakes, or seeps into the ground to become groundwater.\n\nThis cycle has been running for billions of years and is essential for life on Earth.';

  @override
  String get lesson1CheckQ =>
      'What percentage of Earth\'s water is freshwater?';

  @override
  String get lesson1CheckA1 => '97.5%';

  @override
  String get lesson1CheckA2 => '2.5%';

  @override
  String get lesson1CheckA3 => '50%';

  @override
  String get lesson1CheckA4 => '25%';

  @override
  String get lesson1CheckCorrect => '1';

  @override
  String get lesson1CheckExplanation =>
      'Only 2.5% of Earth\'s total water is freshwater. The remaining 97.5% is saltwater in oceans and seas.';

  @override
  String get lesson2Step1Title => 'The Water Molecule';

  @override
  String get lesson2Step1Content =>
      'Water (H₂O) is one of the most remarkable molecules in nature. Each water molecule consists of:\n• 2 Hydrogen atoms (H)\n• 1 Oxygen atom (O)\n\nThe oxygen atom is more electronegative than hydrogen, meaning it attracts the shared electrons more strongly. This creates an uneven distribution of electrical charge.\n\nAs a result, the water molecule is polar:\n• The oxygen side carries a slight negative charge (δ−)\n• The hydrogen side carries a slight positive charge (δ+)\n\nThis polarity is the key to almost all of water\'s special properties.';

  @override
  String get lesson2Step2Title => 'Hydrogen Bonding';

  @override
  String get lesson2Step2Content =>
      'Because water molecules are polar, the positive hydrogen end of one molecule is attracted to the negative oxygen end of another. This attraction is called a Hydrogen Bond.\n\nHydrogen bonds give water unique properties:\n\n🔬 High Boiling Point — Water stays liquid at temperatures where similar molecules would be gas.\n\n🧊 Ice Floats — Water expands when frozen, making ice less dense than liquid water. This protects aquatic life in winter.\n\n💪 Surface Tension — Water molecules at the surface hold together tightly, allowing small insects to walk on water.\n\n🌡️ High Specific Heat — Water can absorb a lot of heat before its temperature rises, stabilizing Earth\'s climate.';

  @override
  String get lesson2Step3Title => 'Water as a Solvent';

  @override
  String get lesson2Step3Content =>
      'Water is called the \'Universal Solvent\' because it can dissolve more substances than any other liquid.\n\nHow it works:\nWhen a substance like table salt (NaCl) enters water, the polar water molecules surround the ions:\n• The negative oxygen side attracts Na⁺ ions\n• The positive hydrogen side attracts Cl⁻ ions\n\nThis pulls the crystal apart and dissolves it.\n\nAqueous Solutions in Nature:\n• Seawater contains dissolved salts (average 35 g/L)\n• Blood is an aqueous solution carrying nutrients\n• Plant sap transports dissolved minerals from roots to leaves\n\npH & Water Quality:\npH measures how acidic or basic water is:\n• pH 7 = neutral (pure water)\n• pH < 7 = acidic\n• pH > 7 = basic\nAquatic organisms require specific pH ranges to survive.';

  @override
  String get lesson2CheckQ => 'Why is water called a \'polar molecule\'?';

  @override
  String get lesson2CheckA1 => 'Because it exists at the North and South Poles';

  @override
  String get lesson2CheckA2 =>
      'Because the charge is unevenly distributed in the molecule';

  @override
  String get lesson2CheckA3 => 'Because it can dissolve any substance';

  @override
  String get lesson2CheckA4 => 'Because it has a high boiling point';

  @override
  String get lesson2CheckCorrect => '1';

  @override
  String get lesson2CheckExplanation =>
      'Water is polar because oxygen attracts electrons more strongly than hydrogen, creating an uneven charge distribution — negative near oxygen, positive near hydrogen.';

  @override
  String get lesson3Step1Title => 'Water and Life';

  @override
  String get lesson3Step1Content =>
      'Water is the foundation of all known life. Consider these facts:\n\n💧 The human body is about 60-70% water\n💧 A jellyfish is about 95% water\n💧 Even a tree is about 60% water\n\nWater plays critical roles in living organisms:\n\n🔄 Transport — Blood (which is mostly water) carries oxygen and nutrients to cells, and removes waste products.\n\n⚗️ Chemical Reactions — Most biochemical reactions happen in water. It\'s the medium where enzymes work.\n\n🌡️ Temperature Regulation — Sweating cools the body through evaporation. Water\'s high specific heat prevents rapid temperature changes.\n\n🏗️ Structure — Water gives cells their shape and volume through turgor pressure in plants.';

  @override
  String get lesson3Step2Title => 'Aquatic Adaptations';

  @override
  String get lesson3Step2Content =>
      'Living organisms have evolved remarkable adaptations to survive in water:\n\n🐟 Fish:\n• Gills extract dissolved oxygen from water\n• Streamlined bodies reduce water resistance\n• Swim bladders control buoyancy\n\n🐋 Marine Mammals:\n• Thick blubber for insulation in cold water\n• Can hold breath for extended periods\n• Echolocation for navigation\n\n🌿 Aquatic Plants:\n• Air spaces in tissues for buoyancy\n• Flexible stems that bend with currents\n• Stomata on upper leaf surfaces (in floating plants)\n\n🦠 Microscopic Organisms:\n• Phytoplankton — tiny plants that produce 50-70% of Earth\'s oxygen\n• Zooplankton — tiny animals that form the base of aquatic food chains';

  @override
  String get lesson3Step3Title => 'Ecological Balance & Human Impact';

  @override
  String get lesson3Step3Content =>
      'Aquatic ecosystems maintain a delicate balance. Here\'s how it works:\n\n⚖️ The Balance:\n• Producers (algae, water plants) make food using sunlight\n• Consumers (fish, animals) eat producers or other consumers\n• Decomposers break down dead organisms, recycling nutrients\n\n⚠️ Human Threats to This Balance:\n\n🏭 Industrial Pollution — Factories dumping chemicals into rivers and seas\n🧴 Plastic Pollution — 8 million tons of plastic enter oceans yearly\n🌡️ Global Warming — Rising temperatures harm coral reefs and change habitats\n🚰 Over-extraction — Taking too much groundwater faster than it\'s replenished\n\n🛡️ How We Can Help:\n• Reduce plastic use and recycle\n• Support wastewater treatment\n• Protect wetlands and coral reefs\n• Use water responsibly\n\nThe sustainability of aquatic ecosystems depends on responsible human action.';

  @override
  String get lesson3CheckQ =>
      'What percentage of Earth\'s oxygen is produced by phytoplankton?';

  @override
  String get lesson3CheckA1 => '10-20%';

  @override
  String get lesson3CheckA2 => '30-40%';

  @override
  String get lesson3CheckA3 => '50-70%';

  @override
  String get lesson3CheckA4 => '90-100%';

  @override
  String get lesson3CheckCorrect => '2';

  @override
  String get lesson3CheckExplanation =>
      'Phytoplankton — tiny photosynthetic organisms in the ocean — produce approximately 50-70% of Earth\'s oxygen, making them crucial for life on our planet.';

  @override
  String get quiz1Q =>
      'What percentage of Earth\'s surface is covered by water?';

  @override
  String get quiz1A1 => '50%';

  @override
  String get quiz1A2 => '71%';

  @override
  String get quiz1A3 => '85%';

  @override
  String get quiz1A4 => '60%';

  @override
  String get quiz1Correct => '1';

  @override
  String get quiz1Explanation =>
      'About 71% of Earth\'s surface is covered by water, which is why our planet is called the \'Blue Planet.\'';

  @override
  String get quiz2Q => 'What are the two forces that drive the water cycle?';

  @override
  String get quiz2A1 => 'Wind and rain';

  @override
  String get quiz2A2 => 'The Moon and tides';

  @override
  String get quiz2A3 => 'The Sun\'s energy and gravity';

  @override
  String get quiz2A4 => 'Atmospheric pressure and humidity';

  @override
  String get quiz2Correct => '2';

  @override
  String get quiz2Explanation =>
      'The water cycle is driven by the Sun\'s energy (which causes evaporation) and gravity (which pulls precipitation down).';

  @override
  String get quiz3Q => 'What type of bond forms between water molecules?';

  @override
  String get quiz3A1 => 'Ionic bond';

  @override
  String get quiz3A2 => 'Covalent bond';

  @override
  String get quiz3A3 => 'Hydrogen bond';

  @override
  String get quiz3A4 => 'Metallic bond';

  @override
  String get quiz3Correct => '2';

  @override
  String get quiz3Explanation =>
      'Hydrogen bonds form between water molecules due to the attraction between the positive hydrogen end and the negative oxygen end of neighboring molecules.';

  @override
  String get quiz4Q => 'Why does ice float on water?';

  @override
  String get quiz4A1 => 'Ice is warmer than water';

  @override
  String get quiz4A2 => 'Water pushes ice up';

  @override
  String get quiz4A3 => 'Ice is less dense than liquid water';

  @override
  String get quiz4A4 => 'Ice contains air bubbles';

  @override
  String get quiz4Correct => '2';

  @override
  String get quiz4Explanation =>
      'When water freezes, it expands and becomes less dense than liquid water. This is why ice floats — a unique property caused by hydrogen bonding.';

  @override
  String get quiz5Q => 'Why is water called the \'Universal Solvent\'?';

  @override
  String get quiz5A1 => 'It is found everywhere on Earth';

  @override
  String get quiz5A2 => 'It can dissolve more substances than any other liquid';

  @override
  String get quiz5A3 => 'It is used in all industries';

  @override
  String get quiz5A4 => 'It can exist in three states';

  @override
  String get quiz5Correct => '1';

  @override
  String get quiz5Explanation =>
      'Water\'s polarity allows it to dissolve more substances than any other liquid, earning the name \'Universal Solvent.\'';

  @override
  String get quiz6Q => 'What is the average salinity of seawater?';

  @override
  String get quiz6A1 => '3.5 g/L';

  @override
  String get quiz6A2 => '35 g/L';

  @override
  String get quiz6A3 => '350 g/L';

  @override
  String get quiz6A4 => '0.35 g/L';

  @override
  String get quiz6Correct => '1';

  @override
  String get quiz6Explanation =>
      'Seawater has an average salinity of about 35 grams per liter (3.5%), mainly due to dissolved sodium chloride (table salt).';

  @override
  String get quiz7Q => 'What percentage of the human body is water?';

  @override
  String get quiz7A1 => '30-40%';

  @override
  String get quiz7A2 => '45-55%';

  @override
  String get quiz7A3 => '60-70%';

  @override
  String get quiz7A4 => '80-90%';

  @override
  String get quiz7Correct => '2';

  @override
  String get quiz7Explanation =>
      'The human body is approximately 60-70% water, which is essential for all bodily functions.';

  @override
  String get quiz8Q => 'How do fish extract oxygen from water?';

  @override
  String get quiz8A1 => 'Through their skin';

  @override
  String get quiz8A2 => 'Through their gills';

  @override
  String get quiz8A3 => 'Through their fins';

  @override
  String get quiz8A4 => 'They come to the surface to breathe';

  @override
  String get quiz8Correct => '1';

  @override
  String get quiz8Explanation =>
      'Fish use gills to extract dissolved oxygen from water as it passes over the gill membranes.';

  @override
  String get quiz9Q => 'What is pH 7 considered?';

  @override
  String get quiz9A1 => 'Acidic';

  @override
  String get quiz9A2 => 'Neutral';

  @override
  String get quiz9A3 => 'Basic';

  @override
  String get quiz9A4 => 'Toxic';

  @override
  String get quiz9Correct => '1';

  @override
  String get quiz9Explanation =>
      'pH 7 is neutral — neither acidic nor basic. Pure water has a pH of 7.';

  @override
  String get quiz10Q => 'How much plastic enters the oceans each year?';

  @override
  String get quiz10A1 => '1 million tons';

  @override
  String get quiz10A2 => '8 million tons';

  @override
  String get quiz10A3 => '100 million tons';

  @override
  String get quiz10A4 => '500 thousand tons';

  @override
  String get quiz10Correct => '1';

  @override
  String get quiz10Explanation =>
      'Approximately 8 million tons of plastic enter the oceans every year, posing a major threat to marine ecosystems.';

  @override
  String get watchVideo => 'Watch Video Explanation';

  @override
  String get videoUnavailable => 'Video Unavailable';

  @override
  String get videoRequiresInternet => 'Video requires an internet connection.';

  @override
  String get theme => 'Theme';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get timeTaken => 'Time Taken:';

  @override
  String get speedBonus => 'Speed Bonus';

  @override
  String get autoSubmitted =>
      'Time\'s up! Your quiz was automatically submitted.';

  @override
  String get retry => 'Retry';

  @override
  String get videoPlaybackError =>
      'This video cannot be played in the app. Please try again later.';

  @override
  String get openInYoutube => 'Watch on YouTube App';

  @override
  String xpGained(int amount) {
    return '+$amount XP';
  }

  @override
  String get levelUp => 'Level Up!';

  @override
  String currentLevel(int level) {
    return 'Level $level';
  }

  @override
  String totalXp(int xp) {
    return 'Total XP: $xp';
  }

  @override
  String get badgeUnlocked => 'New Badge Unlocked!';

  @override
  String get freshWater => 'Fresh Water';

  @override
  String get saltWater => 'Salt Water';

  @override
  String get correct => 'Correct!';

  @override
  String get tryAgain => 'Try again!';

  @override
  String get sortGameInstructions =>
      'Drag the items to the correct water source!';

  @override
  String get welcomeTitle => 'Your Learning Journey Starts Here';

  @override
  String get welcomeCreateAccount => 'Create Account';

  @override
  String get loginTitle => 'Welcome Back';

  @override
  String get loginEmail => 'Email Address';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginButton => 'Login';

  @override
  String get signupTitle => 'Create Account';

  @override
  String get signupConfirmPassword => 'Confirm Password';

  @override
  String get signupNext => 'Next';

  @override
  String get avatarTitle => 'Choose Avatar';

  @override
  String get avatarFinish => 'Finish Setup';
}
