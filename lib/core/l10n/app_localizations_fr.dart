// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'École Intelligente';

  @override
  String get home => 'Accueil';

  @override
  String get settings => 'Paramètres';

  @override
  String get lessons => 'Leçons';

  @override
  String get quiz => 'Quiz';

  @override
  String get progress => 'Progrès';

  @override
  String get welcomeBack => 'Bon Retour !';

  @override
  String get continueWith => 'Continuer avec';

  @override
  String get startLearning => 'Commencer à Apprendre';

  @override
  String get continueLearning => 'Continuer à Apprendre';

  @override
  String get overallProgress => 'Progrès Global';

  @override
  String get lessonsCompleted => 'Leçons Terminées';

  @override
  String get bestScore => 'Meilleur Score';

  @override
  String get quizScore => 'Score du Quiz';

  @override
  String get noProgressYet =>
      'Pas encore de progrès. Commencez votre première leçon !';

  @override
  String lessonOf(int current, int total) {
    return 'Leçon $current sur $total';
  }

  @override
  String stepOf(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String get next => 'Suivant';

  @override
  String get previous => 'Précédent';

  @override
  String get complete => 'Terminer';

  @override
  String get markAsComplete => 'Marquer comme terminé';

  @override
  String get lessonCompleted => 'Leçon Terminée !';

  @override
  String get lessonCompletedMsg => 'Bravo ! Vous avez terminé cette leçon.';

  @override
  String get continueToNext => 'Passer à la suite';

  @override
  String get backToSubject => 'Retour à la matière';

  @override
  String get startQuiz => 'Commencer le Quiz';

  @override
  String get submitQuiz => 'Soumettre le Quiz';

  @override
  String get retryQuiz => 'Réessayer le Quiz';

  @override
  String get quizResults => 'Résultats du Quiz';

  @override
  String get yourScore => 'Votre Score';

  @override
  String scorePercent(int score) {
    return '$score%';
  }

  @override
  String questionsCorrect(int correct, int total) {
    return '$correct sur $total correctes';
  }

  @override
  String get passed => 'Réussi !';

  @override
  String get failed => 'Continuez d\'essayer !';

  @override
  String get passedMsg => 'Félicitations ! Vous avez réussi le quiz !';

  @override
  String get failedMsg =>
      'Il faut 70% pour réussir. Révisez les leçons et réessayez.';

  @override
  String get correctAnswer => 'Bonne Réponse';

  @override
  String get yourAnswer => 'Votre Réponse';

  @override
  String get explanation => 'Explication';

  @override
  String question(int number) {
    return 'Question $number';
  }

  @override
  String get selectAnswer => 'Sélectionnez une réponse';

  @override
  String get language => 'Langue';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get italian => 'Italiano';

  @override
  String get studentName => 'Nom de l\'élève';

  @override
  String get enterYourName => 'Entrez votre nom';

  @override
  String get save => 'Enregistrer';

  @override
  String get badges => 'Badges';

  @override
  String get locked => 'Verrouillé';

  @override
  String get unlocked => 'Déverrouillé';

  @override
  String get badgeFirstLesson => 'Premiers Pas';

  @override
  String get badgeFirstLessonDesc => 'Terminez votre première leçon';

  @override
  String get badgeQuizMaster => 'Maître du Quiz';

  @override
  String get badgeQuizMasterDesc => 'Obtenez 100% à un quiz';

  @override
  String get badgeAllLessons => 'Érudit';

  @override
  String get badgeAllLessonsDesc => 'Terminez toutes les leçons';

  @override
  String get badgeQuizPassed => 'Note de Passage';

  @override
  String get badgeQuizPassedDesc => 'Réussissez un quiz avec 70% ou plus';

  @override
  String minutesShort(int min) {
    return '$min min';
  }

  @override
  String get subjectIntegratedScience => 'Sciences Intégrées';

  @override
  String get subjectDescription =>
      'Écosystème Aquatique — 1ère Année Secondaire';

  @override
  String get lesson1Title => 'L\'Hydrosphère';

  @override
  String get lesson1Description =>
      'Distribution de l\'eau sur Terre et le cycle de l\'eau';

  @override
  String get lesson2Title => 'Propriétés Chimiques de l\'Eau';

  @override
  String get lesson2Description =>
      'Structure moléculaire, polarité et liaisons hydrogène';

  @override
  String get lesson3Title => 'Importance Biologique de l\'Eau';

  @override
  String get lesson3Description =>
      'Rôle de l\'eau dans la vie et les écosystèmes aquatiques';

  @override
  String get quizTitle => 'Évaluation de l\'Écosystème Aquatique';

  @override
  String get quizDescription =>
      'Testez vos connaissances sur l\'écosystème aquatique';

  @override
  String get lesson1Step1Title => 'L\'Eau sur Notre Planète';

  @override
  String get lesson1Step1Content =>
      'La Terre est appelée la \'Planète Bleue\' car environ 71% de sa surface est couverte d\'eau.\n\nL\'eau est distribuée :\n• Eau salée : 97,5%\n• Eau douce : 2,5%\n\nDes 2,5% d\'eau douce :\n• Glaciers : 68,7%\n• Eau souterraine : 30,1%\n• Eau de surface : 1,2%';

  @override
  String get lesson1Step2Title => 'Types de Plans d\'Eau';

  @override
  String get lesson1Step2Content =>
      '🌊 Océans et Mers — eau salée\n🏞️ Rivières — eau douce\n🏔️ Glaciers — glace comprimée\n💧 Eau Souterraine — aquifères\n☁️ Eau Atmosphérique — vapeur';

  @override
  String get lesson1Step3Title => 'Le Cycle de l\'Eau';

  @override
  String get lesson1Step3Content =>
      '1️⃣ Évaporation\n2️⃣ Transpiration\n3️⃣ Condensation\n4️⃣ Précipitation\n5️⃣ Collecte';

  @override
  String get lesson1CheckQ => 'Quel % de l\'eau terrestre est douce ?';

  @override
  String get lesson1CheckA1 => '97,5%';

  @override
  String get lesson1CheckA2 => '2,5%';

  @override
  String get lesson1CheckA3 => '50%';

  @override
  String get lesson1CheckA4 => '25%';

  @override
  String get lesson1CheckCorrect => '1';

  @override
  String get lesson1CheckExplanation => 'Seulement 2,5% de l\'eau est douce.';

  @override
  String get lesson2Step1Title => 'La Molécule d\'Eau';

  @override
  String get lesson2Step1Content =>
      'L\'eau (H₂O) : 2 H + 1 O. L\'oxygène est plus électronégatif, créant une molécule polaire.';

  @override
  String get lesson2Step2Title => 'Les Liaisons Hydrogène';

  @override
  String get lesson2Step2Content =>
      'Propriétés uniques : point d\'ébullition élevé, la glace flotte, tension superficielle, capacité thermique élevée.';

  @override
  String get lesson2Step3Title => 'L\'Eau comme Solvant';

  @override
  String get lesson2Step3Content =>
      'Solvant universel. pH 7 = neutre, < 7 = acide, > 7 = basique.';

  @override
  String get lesson2CheckQ => 'Pourquoi l\'eau est-elle polaire ?';

  @override
  String get lesson2CheckA1 => 'Elle existe aux pôles';

  @override
  String get lesson2CheckA2 => 'Charge inégalement distribuée';

  @override
  String get lesson2CheckA3 => 'Elle dissout tout';

  @override
  String get lesson2CheckA4 => 'Point d\'ébullition élevé';

  @override
  String get lesson2CheckCorrect => '1';

  @override
  String get lesson2CheckExplanation =>
      'L\'oxygène attire les électrons plus fortement.';

  @override
  String get lesson3Step1Title => 'L\'Eau et la Vie';

  @override
  String get lesson3Step1Content =>
      'Le corps humain : 60-70% d\'eau. Rôles : transport, réactions chimiques, régulation thermique.';

  @override
  String get lesson3Step2Title => 'Adaptations Aquatiques';

  @override
  String get lesson3Step2Content =>
      '🐟 Poissons : branchies\n🐋 Mammifères marins : graisse isolante\n🌿 Plantes : espaces aériens\n🦠 Phytoplancton : 50-70% de l\'O₂';

  @override
  String get lesson3Step3Title => 'Équilibre Écologique';

  @override
  String get lesson3Step3Content =>
      'Producteurs → Consommateurs → Décomposeurs. Menaces : pollution, plastique, réchauffement.';

  @override
  String get lesson3CheckQ => '% d\'O₂ produit par le phytoplancton ?';

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
      'Le phytoplancton produit 50-70% de l\'oxygène.';

  @override
  String get quiz1Q => '% de la surface terrestre couverte d\'eau ?';

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
  String get quiz1Explanation => '71% de la surface est couverte d\'eau.';

  @override
  String get quiz2Q => 'Forces du cycle de l\'eau ?';

  @override
  String get quiz2A1 => 'Vent et pluie';

  @override
  String get quiz2A2 => 'Lune et marées';

  @override
  String get quiz2A3 => 'Soleil et gravité';

  @override
  String get quiz2A4 => 'Pression et humidité';

  @override
  String get quiz2Correct => '2';

  @override
  String get quiz2Explanation => 'Énergie solaire et gravité.';

  @override
  String get quiz3Q => 'Type de liaison entre molécules d\'eau ?';

  @override
  String get quiz3A1 => 'Ionique';

  @override
  String get quiz3A2 => 'Covalente';

  @override
  String get quiz3A3 => 'Hydrogène';

  @override
  String get quiz3A4 => 'Métallique';

  @override
  String get quiz3Correct => '2';

  @override
  String get quiz3Explanation => 'Liaisons hydrogène.';

  @override
  String get quiz4Q => 'Pourquoi la glace flotte ?';

  @override
  String get quiz4A1 => 'Plus chaude';

  @override
  String get quiz4A2 => 'Poussée de l\'eau';

  @override
  String get quiz4A3 => 'Moins dense';

  @override
  String get quiz4A4 => 'Bulles d\'air';

  @override
  String get quiz4Correct => '2';

  @override
  String get quiz4Explanation => 'Moins dense grâce aux liaisons hydrogène.';

  @override
  String get quiz5Q => 'Pourquoi \'Solvant Universel\' ?';

  @override
  String get quiz5A1 => 'Partout sur Terre';

  @override
  String get quiz5A2 => 'Dissout le plus de substances';

  @override
  String get quiz5A3 => 'Utilisée partout';

  @override
  String get quiz5A4 => 'Trois états';

  @override
  String get quiz5Correct => '1';

  @override
  String get quiz5Explanation => 'Sa polarité lui permet de dissoudre plus.';

  @override
  String get quiz6Q => 'Salinité moyenne de l\'eau de mer ?';

  @override
  String get quiz6A1 => '3,5 g/L';

  @override
  String get quiz6A2 => '35 g/L';

  @override
  String get quiz6A3 => '350 g/L';

  @override
  String get quiz6A4 => '0,35 g/L';

  @override
  String get quiz6Correct => '1';

  @override
  String get quiz6Explanation => '35 g/L soit 3,5%.';

  @override
  String get quiz7Q => '% d\'eau dans le corps humain ?';

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
  String get quiz7Explanation => '60-70% du corps humain.';

  @override
  String get quiz8Q => 'Comment les poissons respirent ?';

  @override
  String get quiz8A1 => 'Par la peau';

  @override
  String get quiz8A2 => 'Par les branchies';

  @override
  String get quiz8A3 => 'Par les nageoires';

  @override
  String get quiz8A4 => 'En surface';

  @override
  String get quiz8Correct => '1';

  @override
  String get quiz8Explanation => 'Les branchies extraient l\'O₂ dissous.';

  @override
  String get quiz9Q => 'pH 7 signifie ?';

  @override
  String get quiz9A1 => 'Acide';

  @override
  String get quiz9A2 => 'Neutre';

  @override
  String get quiz9A3 => 'Basique';

  @override
  String get quiz9A4 => 'Toxique';

  @override
  String get quiz9Correct => '1';

  @override
  String get quiz9Explanation => 'pH 7 = neutre.';

  @override
  String get quiz10Q => 'Plastique dans les océans par an ?';

  @override
  String get quiz10A1 => '1 million tonnes';

  @override
  String get quiz10A2 => '8 millions tonnes';

  @override
  String get quiz10A3 => '100 millions tonnes';

  @override
  String get quiz10A4 => '500 mille tonnes';

  @override
  String get quiz10Correct => '1';

  @override
  String get quiz10Explanation => '8 millions de tonnes par an.';

  @override
  String get watchVideo => 'Voir l\'explication vidéo';

  @override
  String get videoUnavailable => 'Vidéo indisponible';

  @override
  String get videoRequiresInternet =>
      'La vidéo nécessite une connexion Internet.';

  @override
  String get theme => 'Thème';

  @override
  String get darkMode => 'Mode Sombre';

  @override
  String get lightMode => 'Mode Clair';

  @override
  String get timeTaken => 'Temps écoulé :';

  @override
  String get speedBonus => 'Bonus de Vitesse';

  @override
  String get autoSubmitted =>
      'Temps écoulé ! Votre quiz a été soumis automatiquement.';

  @override
  String get retry => 'Réessayer';

  @override
  String get videoPlaybackError =>
      'Cette vidéo ne peut pas être lue dans l\'application. Veuillez réessayer plus tard.';

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
  String get tryAgain => 'Réessayer !';

  @override
  String get sortGameInstructions =>
      'Faites glisser les éléments vers la bonne source d\'eau !';

  @override
  String get welcomeTitle => 'Votre parcours d\'apprentissage commence ici';

  @override
  String get welcomeCreateAccount => 'Créer un compte';

  @override
  String get loginTitle => 'Bon retour';

  @override
  String get loginEmail => 'Adresse e-mail';

  @override
  String get loginPassword => 'Mot de passe';

  @override
  String get loginButton => 'Se connecter';

  @override
  String get signupTitle => 'Créer un compte';

  @override
  String get signupConfirmPassword => 'Confirmer le mot de passe';

  @override
  String get signupNext => 'Suivant';

  @override
  String get avatarTitle => 'Choisir un avatar';

  @override
  String get avatarFinish => 'Terminer l\'installation';
}
