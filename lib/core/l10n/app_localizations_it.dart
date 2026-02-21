// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Scuola Intelligente';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Impostazioni';

  @override
  String get lessons => 'Lezioni';

  @override
  String get quiz => 'Quiz';

  @override
  String get progress => 'Progressi';

  @override
  String get welcomeBack => 'Bentornato!';

  @override
  String get continueWith => 'Continua con';

  @override
  String get startLearning => 'Inizia a Imparare';

  @override
  String get continueLearning => 'Continua a Imparare';

  @override
  String get overallProgress => 'Progressi Generali';

  @override
  String get lessonsCompleted => 'Lezioni Completate';

  @override
  String get bestScore => 'Miglior Punteggio';

  @override
  String get quizScore => 'Punteggio Quiz';

  @override
  String get noProgressYet => 'Nessun progresso. Inizia la tua prima lezione!';

  @override
  String lessonOf(int current, int total) {
    return 'Lezione $current di $total';
  }

  @override
  String stepOf(int current, int total) {
    return 'Passo $current di $total';
  }

  @override
  String get next => 'Avanti';

  @override
  String get previous => 'Indietro';

  @override
  String get complete => 'Completa';

  @override
  String get markAsComplete => 'Segna come completato';

  @override
  String get lessonCompleted => 'Lezione Completata!';

  @override
  String get lessonCompletedMsg =>
      'Ottimo lavoro! Hai completato questa lezione.';

  @override
  String get continueToNext => 'Continua alla prossima';

  @override
  String get backToSubject => 'Torna alla materia';

  @override
  String get startQuiz => 'Inizia il Quiz';

  @override
  String get submitQuiz => 'Invia il Quiz';

  @override
  String get retryQuiz => 'Riprova il Quiz';

  @override
  String get quizResults => 'Risultati del Quiz';

  @override
  String get yourScore => 'Il Tuo Punteggio';

  @override
  String scorePercent(int score) {
    return '$score%';
  }

  @override
  String questionsCorrect(int correct, int total) {
    return '$correct di $total corrette';
  }

  @override
  String get passed => 'Superato!';

  @override
  String get failed => 'Continua a provare!';

  @override
  String get passedMsg => 'Complimenti! Hai superato il quiz!';

  @override
  String get failedMsg =>
      'Serve il 70% per superare. Rivedi le lezioni e riprova.';

  @override
  String get correctAnswer => 'Risposta Corretta';

  @override
  String get yourAnswer => 'La Tua Risposta';

  @override
  String get explanation => 'Spiegazione';

  @override
  String question(int number) {
    return 'Domanda $number';
  }

  @override
  String get selectAnswer => 'Seleziona una risposta';

  @override
  String get language => 'Lingua';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get italian => 'Italiano';

  @override
  String get studentName => 'Nome Studente';

  @override
  String get enterYourName => 'Inserisci il tuo nome';

  @override
  String get save => 'Salva';

  @override
  String get badges => 'Badge';

  @override
  String get locked => 'Bloccato';

  @override
  String get unlocked => 'Sbloccato';

  @override
  String get badgeFirstLesson => 'Primi Passi';

  @override
  String get badgeFirstLessonDesc => 'Completa la tua prima lezione';

  @override
  String get badgeQuizMaster => 'Maestro del Quiz';

  @override
  String get badgeQuizMasterDesc => 'Ottieni 100% in un quiz';

  @override
  String get badgeAllLessons => 'Studioso';

  @override
  String get badgeAllLessonsDesc => 'Completa tutte le lezioni';

  @override
  String get badgeQuizPassed => 'Voto Sufficiente';

  @override
  String get badgeQuizPassedDesc => 'Supera un quiz con 70% o più';

  @override
  String minutesShort(int min) {
    return '$min min';
  }

  @override
  String get subjectIntegratedScience => 'Scienze Integrate';

  @override
  String get subjectDescription => 'Ecosistema Acquatico — 1° Anno Secondaria';

  @override
  String get lesson1Title => 'L\'Idrosfera';

  @override
  String get lesson1Description =>
      'Distribuzione dell\'acqua sulla Terra e il ciclo dell\'acqua';

  @override
  String get lesson2Title => 'Proprietà Chimiche dell\'Acqua';

  @override
  String get lesson2Description =>
      'Struttura molecolare, polarità e legami idrogeno';

  @override
  String get lesson3Title => 'Importanza Biologica dell\'Acqua';

  @override
  String get lesson3Description =>
      'Ruolo dell\'acqua nella vita e negli ecosistemi acquatici';

  @override
  String get quizTitle => 'Valutazione Ecosistema Acquatico';

  @override
  String get quizDescription => 'Metti alla prova le tue conoscenze';

  @override
  String get lesson1Step1Title => 'L\'Acqua sul Nostro Pianeta';

  @override
  String get lesson1Step1Content =>
      'La Terra è chiamata \'Pianeta Blu\' perché il 71% è coperto d\'acqua.\n\n• Acqua salata: 97,5%\n• Acqua dolce: 2,5%\n\nDell\'acqua dolce:\n• Ghiacciai: 68,7%\n• Acque sotterranee: 30,1%\n• Acque superficiali: 1,2%';

  @override
  String get lesson1Step2Title => 'Tipi di Corpi Idrici';

  @override
  String get lesson1Step2Content =>
      '🌊 Oceani e Mari — acqua salata\n🏞️ Fiumi — acqua dolce\n🏔️ Ghiacciai — neve compressa\n💧 Acque Sotterranee — acquiferi\n☁️ Acqua Atmosferica — vapore';

  @override
  String get lesson1Step3Title => 'Il Ciclo dell\'Acqua';

  @override
  String get lesson1Step3Content =>
      '1️⃣ Evaporazione\n2️⃣ Traspirazione\n3️⃣ Condensazione\n4️⃣ Precipitazione\n5️⃣ Raccolta';

  @override
  String get lesson1CheckQ => '% di acqua dolce sulla Terra?';

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
  String get lesson1CheckExplanation => 'Solo il 2,5% è acqua dolce.';

  @override
  String get lesson2Step1Title => 'La Molecola d\'Acqua';

  @override
  String get lesson2Step1Content =>
      'H₂O: 2 H + 1 O. L\'ossigeno è più elettronegativo, creando una molecola polare.';

  @override
  String get lesson2Step2Title => 'I Legami Idrogeno';

  @override
  String get lesson2Step2Content =>
      'Proprietà: alto punto di ebollizione, il ghiaccio galleggia, tensione superficiale, alta capacità termica.';

  @override
  String get lesson2Step3Title => 'L\'Acqua come Solvente';

  @override
  String get lesson2Step3Content =>
      'Solvente universale. pH 7 = neutro, < 7 = acido, > 7 = basico.';

  @override
  String get lesson2CheckQ => 'Perché l\'acqua è polare?';

  @override
  String get lesson2CheckA1 => 'Esiste ai poli';

  @override
  String get lesson2CheckA2 => 'Carica distribuita in modo non uniforme';

  @override
  String get lesson2CheckA3 => 'Scioglie tutto';

  @override
  String get lesson2CheckA4 => 'Alto punto di ebollizione';

  @override
  String get lesson2CheckCorrect => '1';

  @override
  String get lesson2CheckExplanation =>
      'L\'ossigeno attrae gli elettroni più fortemente.';

  @override
  String get lesson3Step1Title => 'L\'Acqua e la Vita';

  @override
  String get lesson3Step1Content =>
      'Il corpo umano: 60-70% acqua. Ruoli: trasporto, reazioni chimiche, regolazione termica.';

  @override
  String get lesson3Step2Title => 'Adattamenti Acquatici';

  @override
  String get lesson3Step2Content =>
      '🐟 Pesci: branchie\n🐋 Mammiferi marini: grasso isolante\n🌿 Piante: spazi aerei\n🦠 Fitoplancton: 50-70% dell\'O₂';

  @override
  String get lesson3Step3Title => 'Equilibrio Ecologico';

  @override
  String get lesson3Step3Content =>
      'Produttori → Consumatori → Decompositori. Minacce: inquinamento, plastica, riscaldamento.';

  @override
  String get lesson3CheckQ => '% di O₂ dal fitoplancton?';

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
      'Il fitoplancton produce il 50-70% dell\'ossigeno.';

  @override
  String get quiz1Q => '% della superficie terrestre coperta d\'acqua?';

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
  String get quiz1Explanation => 'Il 71% della superficie è coperta d\'acqua.';

  @override
  String get quiz2Q => 'Forze del ciclo dell\'acqua?';

  @override
  String get quiz2A1 => 'Vento e pioggia';

  @override
  String get quiz2A2 => 'Luna e maree';

  @override
  String get quiz2A3 => 'Sole e gravità';

  @override
  String get quiz2A4 => 'Pressione e umidità';

  @override
  String get quiz2Correct => '2';

  @override
  String get quiz2Explanation => 'Energia solare e gravità.';

  @override
  String get quiz3Q => 'Tipo di legame tra molecole d\'acqua?';

  @override
  String get quiz3A1 => 'Ionico';

  @override
  String get quiz3A2 => 'Covalente';

  @override
  String get quiz3A3 => 'Idrogeno';

  @override
  String get quiz3A4 => 'Metallico';

  @override
  String get quiz3Correct => '2';

  @override
  String get quiz3Explanation => 'Legami idrogeno.';

  @override
  String get quiz4Q => 'Perché il ghiaccio galleggia?';

  @override
  String get quiz4A1 => 'Più caldo';

  @override
  String get quiz4A2 => 'L\'acqua lo spinge';

  @override
  String get quiz4A3 => 'Meno denso dell\'acqua liquida';

  @override
  String get quiz4A4 => 'Contiene aria';

  @override
  String get quiz4Correct => '2';

  @override
  String get quiz4Explanation => 'Meno denso grazie ai legami idrogeno.';

  @override
  String get quiz5Q => 'Perché \'Solvente Universale\'?';

  @override
  String get quiz5A1 => 'Ovunque sulla Terra';

  @override
  String get quiz5A2 => 'Scioglie più sostanze';

  @override
  String get quiz5A3 => 'Usata ovunque';

  @override
  String get quiz5A4 => 'Tre stati';

  @override
  String get quiz5Correct => '1';

  @override
  String get quiz5Explanation =>
      'La polarità le permette di sciogliere più sostanze.';

  @override
  String get quiz6Q => 'Salinità media dell\'acqua di mare?';

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
  String get quiz6Explanation => '35 g/L ossia 3,5%.';

  @override
  String get quiz7Q => '% di acqua nel corpo umano?';

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
  String get quiz7Explanation => '60-70% del corpo umano.';

  @override
  String get quiz8Q => 'Come respirano i pesci?';

  @override
  String get quiz8A1 => 'Attraverso la pelle';

  @override
  String get quiz8A2 => 'Attraverso le branchie';

  @override
  String get quiz8A3 => 'Attraverso le pinne';

  @override
  String get quiz8A4 => 'In superficie';

  @override
  String get quiz8Correct => '1';

  @override
  String get quiz8Explanation => 'Le branchie estraggono l\'O₂ disciolto.';

  @override
  String get quiz9Q => 'pH 7 significa?';

  @override
  String get quiz9A1 => 'Acido';

  @override
  String get quiz9A2 => 'Neutro';

  @override
  String get quiz9A3 => 'Basico';

  @override
  String get quiz9A4 => 'Tossico';

  @override
  String get quiz9Correct => '1';

  @override
  String get quiz9Explanation => 'pH 7 = neutro.';

  @override
  String get quiz10Q => 'Plastica negli oceani all\'anno?';

  @override
  String get quiz10A1 => '1 milione tonnellate';

  @override
  String get quiz10A2 => '8 milioni tonnellate';

  @override
  String get quiz10A3 => '100 milioni tonnellate';

  @override
  String get quiz10A4 => '500 mila tonnellate';

  @override
  String get quiz10Correct => '1';

  @override
  String get quiz10Explanation => '8 milioni di tonnellate all\'anno.';

  @override
  String get watchVideo => 'Guarda la spiegazione video';

  @override
  String get videoUnavailable => 'Video non disponibile';

  @override
  String get videoRequiresInternet =>
      'Il video richiede una connessione Internet.';

  @override
  String get theme => 'Tema';

  @override
  String get darkMode => 'Modalità Scura';

  @override
  String get lightMode => 'Modalità Chiara';

  @override
  String get timeTaken => 'Tempo impiegato:';

  @override
  String get speedBonus => 'Bonus Velocità';

  @override
  String get autoSubmitted =>
      'Tempo scaduto! Il quiz è stato inviato automaticamente.';

  @override
  String get retry => 'Riprova';

  @override
  String get videoPlaybackError =>
      'Questo video non può essere riprodotto nell\'app. Riprova più tardi.';

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
  String get tryAgain => 'Riprova!';

  @override
  String get sortGameInstructions =>
      'Trascina gli oggetti nella fonte d\'acqua corretta!';

  @override
  String get welcomeTitle => 'Il tuo percorso di apprendimento inizia qui';

  @override
  String get welcomeCreateAccount => 'Crea un account';

  @override
  String get loginTitle => 'Bentornato';

  @override
  String get loginEmail => 'Indirizzo e-mail';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginButton => 'Accedi';

  @override
  String get signupTitle => 'Crea un account';

  @override
  String get signupConfirmPassword => 'Conferma password';

  @override
  String get signupNext => 'Avanti';

  @override
  String get avatarTitle => 'Scegli un avatar';

  @override
  String get avatarFinish => 'Termina la configurazione';
}
