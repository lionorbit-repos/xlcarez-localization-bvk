import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt'),
    Locale('uk')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @splashwelcome.
  ///
  /// In en, this message translates to:
  /// **'Reach Your Fitness Goals'**
  String get splashwelcome;

  /// No description provided for @getstarted.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get getstarted;

  /// No description provided for @your.
  ///
  /// In en, this message translates to:
  /// **'Your'**
  String get your;

  /// No description provided for @fitnesstracker.
  ///
  /// In en, this message translates to:
  /// **'Fitness Tracker'**
  String get fitnesstracker;

  /// No description provided for @regtagline1.
  ///
  /// In en, this message translates to:
  /// **'Health records, calories, food log'**
  String get regtagline1;

  /// No description provided for @regtagline2.
  ///
  /// In en, this message translates to:
  /// **'and doctor consultation'**
  String get regtagline2;

  /// No description provided for @createac.
  ///
  /// In en, this message translates to:
  /// **'Create an account with your'**
  String get createac;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailint;

  /// No description provided for @continu.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continu;

  /// No description provided for @tcstatement.
  ///
  /// In en, this message translates to:
  /// **'By continuing you accept our'**
  String get tcstatement;

  /// No description provided for @tandc.
  ///
  /// In en, this message translates to:
  /// **' Terms and conditions'**
  String get tandc;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @pp.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get pp;

  /// No description provided for @wtname.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get wtname;

  /// No description provided for @createpwd.
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get createpwd;

  /// No description provided for @pwd.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get pwd;

  /// No description provided for @enterpwd.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterpwd;

  /// No description provided for @cnfpwd.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get cnfpwd;

  /// No description provided for @entercnfpwd.
  ///
  /// In en, this message translates to:
  /// **'Enter Confirm Password'**
  String get entercnfpwd;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @pwdmissmatch.
  ///
  /// In en, this message translates to:
  /// **'Password Mismatch'**
  String get pwdmissmatch;

  /// No description provided for @welcomeback.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeback;

  /// No description provided for @loginurac.
  ///
  /// In en, this message translates to:
  /// **'login your account'**
  String get loginurac;

  /// No description provided for @emailerror.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emailerror;

  /// No description provided for @forgetpwd.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgetpwd;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'ok'**
  String get ok;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alert;

  /// No description provided for @mailcheckmsg.
  ///
  /// In en, this message translates to:
  /// **'If you don\'t see the email in your inbox, kindly check your spam or junk folder in the email app.'**
  String get mailcheckmsg;

  /// No description provided for @acquestion.
  ///
  /// In en, this message translates to:
  /// **'If you don’t have account'**
  String get acquestion;

  /// No description provided for @rghere.
  ///
  /// In en, this message translates to:
  /// **'Register Here'**
  String get rghere;

  /// No description provided for @vitals.
  ///
  /// In en, this message translates to:
  /// **'Vitals'**
  String get vitals;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @calariesburnt.
  ///
  /// In en, this message translates to:
  /// **'Calories Burnt'**
  String get calariesburnt;

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get kcal;

  /// No description provided for @bmi.
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get bmi;

  /// No description provided for @stepcount.
  ///
  /// In en, this message translates to:
  /// **'Step Count'**
  String get stepcount;

  /// No description provided for @sleepfatige.
  ///
  /// In en, this message translates to:
  /// **'Sleep and Fatigue Assessment'**
  String get sleepfatige;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @viewtrends.
  ///
  /// In en, this message translates to:
  /// **'View Trends'**
  String get viewtrends;

  /// No description provided for @dlvitalscans.
  ///
  /// In en, this message translates to:
  /// **'Daily Vitals Scans'**
  String get dlvitalscans;

  /// No description provided for @viewall.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewall;

  /// No description provided for @flog.
  ///
  /// In en, this message translates to:
  /// **'Food Log'**
  String get flog;

  /// No description provided for @clintake.
  ///
  /// In en, this message translates to:
  /// **'Calorie Intake'**
  String get clintake;

  /// No description provided for @fatigescore.
  ///
  /// In en, this message translates to:
  /// **'Fatigue Score'**
  String get fatigescore;

  /// No description provided for @scoreint.
  ///
  /// In en, this message translates to:
  /// **'According to your latest score of'**
  String get scoreint;

  /// No description provided for @youare.
  ///
  /// In en, this message translates to:
  /// **'you are'**
  String get youare;

  /// No description provided for @not.
  ///
  /// In en, this message translates to:
  /// **'not'**
  String get not;

  /// No description provided for @leveltext.
  ///
  /// In en, this message translates to:
  /// **'experiencing clinically significant fatigue level.'**
  String get leveltext;

  /// No description provided for @sleepscore.
  ///
  /// In en, this message translates to:
  /// **'Sleep Score'**
  String get sleepscore;

  /// No description provided for @riskscore.
  ///
  /// In en, this message translates to:
  /// **'Risk Score'**
  String get riskscore;

  /// No description provided for @diabetic.
  ///
  /// In en, this message translates to:
  /// **'Diabetic'**
  String get diabetic;

  /// No description provided for @obesity.
  ///
  /// In en, this message translates to:
  /// **'Obesity'**
  String get obesity;

  /// No description provided for @cardiac.
  ///
  /// In en, this message translates to:
  /// **'Cardiac'**
  String get cardiac;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get score;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @caption.
  ///
  /// In en, this message translates to:
  /// **'Your Expertise, Our Priority'**
  String get caption;

  /// No description provided for @caption2.
  ///
  /// In en, this message translates to:
  /// **'Keep Your Health UpToDate'**
  String get caption2;

  /// No description provided for @advise.
  ///
  /// In en, this message translates to:
  /// **'Update your profile'**
  String get advise;

  /// No description provided for @myreport.
  ///
  /// In en, this message translates to:
  /// **'My Reports'**
  String get myreport;

  /// No description provided for @deleteac.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteac;

  /// No description provided for @dltconfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to Delete Account?'**
  String get dltconfirmation;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @lng.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lng;

  /// No description provided for @logoutconfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to logout?'**
  String get logoutconfirmation;

  /// No description provided for @records.
  ///
  /// In en, this message translates to:
  /// **'Records'**
  String get records;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @medication.
  ///
  /// In en, this message translates to:
  /// **'Medication'**
  String get medication;

  /// No description provided for @advise3.
  ///
  /// In en, this message translates to:
  /// **'Please Contact Administrator'**
  String get advise3;

  /// No description provided for @noscan.
  ///
  /// In en, this message translates to:
  /// **'No Scans Left'**
  String get noscan;

  /// No description provided for @trends.
  ///
  /// In en, this message translates to:
  /// **'Trends'**
  String get trends;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading..'**
  String get loading;

  /// No description provided for @scan_type.
  ///
  /// In en, this message translates to:
  /// **'Scan Type'**
  String get scan_type;

  /// No description provided for @facescan.
  ///
  /// In en, this message translates to:
  /// **'Face Scan'**
  String get facescan;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @pulserate.
  ///
  /// In en, this message translates to:
  /// **'Pulse Rate'**
  String get pulserate;

  /// No description provided for @respirationrate.
  ///
  /// In en, this message translates to:
  /// **'Respiration Rate'**
  String get respirationrate;

  /// No description provided for @stressindex.
  ///
  /// In en, this message translates to:
  /// **'Stress Index'**
  String get stressindex;

  /// No description provided for @oxygensaturation.
  ///
  /// In en, this message translates to:
  /// **'Oxygen Saturation'**
  String get oxygensaturation;

  /// No description provided for @bloodpressure.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure'**
  String get bloodpressure;

  /// No description provided for @wellnessindex.
  ///
  /// In en, this message translates to:
  /// **'Wellness Index'**
  String get wellnessindex;

  /// No description provided for @hemoglobina1c.
  ///
  /// In en, this message translates to:
  /// **'Hemoglobin A1C'**
  String get hemoglobina1c;

  /// No description provided for @hemoglobin.
  ///
  /// In en, this message translates to:
  /// **'Hemoglobin'**
  String get hemoglobin;

  /// No description provided for @temperature.
  ///
  /// In en, this message translates to:
  /// **'Temprature'**
  String get temperature;

  /// No description provided for @sugar.
  ///
  /// In en, this message translates to:
  /// **'Sugar'**
  String get sugar;

  /// No description provided for @cholesterol.
  ///
  /// In en, this message translates to:
  /// **'Cholesterol'**
  String get cholesterol;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @mild.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get mild;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @appointments.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointments;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @waitlisted.
  ///
  /// In en, this message translates to:
  /// **'Waitlisted'**
  String get waitlisted;

  /// No description provided for @checkin.
  ///
  /// In en, this message translates to:
  /// **'Checkin'**
  String get checkin;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @mediname.
  ///
  /// In en, this message translates to:
  /// **'Medication Name'**
  String get mediname;

  /// No description provided for @medosage.
  ///
  /// In en, this message translates to:
  /// **'Medication Dosage'**
  String get medosage;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @appointmentdetail.
  ///
  /// In en, this message translates to:
  /// **'Appointment Details'**
  String get appointmentdetail;

  /// No description provided for @ctype.
  ///
  /// In en, this message translates to:
  /// **'Consultation Type'**
  String get ctype;

  /// No description provided for @date_time.
  ///
  /// In en, this message translates to:
  /// **'Date&Time'**
  String get date_time;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @telecon.
  ///
  /// In en, this message translates to:
  /// **'TeleConsulation'**
  String get telecon;

  /// No description provided for @hospitalconsution.
  ///
  /// In en, this message translates to:
  /// **'Hospital Consultation'**
  String get hospitalconsution;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @pay_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to collect an amount of'**
  String get pay_content;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @no_data.
  ///
  /// In en, this message translates to:
  /// **'No data Found'**
  String get no_data;

  /// No description provided for @update_profile_content.
  ///
  /// In en, this message translates to:
  /// **'Please update your profile to continue with the scan we require additional details.'**
  String get update_profile_content;

  /// No description provided for @fatiguelist.
  ///
  /// In en, this message translates to:
  /// **'Fatigue List'**
  String get fatiguelist;

  /// No description provided for @fatigueques1.
  ///
  /// In en, this message translates to:
  /// **'1. My motivation is lower when I am fatigued.'**
  String get fatigueques1;

  /// No description provided for @fatigueques2.
  ///
  /// In en, this message translates to:
  /// **'2. Exercise brings on my fatigue.'**
  String get fatigueques2;

  /// No description provided for @fatigueques3.
  ///
  /// In en, this message translates to:
  /// **'3. I am easily fatigued.'**
  String get fatigueques3;

  /// No description provided for @fatigueques4.
  ///
  /// In en, this message translates to:
  /// **'4. Fatigue interferes with my physical functioning.'**
  String get fatigueques4;

  /// No description provided for @fatigueques5.
  ///
  /// In en, this message translates to:
  /// **'5. Fatigue causes frequent problems for me.'**
  String get fatigueques5;

  /// No description provided for @fatigueques6.
  ///
  /// In en, this message translates to:
  /// **'6. My fatigue prevents sustained physical functioning.'**
  String get fatigueques6;

  /// No description provided for @fatigueques7.
  ///
  /// In en, this message translates to:
  /// **'7. Fatigue interferes with carrying out certain duties and responsibilities.'**
  String get fatigueques7;

  /// No description provided for @fatigueques8.
  ///
  /// In en, this message translates to:
  /// **'8. Fatigue is among my three most disabling symptoms.'**
  String get fatigueques8;

  /// No description provided for @fatigueques9.
  ///
  /// In en, this message translates to:
  /// **'9. Fatigue interferes with my work, family, or social life'**
  String get fatigueques9;

  /// No description provided for @fatsopt1.
  ///
  /// In en, this message translates to:
  /// **'Strongly disagree'**
  String get fatsopt1;

  /// No description provided for @fatsopt2.
  ///
  /// In en, this message translates to:
  /// **'Disagree'**
  String get fatsopt2;

  /// No description provided for @fatsopt3.
  ///
  /// In en, this message translates to:
  /// **'Slightly disagree'**
  String get fatsopt3;

  /// No description provided for @fatsopt4.
  ///
  /// In en, this message translates to:
  /// **'Neither agree nor disagree'**
  String get fatsopt4;

  /// No description provided for @fatsopt5.
  ///
  /// In en, this message translates to:
  /// **'Slightly agree'**
  String get fatsopt5;

  /// No description provided for @fatsopt6.
  ///
  /// In en, this message translates to:
  /// **'Agree'**
  String get fatsopt6;

  /// No description provided for @fatsopt7.
  ///
  /// In en, this message translates to:
  /// **'Strongly agree'**
  String get fatsopt7;

  /// No description provided for @sleeptitle.
  ///
  /// In en, this message translates to:
  /// **'Sleep Assessment'**
  String get sleeptitle;

  /// No description provided for @sleepheading.
  ///
  /// In en, this message translates to:
  /// **'What are the chances of you dozing/falling asleep in the following situations?'**
  String get sleepheading;

  /// No description provided for @sleep_q1.
  ///
  /// In en, this message translates to:
  /// **'Sitting and reading'**
  String get sleep_q1;

  /// No description provided for @sleep_q2.
  ///
  /// In en, this message translates to:
  /// **'Watching TV'**
  String get sleep_q2;

  /// No description provided for @sleep_q3.
  ///
  /// In en, this message translates to:
  /// **'Sitting inactive in a public place'**
  String get sleep_q3;

  /// No description provided for @sleep_q4.
  ///
  /// In en, this message translates to:
  /// **'Passenger in a car, driving for 1 hour'**
  String get sleep_q4;

  /// No description provided for @sleep_q5.
  ///
  /// In en, this message translates to:
  /// **'Lying down to rest'**
  String get sleep_q5;

  /// No description provided for @sleep_q7.
  ///
  /// In en, this message translates to:
  /// **'Sitting and talking to someone'**
  String get sleep_q7;

  /// No description provided for @sleep_q8.
  ///
  /// In en, this message translates to:
  /// **'Sitting quietly after a lunch without alcohol'**
  String get sleep_q8;

  /// No description provided for @sleep_q9.
  ///
  /// In en, this message translates to:
  /// **'In a car, when stopped in traffic'**
  String get sleep_q9;

  /// No description provided for @sleep_a1.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get sleep_a1;

  /// No description provided for @sleep_a2.
  ///
  /// In en, this message translates to:
  /// **'Slight'**
  String get sleep_a2;

  /// No description provided for @sleep_a3.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get sleep_a3;

  /// No description provided for @sleep_a4.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get sleep_a4;

  /// No description provided for @genral.
  ///
  /// In en, this message translates to:
  /// **'General Profile Data'**
  String get genral;

  /// No description provided for @wgt.
  ///
  /// In en, this message translates to:
  /// **'Weight(Kg)'**
  String get wgt;

  /// No description provided for @wgtin.
  ///
  /// In en, this message translates to:
  /// **'Weight in kg'**
  String get wgtin;

  /// No description provided for @wgtlb.
  ///
  /// In en, this message translates to:
  /// **'Weight(lb)'**
  String get wgtlb;

  /// No description provided for @wgtinlb.
  ///
  /// In en, this message translates to:
  /// **'Weight in lb'**
  String get wgtinlb;

  /// No description provided for @hgt.
  ///
  /// In en, this message translates to:
  /// **'Height(Cm)'**
  String get hgt;

  /// No description provided for @hgtin.
  ///
  /// In en, this message translates to:
  /// **'Height in cm'**
  String get hgtin;

  /// No description provided for @drsq.
  ///
  /// In en, this message translates to:
  /// **'Diabetes Risk Score Questionnaire'**
  String get drsq;

  /// No description provided for @wiyeb.
  ///
  /// In en, this message translates to:
  /// **'1. What is your ethnic background?'**
  String get wiyeb;

  /// No description provided for @doyouhafather.
  ///
  /// In en, this message translates to:
  /// **'2. Do you have a father, mother, brother, sister or own child with Type 1 or Type 2 diabetes?'**
  String get doyouhafather;

  /// No description provided for @mesuretheperson.
  ///
  /// In en, this message translates to:
  /// **'3. Measure the person’s waist circumference and choose the range: '**
  String get mesuretheperson;

  /// No description provided for @haveyoubeengivenmedicine.
  ///
  /// In en, this message translates to:
  /// **'4.Have you been given medicine for high blood pressure or told that you have high blood pressure by your doctor? '**
  String get haveyoubeengivenmedicine;

  /// No description provided for @weihtfielscanttempty.
  ///
  /// In en, this message translates to:
  /// **'Weight field can\'t be empty'**
  String get weihtfielscanttempty;

  /// No description provided for @heightfieldcantempty.
  ///
  /// In en, this message translates to:
  /// **'Height field can\'t be empty'**
  String get heightfieldcantempty;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @pleaseanswerallquestions.
  ///
  /// In en, this message translates to:
  /// **'please answer all questions'**
  String get pleaseanswerallquestions;

  /// No description provided for @helthyme.
  ///
  /// In en, this message translates to:
  /// **'Healthy Me'**
  String get helthyme;

  /// No description provided for @medicine.
  ///
  /// In en, this message translates to:
  /// **'Medicine'**
  String get medicine;

  /// No description provided for @dosage.
  ///
  /// In en, this message translates to:
  /// **'Dosage'**
  String get dosage;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @sentarequest.
  ///
  /// In en, this message translates to:
  /// **'sent a request'**
  String get sentarequest;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @reportsummry.
  ///
  /// In en, this message translates to:
  /// **'Report Summary'**
  String get reportsummry;

  /// No description provided for @forinvestuseonly.
  ///
  /// In en, this message translates to:
  /// **'For Investigational Use Only.'**
  String get forinvestuseonly;

  /// No description provided for @thesenumbersareonly.
  ///
  /// In en, this message translates to:
  /// **'These numbers are only estimates and are not a substitute for the judgment of a health care professional. They are intended to improve awareness of general wellness'**
  String get thesenumbersareonly;

  /// No description provided for @riskscoree.
  ///
  /// In en, this message translates to:
  /// **'Risk Score'**
  String get riskscoree;

  /// No description provided for @thisissoftwareai.
  ///
  /// In en, this message translates to:
  /// **'This is a software/AI-based assessment designed to support, but not replace, professional medical advice.'**
  String get thisissoftwareai;

  /// No description provided for @diabetesriskscoree.
  ///
  /// In en, this message translates to:
  /// **'Diabetes Risk Score '**
  String get diabetesriskscoree;

  /// No description provided for @cardiovascularrisk.
  ///
  /// In en, this message translates to:
  /// **'Cardio Vascular Risk'**
  String get cardiovascularrisk;

  /// No description provided for @stresslevel.
  ///
  /// In en, this message translates to:
  /// **'Stress Level'**
  String get stresslevel;

  /// No description provided for @obsitygradingbmi.
  ///
  /// In en, this message translates to:
  /// **'Obesity Grading - BMI'**
  String get obsitygradingbmi;

  /// No description provided for @depressionscore.
  ///
  /// In en, this message translates to:
  /// **'Depression Score'**
  String get depressionscore;

  /// No description provided for @animiagrading.
  ///
  /// In en, this message translates to:
  /// **'Anemia Grading'**
  String get animiagrading;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuee;

  /// No description provided for @scaninginstructions.
  ///
  /// In en, this message translates to:
  /// **'Scanning Instructions'**
  String get scaninginstructions;

  /// No description provided for @basedonliting.
  ///
  /// In en, this message translates to:
  /// **'Based on the lighting conditions and the environment of the scanning area, you will have to choose the best mode of scanning.'**
  String get basedonliting;

  /// No description provided for @facialscaning.
  ///
  /// In en, this message translates to:
  /// **'Facial Scanning (Front Camera)'**
  String get facialscaning;

  /// No description provided for @usethismode.
  ///
  /// In en, this message translates to:
  /// **'Use this mode if the room has good, consistent lighting. The front camera is used to take the scan, so you will have to hold the device steady and have it pointed at the participant in such a way that their face is inside the oval at all times during the scan. Facial symmetry analysis will be done if this method of scanning is used.'**
  String get usethismode;

  /// No description provided for @procede.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get procede;

  /// No description provided for @doyounow.
  ///
  /// In en, this message translates to:
  /// **'Do you Know?'**
  String get doyounow;

  /// No description provided for @personaldetails.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personaldetails;

  /// No description provided for @firstnamee.
  ///
  /// In en, this message translates to:
  /// **'FirstName'**
  String get firstnamee;

  /// No description provided for @enteryournamee.
  ///
  /// In en, this message translates to:
  /// **'Enter your firstname'**
  String get enteryournamee;

  /// No description provided for @lastnamee.
  ///
  /// In en, this message translates to:
  /// **'LastName'**
  String get lastnamee;

  /// No description provided for @enteryourlastname.
  ///
  /// In en, this message translates to:
  /// **'Enter your lastname'**
  String get enteryourlastname;

  /// No description provided for @phonee.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phonee;

  /// No description provided for @enteryourphonenumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your Phonenumber'**
  String get enteryourphonenumber;

  /// No description provided for @emaie.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emaie;

  /// No description provided for @enteryourmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enteryourmail;

  /// No description provided for @dobe.
  ///
  /// In en, this message translates to:
  /// **'Dob'**
  String get dobe;

  /// No description provided for @enteryourdob.
  ///
  /// In en, this message translates to:
  /// **'Enter your dob'**
  String get enteryourdob;

  /// No description provided for @agee.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get agee;

  /// No description provided for @gendere.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gendere;

  /// No description provided for @malee.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get malee;

  /// No description provided for @femalee.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get femalee;

  /// No description provided for @failedtoload.
  ///
  /// In en, this message translates to:
  /// **'Failed to load url something went wrong'**
  String get failedtoload;

  /// No description provided for @advitals.
  ///
  /// In en, this message translates to:
  /// **'Add Vitals'**
  String get advitals;

  /// No description provided for @temperateuree.
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get temperateuree;

  /// No description provided for @entertemprature.
  ///
  /// In en, this message translates to:
  /// **'Enter Temperature'**
  String get entertemprature;

  /// No description provided for @enterspo.
  ///
  /// In en, this message translates to:
  /// **'Enter Spo2'**
  String get enterspo;

  /// No description provided for @pulseratee.
  ///
  /// In en, this message translates to:
  /// **'Pulse rate'**
  String get pulseratee;

  /// No description provided for @enterpulserate.
  ///
  /// In en, this message translates to:
  /// **'Enter Pulse rate'**
  String get enterpulserate;

  /// No description provided for @cholesterole.
  ///
  /// In en, this message translates to:
  /// **'Cholesterol'**
  String get cholesterole;

  /// No description provided for @entercholesterol.
  ///
  /// In en, this message translates to:
  /// **'Enter Cholesterol'**
  String get entercholesterol;

  /// No description provided for @sugare.
  ///
  /// In en, this message translates to:
  /// **'Sugar'**
  String get sugare;

  /// No description provided for @entersugar.
  ///
  /// In en, this message translates to:
  /// **'Enter Sugar'**
  String get entersugar;

  /// No description provided for @resperationrate.
  ///
  /// In en, this message translates to:
  /// **'Respiration rate'**
  String get resperationrate;

  /// No description provided for @enterresperationrate.
  ///
  /// In en, this message translates to:
  /// **'Enter Respiration rate'**
  String get enterresperationrate;

  /// No description provided for @systolice.
  ///
  /// In en, this message translates to:
  /// **'Systolic'**
  String get systolice;

  /// No description provided for @entersystalic.
  ///
  /// In en, this message translates to:
  /// **'Enter Systolic'**
  String get entersystalic;

  /// No description provided for @diastolic.
  ///
  /// In en, this message translates to:
  /// **'Diastolic'**
  String get diastolic;

  /// No description provided for @enterdiastoli.
  ///
  /// In en, this message translates to:
  /// **'Enter Diastolic'**
  String get enterdiastoli;

  /// No description provided for @scanyourface.
  ///
  /// In en, this message translates to:
  /// **'Scan your face'**
  String get scanyourface;

  /// No description provided for @fatiguetitle.
  ///
  /// In en, this message translates to:
  /// **'Fatigue assessment'**
  String get fatiguetitle;

  /// No description provided for @fatigueinst.
  ///
  /// In en, this message translates to:
  /// **'Read each statement carefully and choose a response that best describes your condition within the last week.'**
  String get fatigueinst;

  /// No description provided for @fatiguewar.
  ///
  /// In en, this message translates to:
  /// **'Note that you should consult a healthcare professional if you are suffering from fatigue.'**
  String get fatiguewar;

  /// No description provided for @fatigueaddinfo.
  ///
  /// In en, this message translates to:
  /// **'Additional assessments may be necessary to determine the severity and impact of fatigue on daily life.'**
  String get fatigueaddinfo;

  /// No description provided for @fatiguetotalscore.
  ///
  /// In en, this message translates to:
  /// **'Total Score'**
  String get fatiguetotalscore;

  /// No description provided for @fatigueabr.
  ///
  /// In en, this message translates to:
  /// **'Pts'**
  String get fatigueabr;

  /// No description provided for @checkriskscore_keys1.
  ///
  /// In en, this message translates to:
  /// **'Lower Normal'**
  String get checkriskscore_keys1;

  /// No description provided for @checkriskscore_keys2.
  ///
  /// In en, this message translates to:
  /// **'Higher Normal'**
  String get checkriskscore_keys2;

  /// No description provided for @checkriskscore_keys3.
  ///
  /// In en, this message translates to:
  /// **'Mild Excessive'**
  String get checkriskscore_keys3;

  /// No description provided for @checkriskscore_keys4.
  ///
  /// In en, this message translates to:
  /// **'Moderate Excessive'**
  String get checkriskscore_keys4;

  /// No description provided for @checkriskscore_keys5.
  ///
  /// In en, this message translates to:
  /// **'Severe Excessive'**
  String get checkriskscore_keys5;

  /// No description provided for @cardiokeys1.
  ///
  /// In en, this message translates to:
  /// **'Low Risk'**
  String get cardiokeys1;

  /// No description provided for @cardiokeys2.
  ///
  /// In en, this message translates to:
  /// **'Moderate Risk'**
  String get cardiokeys2;

  /// No description provided for @cardiokeys3.
  ///
  /// In en, this message translates to:
  /// **'High Risk'**
  String get cardiokeys3;

  /// No description provided for @cardiokeys4.
  ///
  /// In en, this message translates to:
  /// **'Very High Risk'**
  String get cardiokeys4;

  /// No description provided for @cardiokeys5.
  ///
  /// In en, this message translates to:
  /// **'Established Cardiovascular Disease'**
  String get cardiokeys5;

  /// No description provided for @increasedrisk.
  ///
  /// In en, this message translates to:
  /// **'Increased Risk'**
  String get increasedrisk;

  /// No description provided for @depression_keys1.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get depression_keys1;

  /// No description provided for @depression_keys2.
  ///
  /// In en, this message translates to:
  /// **'Mild Depression'**
  String get depression_keys2;

  /// No description provided for @depression_keys3.
  ///
  /// In en, this message translates to:
  /// **'Moderate Depression'**
  String get depression_keys3;

  /// No description provided for @depression_keys4.
  ///
  /// In en, this message translates to:
  /// **'Moderately Severe Depression'**
  String get depression_keys4;

  /// No description provided for @depression_keys5.
  ///
  /// In en, this message translates to:
  /// **'Severe Depression'**
  String get depression_keys5;

  /// No description provided for @n_weight.
  ///
  /// In en, this message translates to:
  /// **'Normal weight'**
  String get n_weight;

  /// No description provided for @u_weight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get u_weight;

  /// No description provided for @o_weight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get o_weight;

  /// No description provided for @daiques.
  ///
  /// In en, this message translates to:
  /// **'Only white European'**
  String get daiques;

  /// No description provided for @diaques1.
  ///
  /// In en, this message translates to:
  /// **'Other ethnic group'**
  String get diaques1;

  /// No description provided for @daiques5opt1.
  ///
  /// In en, this message translates to:
  /// **'<90cm (35.3in)'**
  String get daiques5opt1;

  /// No description provided for @diagnosis.
  ///
  /// In en, this message translates to:
  /// **'DIAGNOSIS:'**
  String get diagnosis;

  /// No description provided for @mdedicaldept.
  ///
  /// In en, this message translates to:
  /// **'Medical_Department:'**
  String get mdedicaldept;

  /// No description provided for @selfscare.
  ///
  /// In en, this message translates to:
  /// **'SELF_CARE:'**
  String get selfscare;

  /// No description provided for @resete.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resete;

  /// No description provided for @familye.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get familye;

  /// No description provided for @dashboarde.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboarde;

  /// No description provided for @appointmentdetails.
  ///
  /// In en, this message translates to:
  /// **'Appointment Details'**
  String get appointmentdetails;

  /// No description provided for @consultationtype.
  ///
  /// In en, this message translates to:
  /// **'Consultation Type'**
  String get consultationtype;

  /// No description provided for @teleconsultatione.
  ///
  /// In en, this message translates to:
  /// **'TeleConsulation'**
  String get teleconsultatione;

  /// No description provided for @hospitalconsultation.
  ///
  /// In en, this message translates to:
  /// **'Hospital Consultation'**
  String get hospitalconsultation;

  /// No description provided for @detailse.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailse;

  /// No description provided for @paymenttype.
  ///
  /// In en, this message translates to:
  /// **'Payment Type'**
  String get paymenttype;

  /// No description provided for @bookappointment.
  ///
  /// In en, this message translates to:
  /// **'Book Appointment'**
  String get bookappointment;

  /// No description provided for @healthcareconsentform.
  ///
  /// In en, this message translates to:
  /// **'Health Care Consent Form'**
  String get healthcareconsentform;

  /// No description provided for @gdprcomliant.
  ///
  /// In en, this message translates to:
  /// **'GDPR Compliant Health Care Consent Form'**
  String get gdprcomliant;

  /// No description provided for @xlcarezapllicationgdpr.
  ///
  /// In en, this message translates to:
  /// **'XLcarez Application GDPR complaint Consent to Process Personal Health Data.'**
  String get xlcarezapllicationgdpr;

  /// No description provided for @introductione.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get introductione;

  /// No description provided for @thankyouforchoosing.
  ///
  /// In en, this message translates to:
  /// **'Thank you for choosing XLcarez We are committed to protecting your personal data and ensuring your privacy. This consent form outlines how we will collect, use, and process your health information in compliance with the General Data Protection Regulation (GDPR).'**
  String get thankyouforchoosing;

  /// No description provided for @purposeofdata.
  ///
  /// In en, this message translates to:
  /// **'1. Purpose of Data Processing'**
  String get purposeofdata;

  /// No description provided for @bysinging.
  ///
  /// In en, this message translates to:
  /// **'By signing this consent form, you consent to the collection and processing of your personal health data for the following purposes:'**
  String get bysinging;

  /// No description provided for @healthcaremonitoring.
  ///
  /// In en, this message translates to:
  /// **'Health monitoring and assessment'**
  String get healthcaremonitoring;

  /// No description provided for @providingpersonalized.
  ///
  /// In en, this message translates to:
  /// **'Providing personalized health recommendations'**
  String get providingpersonalized;

  /// No description provided for @researchanddevelopment.
  ///
  /// In en, this message translates to:
  /// **'Research and development to improve our services'**
  String get researchanddevelopment;

  /// No description provided for @complaincewith.
  ///
  /// In en, this message translates to:
  /// **'Compliance with legal and regulatory obligations'**
  String get complaincewith;

  /// No description provided for @typesofdata.
  ///
  /// In en, this message translates to:
  /// **'2. Types of Data Collected'**
  String get typesofdata;

  /// No description provided for @wayofcollect.
  ///
  /// In en, this message translates to:
  /// **'We may collect the following types of personal health data:'**
  String get wayofcollect;

  /// No description provided for @vitalsignse.
  ///
  /// In en, this message translates to:
  /// **'Vital signs (e.g., blood pressure, heart rate, respiration rate)'**
  String get vitalsignse;

  /// No description provided for @healthhistory.
  ///
  /// In en, this message translates to:
  /// **'Health history and conditions'**
  String get healthhistory;

  /// No description provided for @demographice.
  ///
  /// In en, this message translates to:
  /// **'Demographic information (e.g., age, gender)'**
  String get demographice;

  /// No description provided for @leagalbasis.
  ///
  /// In en, this message translates to:
  /// **'3. Legal Basis for Processing'**
  String get leagalbasis;

  /// No description provided for @weprocessyour.
  ///
  /// In en, this message translates to:
  /// **'We process your personal data based on your explicit consent, as well as for the performance of a contract and compliance with legal obligations.'**
  String get weprocessyour;

  /// No description provided for @datatention.
  ///
  /// In en, this message translates to:
  /// **'4. Data Retention'**
  String get datatention;

  /// No description provided for @yourpersonaldata.
  ///
  /// In en, this message translates to:
  /// **'Your personal data will be retained only as long as necessary for the purposes outlined above or as required by law.'**
  String get yourpersonaldata;

  /// No description provided for @datasharing.
  ///
  /// In en, this message translates to:
  /// **'5. Data Sharing'**
  String get datasharing;

  /// No description provided for @yourdatamaybe.
  ///
  /// In en, this message translates to:
  /// **'Your data may be shared with:'**
  String get yourdatamaybe;

  /// No description provided for @healthcareprofession.
  ///
  /// In en, this message translates to:
  /// **'Healthcare professionals for clinical assessments'**
  String get healthcareprofession;

  /// No description provided for @researchinstitution.
  ///
  /// In en, this message translates to:
  /// **'Research institutions for anonymized data analysis'**
  String get researchinstitution;

  /// No description provided for @thirdpartysevice.
  ///
  /// In en, this message translates to:
  /// **'Third-party service providers assisting with app functionalities'**
  String get thirdpartysevice;

  /// No description provided for @yourrights.
  ///
  /// In en, this message translates to:
  /// **'6. Your Rights'**
  String get yourrights;

  /// No description provided for @youhavethefollowing.
  ///
  /// In en, this message translates to:
  /// **'You have the following rights regarding your personal data:'**
  String get youhavethefollowing;

  /// No description provided for @therighttoacees.
  ///
  /// In en, this message translates to:
  /// **'The right to access your data'**
  String get therighttoacees;

  /// No description provided for @therighttorextify.
  ///
  /// In en, this message translates to:
  /// **'The right to rectify inaccurate data'**
  String get therighttorextify;

  /// No description provided for @therighttoearase.
  ///
  /// In en, this message translates to:
  /// **'The right to erase your data'**
  String get therighttoearase;

  /// No description provided for @therighttorestrict.
  ///
  /// In en, this message translates to:
  /// **'The right to restrict processing'**
  String get therighttorestrict;

  /// No description provided for @therighttodata.
  ///
  /// In en, this message translates to:
  /// **'The right to data portability'**
  String get therighttodata;

  /// No description provided for @therighttowithdraw.
  ///
  /// In en, this message translates to:
  /// **'The right to withdraw consent at any time'**
  String get therighttowithdraw;

  /// No description provided for @contactinformation.
  ///
  /// In en, this message translates to:
  /// **'7. Contact Information'**
  String get contactinformation;

  /// No description provided for @ifyouhaveany.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions or wish to exercise your rights, please contact us at:'**
  String get ifyouhaveany;

  /// No description provided for @consente.
  ///
  /// In en, this message translates to:
  /// **'Consent'**
  String get consente;

  /// No description provided for @bywritingthename.
  ///
  /// In en, this message translates to:
  /// **'By writing the name consider this as signing this form, i confirm that i have read and understood the information provided, and you consent to the processing of your personal health data as outlined above.'**
  String get bywritingthename;

  /// No description provided for @namee.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get namee;

  /// No description provided for @thankyouforyourtrust.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your trust in XLcarez Your health and privacy are our top priorities!'**
  String get thankyouforyourtrust;

  /// No description provided for @finalresults.
  ///
  /// In en, this message translates to:
  /// **'Final Results'**
  String get finalresults;

  /// No description provided for @ellnesslevel.
  ///
  /// In en, this message translates to:
  /// **'Wellness Level'**
  String get ellnesslevel;

  /// No description provided for @backtohome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backtohome;

  /// No description provided for @failedtogenerate.
  ///
  /// In en, this message translates to:
  /// **'Failed to genrare image'**
  String get failedtogenerate;

  /// No description provided for @desclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get desclaimer;

  /// No description provided for @thexlcarezappis.
  ///
  /// In en, this message translates to:
  /// **'The XLcarez app is based on the Binah.ai framework, utilizing Mean Absolute Error (MAE) and Root Mean Square Error (RMSE) as key error factors in the interpretation of test results. All outcomes generated by the app are based on AI algorithms and should not be considered definitive. Clinical diagnosis and consultation with a healthcare professional are essential for accurate health assessments. XLcarez cannot be held responsible, directly or indirectly, for any adverse effects resulting from the test results provided by this app'**
  String get thexlcarezappis;

  /// No description provided for @iuderstand.
  ///
  /// In en, this message translates to:
  /// **'I Understand'**
  String get iuderstand;

  /// No description provided for @hospitalvisit.
  ///
  /// In en, this message translates to:
  /// **'Hospital Visit'**
  String get hospitalvisit;

  /// No description provided for @noslotsavailable.
  ///
  /// In en, this message translates to:
  /// **'No slots available !!'**
  String get noslotsavailable;

  /// No description provided for @confirmee.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmee;

  /// No description provided for @pleaseselectspeciality.
  ///
  /// In en, this message translates to:
  /// **'Please select Speciality to continue !!'**
  String get pleaseselectspeciality;

  /// No description provided for @pleaseselectslot.
  ///
  /// In en, this message translates to:
  /// **'Please select slot for booking'**
  String get pleaseselectslot;

  /// No description provided for @typee.
  ///
  /// In en, this message translates to:
  /// **'Type :'**
  String get typee;

  /// No description provided for @doctorse.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctorse;

  /// No description provided for @mycareteam.
  ///
  /// In en, this message translates to:
  /// **'My Care Team'**
  String get mycareteam;

  /// No description provided for @foodlog.
  ///
  /// In en, this message translates to:
  /// **'Food Log'**
  String get foodlog;

  /// No description provided for @clorieintake.
  ///
  /// In en, this message translates to:
  /// **'Calorie Intake'**
  String get clorieintake;

  /// No description provided for @addmorefoods.
  ///
  /// In en, this message translates to:
  /// **'Add More Foods'**
  String get addmorefoods;

  /// No description provided for @serachfood.
  ///
  /// In en, this message translates to:
  /// **'Search for Food'**
  String get serachfood;

  /// No description provided for @youcantsenddata.
  ///
  /// In en, this message translates to:
  /// **'You cant send empty data'**
  String get youcantsenddata;

  /// No description provided for @brandname.
  ///
  /// In en, this message translates to:
  /// **'Brand Name'**
  String get brandname;

  /// No description provided for @nutritioninforamtion.
  ///
  /// In en, this message translates to:
  /// **'Nutritional Information'**
  String get nutritioninforamtion;

  /// No description provided for @pleasechecktheimage.
  ///
  /// In en, this message translates to:
  /// **'Please check the image!!'**
  String get pleasechecktheimage;

  /// No description provided for @iatethis.
  ///
  /// In en, this message translates to:
  /// **'I ate this'**
  String get iatethis;

  /// No description provided for @searche.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searche;

  /// No description provided for @energee.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get energee;

  /// No description provided for @email_error.
  ///
  /// In en, this message translates to:
  /// **'Email is not formatted.'**
  String get email_error;

  /// No description provided for @pass_error.
  ///
  /// In en, this message translates to:
  /// **'Password should be more than 6 digits.'**
  String get pass_error;

  /// No description provided for @healthassesment.
  ///
  /// In en, this message translates to:
  /// **'Health assessment'**
  String get healthassesment;

  /// No description provided for @know_your_score.
  ///
  /// In en, this message translates to:
  /// **'Know Your Score'**
  String get know_your_score;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'STOP'**
  String get stop;

  /// No description provided for @warn1.
  ///
  /// In en, this message translates to:
  /// **'Your device is in low power mode, please turn it off to proceed further'**
  String get warn1;

  /// No description provided for @warn2.
  ///
  /// In en, this message translates to:
  /// **'The Torch feature is unavailable.'**
  String get warn2;

  /// No description provided for @warn3.
  ///
  /// In en, this message translates to:
  /// **'The Torch has shut down unexpectedly.'**
  String get warn3;

  /// No description provided for @warn4.
  ///
  /// In en, this message translates to:
  /// **'The device does not meet the minimum OS version requirement.'**
  String get warn4;

  /// No description provided for @warn5.
  ///
  /// In en, this message translates to:
  /// **'The device\'s battery level is too low.'**
  String get warn5;

  /// No description provided for @warn6.
  ///
  /// In en, this message translates to:
  /// **'There is a significant clock skew on the device.'**
  String get warn6;

  /// No description provided for @warn7.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is turned off on the device.'**
  String get warn7;

  /// No description provided for @warn8.
  ///
  /// In en, this message translates to:
  /// **'The application lacks necessary Bluetooth permissions.'**
  String get warn8;

  /// No description provided for @warn9.
  ///
  /// In en, this message translates to:
  /// **'Location services are turned off on the device.'**
  String get warn9;

  /// No description provided for @warn10.
  ///
  /// In en, this message translates to:
  /// **'No camera is available on the device.'**
  String get warn10;

  /// No description provided for @warn11.
  ///
  /// In en, this message translates to:
  /// **'The camera could not be opened.'**
  String get warn11;

  /// No description provided for @warn12.
  ///
  /// In en, this message translates to:
  /// **'Missing permissions to access the camera.'**
  String get warn12;

  /// No description provided for @warn13.
  ///
  /// In en, this message translates to:
  /// **'The image dimensions from the camera are unexpected.'**
  String get warn13;

  /// No description provided for @warn14.
  ///
  /// In en, this message translates to:
  /// **'Activation limit for the license has been reached.'**
  String get warn14;

  /// No description provided for @warn15.
  ///
  /// In en, this message translates to:
  /// **'Meter attribute usage limit for the license has been reached.'**
  String get warn15;

  /// No description provided for @warn16.
  ///
  /// In en, this message translates to:
  /// **'License authentication failed.'**
  String get warn16;

  /// No description provided for @warn17.
  ///
  /// In en, this message translates to:
  /// **'The license key provided is invalid.'**
  String get warn17;

  /// No description provided for @warn18.
  ///
  /// In en, this message translates to:
  /// **'The license has been revoked.'**
  String get warn18;

  /// No description provided for @warn19.
  ///
  /// In en, this message translates to:
  /// **'An internal error occurred with the license code.'**
  String get warn19;

  /// No description provided for @warn20.
  ///
  /// In en, this message translates to:
  /// **'The license has expired.'**
  String get warn20;

  /// No description provided for @warn21.
  ///
  /// In en, this message translates to:
  /// **'The license has been suspended.'**
  String get warn21;

  /// No description provided for @warn22.
  ///
  /// In en, this message translates to:
  /// **'Network issues are preventing license validation.'**
  String get warn22;

  /// No description provided for @warn23.
  ///
  /// In en, this message translates to:
  /// **'SSL handshake failed during license validation.'**
  String get warn23;

  /// No description provided for @warn24.
  ///
  /// In en, this message translates to:
  /// **'The license key input is empty.'**
  String get warn24;

  /// No description provided for @warn25.
  ///
  /// In en, this message translates to:
  /// **'The product ID provided is illegal.'**
  String get warn25;

  /// No description provided for @warn26.
  ///
  /// In en, this message translates to:
  /// **'Unable to open the license file for reading.'**
  String get warn26;

  /// No description provided for @warn27.
  ///
  /// In en, this message translates to:
  /// **'Monthly usage tracking requires synchronization.'**
  String get warn27;

  /// No description provided for @warn28.
  ///
  /// In en, this message translates to:
  /// **'SSL handshake failed due to device date issues.'**
  String get warn28;

  /// No description provided for @warn29.
  ///
  /// In en, this message translates to:
  /// **'SSL certificate has expired.'**
  String get warn29;

  /// No description provided for @warn30.
  ///
  /// In en, this message translates to:
  /// **'The SDK version does not meet the minimum required version.'**
  String get warn30;

  /// No description provided for @warn31.
  ///
  /// In en, this message translates to:
  /// **'Network timeout occurred during license validation.'**
  String get warn31;

  /// No description provided for @warn32.
  ///
  /// In en, this message translates to:
  /// **'Fall detection has been disabled (deprecated code).'**
  String get warn32;

  /// No description provided for @warn33.
  ///
  /// In en, this message translates to:
  /// **'Fall detection has been disabled.'**
  String get warn33;

  /// No description provided for @warn34.
  ///
  /// In en, this message translates to:
  /// **'Misdetection duration has exceeded the allowable limit.'**
  String get warn34;

  /// No description provided for @warn35.
  ///
  /// In en, this message translates to:
  /// **'Recent detection rate is invalid.'**
  String get warn35;

  /// No description provided for @warn36.
  ///
  /// In en, this message translates to:
  /// **'License activation for measurement failed.'**
  String get warn36;

  /// No description provided for @warn37.
  ///
  /// In en, this message translates to:
  /// **'Invalid average detection rate for measurements.'**
  String get warn37;

  /// No description provided for @warn38.
  ///
  /// In en, this message translates to:
  /// **'Too many frames are out of order.'**
  String get warn38;

  /// No description provided for @warn39.
  ///
  /// In en, this message translates to:
  /// **'Misdetection duration exceeds the allowable limit (warning).'**
  String get warn39;

  /// No description provided for @warn40.
  ///
  /// In en, this message translates to:
  /// **'Invalid recent FPS (frames per second) rate.'**
  String get warn40;

  /// No description provided for @warn41.
  ///
  /// In en, this message translates to:
  /// **'A frame was misplaced in the measurement.'**
  String get warn41;

  /// No description provided for @warn42.
  ///
  /// In en, this message translates to:
  /// **'Blood pressure processing failed.'**
  String get warn42;

  /// No description provided for @warn43.
  ///
  /// In en, this message translates to:
  /// **'Measuring with no enabled vital signs.'**
  String get warn43;

  /// No description provided for @warn44.
  ///
  /// In en, this message translates to:
  /// **'Illegal start call for the session.'**
  String get warn44;

  /// No description provided for @warn45.
  ///
  /// In en, this message translates to:
  /// **'Illegal stop call for the session.'**
  String get warn45;

  /// No description provided for @warn46.
  ///
  /// In en, this message translates to:
  /// **'Invalid processing time during initialization.'**
  String get warn46;

  /// No description provided for @warn47.
  ///
  /// In en, this message translates to:
  /// **'Mismatch in rotation and orientation during initialization.'**
  String get warn47;

  /// No description provided for @warn48.
  ///
  /// In en, this message translates to:
  /// **'The license format is invalid.'**
  String get warn48;

  /// No description provided for @warn49.
  ///
  /// In en, this message translates to:
  /// **'SDK loading failed.'**
  String get warn49;

  /// No description provided for @warn50.
  ///
  /// In en, this message translates to:
  /// **'Unsupported user weight during initialization.'**
  String get warn50;

  /// No description provided for @warn51.
  ///
  /// In en, this message translates to:
  /// **'Unsupported user age during initialization.'**
  String get warn51;

  /// No description provided for @warn52.
  ///
  /// In en, this message translates to:
  /// **'Concurrent sessions error.'**
  String get warn52;

  /// No description provided for @warn53.
  ///
  /// In en, this message translates to:
  /// **'Missing Polar dependencies.'**
  String get warn53;

  /// No description provided for @warn54.
  ///
  /// In en, this message translates to:
  /// **'Missing analytics dependencies.'**
  String get warn54;

  /// No description provided for @warn55.
  ///
  /// In en, this message translates to:
  /// **'Monitoring has been stopped.'**
  String get warn55;

  /// No description provided for @warn56.
  ///
  /// In en, this message translates to:
  /// **'Monitoring data gap exceeds the allowable limit.'**
  String get warn56;

  /// No description provided for @scantext1.
  ///
  /// In en, this message translates to:
  /// **'Did you sleep 7-9 hours last night? Consistent sleep supports energy and focus.'**
  String get scantext1;

  /// No description provided for @scantext2.
  ///
  /// In en, this message translates to:
  /// **'Is your bedroom dark and cool? A calm environment improves sleep quality.'**
  String get scantext2;

  /// No description provided for @scantext3.
  ///
  /// In en, this message translates to:
  /// **'Do you avoid screens before bed? Less screen time helps you fall asleep faster.'**
  String get scantext3;

  /// No description provided for @scantext4.
  ///
  /// In en, this message translates to:
  /// **'Are you winding down before bed? A relaxing pre-sleep routine signals it’s time to rest.'**
  String get scantext4;

  /// No description provided for @scantext5.
  ///
  /// In en, this message translates to:
  /// **'Have you had 8 glasses of water today? Staying hydrated keeps your body energized.'**
  String get scantext5;

  /// No description provided for @scantext6.
  ///
  /// In en, this message translates to:
  /// **'Drinking water after waking up? Starting your day with water aids digestion.'**
  String get scantext6;

  /// No description provided for @scantext7.
  ///
  /// In en, this message translates to:
  /// **'Do you hydrate before and after exercise? Proper hydration supports endurance and recovery.'**
  String get scantext7;

  /// No description provided for @scantext8.
  ///
  /// In en, this message translates to:
  /// **'Drinking too many sugary drinks? Water is best for hydration without extra calories.'**
  String get scantext8;

  /// No description provided for @scantext9.
  ///
  /// In en, this message translates to:
  /// **'Are you including fruits and veggies daily? A colorful plate means a nutrient-rich diet.'**
  String get scantext9;

  /// No description provided for @scantext10.
  ///
  /// In en, this message translates to:
  /// **'Have you had enough protein today? Protein helps repair muscles and keeps you full.'**
  String get scantext10;

  /// No description provided for @scantext11.
  ///
  /// In en, this message translates to:
  /// **'Do you eat whole grains? Whole grains provide fiber and longer-lasting energy.'**
  String get scantext11;

  /// No description provided for @scantext12.
  ///
  /// In en, this message translates to:
  /// **'Are you mindful of portion sizes? Balanced portions prevent overeating and support digestion.'**
  String get scantext12;

  /// No description provided for @scantext13.
  ///
  /// In en, this message translates to:
  /// **'Are you limiting sugary snacks? Reducing sugar can improve energy levels and focus.'**
  String get scantext13;

  /// No description provided for @scantext14.
  ///
  /// In en, this message translates to:
  /// **'Did you move for at least 30 minutes today? Regular movement boosts mood and health.'**
  String get scantext14;

  /// No description provided for @scantext15.
  ///
  /// In en, this message translates to:
  /// **'Are you stretching during the day? Stretching can reduce muscle tension and improve flexibility.'**
  String get scantext15;

  /// No description provided for @scantext16.
  ///
  /// In en, this message translates to:
  /// **'Taking breaks to move around? Small movements prevent stiffness and increase energy.'**
  String get scantext16;

  /// No description provided for @scantext17.
  ///
  /// In en, this message translates to:
  /// **'Are you tracking your steps? Setting daily step goals keeps you active and motivated.'**
  String get scantext17;

  /// No description provided for @scantext18.
  ///
  /// In en, this message translates to:
  /// **'Did you do strength exercises this week? Strength training supports muscle and bone health.'**
  String get scantext18;

  /// No description provided for @scantext19.
  ///
  /// In en, this message translates to:
  /// **'Did you take a moment for self-care today? Self-care reduces stress and boosts well-being.'**
  String get scantext19;

  /// No description provided for @scantext20.
  ///
  /// In en, this message translates to:
  /// **'Do you practice deep breathing? Deep breaths calm your mind and reduce anxiety.'**
  String get scantext20;

  /// No description provided for @scantext21.
  ///
  /// In en, this message translates to:
  /// **'Had a positive thought today? Positive thinking can improve your mood and resilience.'**
  String get scantext21;

  /// No description provided for @scantext22.
  ///
  /// In en, this message translates to:
  /// **'Did you disconnect from screens for a while? A break from screens refreshes your focus.'**
  String get scantext22;

  /// No description provided for @scantext23.
  ///
  /// In en, this message translates to:
  /// **'Are you setting aside time to relax? Intentional relaxation improves mental clarity.'**
  String get scantext23;

  /// No description provided for @scantext24.
  ///
  /// In en, this message translates to:
  /// **'Have you taken a break to unwind? Regular breaks prevent burnout and reduce stress.'**
  String get scantext24;

  /// No description provided for @scantext25.
  ///
  /// In en, this message translates to:
  /// **'Did you spend time outdoors? Fresh air and sunlight can improve mood and energy.'**
  String get scantext25;

  /// No description provided for @scantext26.
  ///
  /// In en, this message translates to:
  /// **'Are you prioritizing tasks? Organization helps manage stress and boosts productivity.'**
  String get scantext26;

  /// No description provided for @scantext27.
  ///
  /// In en, this message translates to:
  /// **'Took a moment to breathe deeply today? Slow breathing calms your mind and body.'**
  String get scantext27;

  /// No description provided for @scantext28.
  ///
  /// In en, this message translates to:
  /// **'Practicing gratitude? Reflecting on positives can shift your mindset and reduce stress.'**
  String get scantext28;

  /// No description provided for @youhavesuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have successfully booked an'**
  String get youhavesuccessfully;

  /// No description provided for @appintmentwith.
  ///
  /// In en, this message translates to:
  /// **'appointment with'**
  String get appintmentwith;

  /// No description provided for @healthassetment.
  ///
  /// In en, this message translates to:
  /// **'Health Assesment'**
  String get healthassetment;

  /// No description provided for @knowyourscore.
  ///
  /// In en, this message translates to:
  /// **'Know Your Score'**
  String get knowyourscore;

  /// No description provided for @mymotivation.
  ///
  /// In en, this message translates to:
  /// **'1.My motivation is lower when I am fatigued.'**
  String get mymotivation;

  /// No description provided for @extercisebrings.
  ///
  /// In en, this message translates to:
  /// **'2.Exercise brings on my fatigue.'**
  String get extercisebrings;

  /// No description provided for @iameasilyfatigue.
  ///
  /// In en, this message translates to:
  /// **'3.I am easily fatigued.'**
  String get iameasilyfatigue;

  /// No description provided for @fatigueinterface.
  ///
  /// In en, this message translates to:
  /// **'4.Fatigue interferes with my physical functioning.'**
  String get fatigueinterface;

  /// No description provided for @fatiguecauses.
  ///
  /// In en, this message translates to:
  /// **'5.Fatigue causes frequent problems for me.'**
  String get fatiguecauses;

  /// No description provided for @myfatigueprevents.
  ///
  /// In en, this message translates to:
  /// **'6.My fatigue prevents sustained physical functioning.'**
  String get myfatigueprevents;

  /// No description provided for @fatiqueinterfaceswith.
  ///
  /// In en, this message translates to:
  /// **'7.Fatigue interferes with carrying out certain duties and responsibilities.'**
  String get fatiqueinterfaceswith;

  /// No description provided for @fatigueisamong.
  ///
  /// In en, this message translates to:
  /// **'8.Fatigue is among my three most disabling symptoms.'**
  String get fatigueisamong;

  /// No description provided for @fatigueinterfaceswithmy.
  ///
  /// In en, this message translates to:
  /// **'9.Fatigue interferes with my work, family, or social life.'**
  String get fatigueinterfaceswithmy;

  /// No description provided for @daytimesleepness.
  ///
  /// In en, this message translates to:
  /// **' daytime sleepiness'**
  String get daytimesleepness;

  /// No description provided for @sleppscorelist.
  ///
  /// In en, this message translates to:
  /// **'Sleep Score List'**
  String get sleppscorelist;

  /// No description provided for @cardiovasculariskquestio.
  ///
  /// In en, this message translates to:
  /// **'CardioVascular Risk Questionnaire'**
  String get cardiovasculariskquestio;

  /// No description provided for @areyoufacing.
  ///
  /// In en, this message translates to:
  /// **'1. Are you facing any difficulty in breathing?'**
  String get areyoufacing;

  /// No description provided for @doyoudrinking.
  ///
  /// In en, this message translates to:
  /// **'2. Do you have drinking habits?'**
  String get doyoudrinking;

  /// No description provided for @doyouhavesmoking.
  ///
  /// In en, this message translates to:
  /// **'Do you have Smoking habits?'**
  String get doyouhavesmoking;

  /// No description provided for @doyouanylong.
  ///
  /// In en, this message translates to:
  /// **'3. Do you have any long lasting diseases?'**
  String get doyouanylong;

  /// No description provided for @regularmedicines.
  ///
  /// In en, this message translates to:
  /// **'4. Regular Medicines being taken for Diabetes or Heart related?'**
  String get regularmedicines;

  /// No description provided for @skipe.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipe;

  /// No description provided for @mentalhealthhquestion.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Questionnaire'**
  String get mentalhealthhquestion;

  /// No description provided for @littleinterest.
  ///
  /// In en, this message translates to:
  /// **'1. Little interest or pleasure in doing things.'**
  String get littleinterest;

  /// No description provided for @fellingdown.
  ///
  /// In en, this message translates to:
  /// **'2. Feeling down, depressed, or hopeless.'**
  String get fellingdown;

  /// No description provided for @troublefalling.
  ///
  /// In en, this message translates to:
  /// **'3. Trouble falling or staying asleep, or sleeping too much.'**
  String get troublefalling;

  /// No description provided for @fellingtired.
  ///
  /// In en, this message translates to:
  /// **'4. Feeling tired or having little energy.'**
  String get fellingtired;

  /// No description provided for @poorappetite.
  ///
  /// In en, this message translates to:
  /// **'5. Poor appetite or overeating.'**
  String get poorappetite;

  /// No description provided for @feelingbadabout.
  ///
  /// In en, this message translates to:
  /// **'6. Feeling bad about yourself or that you are a failure -or have let yourself or your family down'**
  String get feelingbadabout;

  /// No description provided for @troubleconcentrate.
  ///
  /// In en, this message translates to:
  /// **'7. Trouble concentrating on things, such as reading the newspaper or watching television.'**
  String get troubleconcentrate;

  /// No description provided for @movingorspeaking.
  ///
  /// In en, this message translates to:
  /// **'8. Moving or speaking so slowly that other people could have noticed. Or the opposite being so fidgety or restless that you have been moving around a lot more than usual.'**
  String get movingorspeaking;

  /// No description provided for @thoughtsthatyou.
  ///
  /// In en, this message translates to:
  /// **'9. Thoughts that you would be better off dead or of hurting yourself in some way'**
  String get thoughtsthatyou;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @payLater.
  ///
  /// In en, this message translates to:
  /// **'Pay Later'**
  String get payLater;

  /// No description provided for @size1.
  ///
  /// In en, this message translates to:
  /// **'90-99.9cm (35.4-39.3in)'**
  String get size1;

  /// No description provided for @size2.
  ///
  /// In en, this message translates to:
  /// **'100-109.9cm (39.4in-42.9in)'**
  String get size2;

  /// No description provided for @size3.
  ///
  /// In en, this message translates to:
  /// **'110cm (43in) or above'**
  String get size3;

  /// No description provided for @depop1.
  ///
  /// In en, this message translates to:
  /// **'Not at all'**
  String get depop1;

  /// No description provided for @depop2.
  ///
  /// In en, this message translates to:
  /// **'Several days'**
  String get depop2;

  /// No description provided for @depop3.
  ///
  /// In en, this message translates to:
  /// **'More than half the days'**
  String get depop3;

  /// No description provided for @depop4.
  ///
  /// In en, this message translates to:
  /// **'Nearly everyday'**
  String get depop4;

  /// No description provided for @invalidOrientation.
  ///
  /// In en, this message translates to:
  /// **'Invalid Orientation'**
  String get invalidOrientation;

  /// No description provided for @faceNotDetected.
  ///
  /// In en, this message translates to:
  /// **'Face Not Detected'**
  String get faceNotDetected;

  /// No description provided for @titledHead.
  ///
  /// In en, this message translates to:
  /// **'Titled Head'**
  String get titledHead;

  /// No description provided for @youAreTooFar.
  ///
  /// In en, this message translates to:
  /// **'You are Too Far'**
  String get youAreTooFar;

  /// No description provided for @unevenLighting.
  ///
  /// In en, this message translates to:
  /// **'Uneven Lighting'**
  String get unevenLighting;

  /// No description provided for @accuracyRange.
  ///
  /// In en, this message translates to:
  /// **'The accuracy range currently is 3-8, and under R&D'**
  String get accuracyRange;

  /// No description provided for @hemoglobin_text.
  ///
  /// In en, this message translates to:
  /// **'Men: 14 to 18 g/dL \nWomen: 12 to 16 g/dL for Hemoglobin'**
  String get hemoglobin_text;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @complete_profile.
  ///
  /// In en, this message translates to:
  /// **'Completing your profile is mandatory to access the app\'s features. You cannot use the app\'s functionalities until your profile is fully completed. '**
  String get complete_profile;

  /// No description provided for @your_wellness.
  ///
  /// In en, this message translates to:
  /// **'Your wellness partner'**
  String get your_wellness;

  /// No description provided for @inyourphone.
  ///
  /// In en, this message translates to:
  /// **'in your phone with'**
  String get inyourphone;

  /// No description provided for @aisol.
  ///
  /// In en, this message translates to:
  /// **'AI Solutions'**
  String get aisol;

  /// No description provided for @manualentry.
  ///
  /// In en, this message translates to:
  /// **'1. Manual Entry:'**
  String get manualentry;

  /// No description provided for @enterfoodinf.
  ///
  /// In en, this message translates to:
  /// **'Enter food items with detailed information to ensure accuracy.'**
  String get enterfoodinf;

  /// No description provided for @examplemanual.
  ///
  /// In en, this message translates to:
  /// **'Example: 2 slices of bread with 100g vegetable curry for precise nutritional analysis.'**
  String get examplemanual;

  /// No description provided for @uploadfoodimage.
  ///
  /// In en, this message translates to:
  /// **'2. Upload a Food Image:'**
  String get uploadfoodimage;

  /// No description provided for @options.
  ///
  /// In en, this message translates to:
  /// **'Use the options above to upload a clear image of your meal.'**
  String get options;

  /// No description provided for @sytemanalyze.
  ///
  /// In en, this message translates to:
  /// **'The system will analyze the image to calculate nutritional details.'**
  String get sytemanalyze;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'3. Tips for Accurate Results:'**
  String get tips;

  /// No description provided for @measuespecific.
  ///
  /// In en, this message translates to:
  /// **'Provide specific measurements (e.g., weight in grams or serving size).'**
  String get measuespecific;

  /// No description provided for @avoidterms.
  ///
  /// In en, this message translates to:
  /// **'Avoid generic terms like a bowl or some curry as they may reduce accuracy.'**
  String get avoidterms;

  /// No description provided for @whymatters.
  ///
  /// In en, this message translates to:
  /// **'4. Why It Matters:'**
  String get whymatters;

  /// No description provided for @accfoodlog.
  ///
  /// In en, this message translates to:
  /// **'Accurate food logging helps track your dietary habits, calculate calorie intake, and achieve your health goals.'**
  String get accfoodlog;

  /// No description provided for @byfolsteps.
  ///
  /// In en, this message translates to:
  /// **'By following these steps, you can ensure precise tracking and better insights into your nutrition.'**
  String get byfolsteps;

  /// No description provided for @foodloginstrctions.
  ///
  /// In en, this message translates to:
  /// **'Instructions for Logging Your Food Intake'**
  String get foodloginstrctions;

  /// No description provided for @paybalance.
  ///
  /// In en, this message translates to:
  /// **'Pay balance'**
  String get paybalance;

  /// No description provided for @areyousurewant.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to collect an amount of'**
  String get areyousurewant;

  /// No description provided for @rupeese.
  ///
  /// In en, this message translates to:
  /// **'rupees'**
  String get rupeese;

  /// No description provided for @updatenow.
  ///
  /// In en, this message translates to:
  /// **'Update now'**
  String get updatenow;

  /// No description provided for @youcantch.
  ///
  /// In en, this message translates to:
  /// **'You can\'t check future dates'**
  String get youcantch;

  /// No description provided for @firstfatigue.
  ///
  /// In en, this message translates to:
  /// **'The Fatigue Score is a tool that helps track and monitor your energy levels throughout the day.\n By recording your fatigue score regularly, you can better understand.'**
  String get firstfatigue;

  /// No description provided for @daycal.
  ///
  /// In en, this message translates to:
  /// **'DayCalorie Intake'**
  String get daycal;

  /// No description provided for @startrecording.
  ///
  /// In en, this message translates to:
  /// **'Start recording your food intake !!'**
  String get startrecording;

  /// No description provided for @nofoodlog.
  ///
  /// In en, this message translates to:
  /// **'No food log for the selected date.'**
  String get nofoodlog;

  /// No description provided for @enter_fooditem.
  ///
  /// In en, this message translates to:
  /// **'Please enter some food item name.'**
  String get enter_fooditem;

  /// No description provided for @instructionsfoodlog.
  ///
  /// In en, this message translates to:
  /// **'Instructions for Logging Your Food Intake'**
  String get instructionsfoodlog;

  /// No description provided for @manualfood.
  ///
  /// In en, this message translates to:
  /// **'1. Manual Entry:'**
  String get manualfood;

  /// No description provided for @entermanfood.
  ///
  /// In en, this message translates to:
  /// **'Enter food items with detailed information to ensure accuracy.'**
  String get entermanfood;

  /// No description provided for @exampleman.
  ///
  /// In en, this message translates to:
  /// **'Example: 2 slices of bread with 100g vegetable curry for precise nutritional analysis.'**
  String get exampleman;

  /// No description provided for @fooduploadimage.
  ///
  /// In en, this message translates to:
  /// **'2. Upload a Food Image:'**
  String get fooduploadimage;

  /// No description provided for @optionsuploadfood.
  ///
  /// In en, this message translates to:
  /// **'Use the options above to upload a clear image of your meal.'**
  String get optionsuploadfood;

  /// No description provided for @systemanalyze.
  ///
  /// In en, this message translates to:
  /// **'The system will analyze the image to calculate nutritional details.'**
  String get systemanalyze;

  /// No description provided for @accurateres.
  ///
  /// In en, this message translates to:
  /// **'3. Tips for Accurate Results:'**
  String get accurateres;

  /// No description provided for @providespecific.
  ///
  /// In en, this message translates to:
  /// **'Provide specific measurements (e.g., weight in grams or serving size).'**
  String get providespecific;

  /// No description provided for @aviodgenric.
  ///
  /// In en, this message translates to:
  /// **'Avoid generic terms like a bowl or some curry as they may reduce accuracy.'**
  String get aviodgenric;

  /// No description provided for @whyitmater.
  ///
  /// In en, this message translates to:
  /// **'4. Why It Matters:'**
  String get whyitmater;

  /// No description provided for @accuratefood.
  ///
  /// In en, this message translates to:
  /// **'Accurate food logging helps track your dietary habits, calculate calorie intake, and achieve your health goals.'**
  String get accuratefood;

  /// No description provided for @byfol.
  ///
  /// In en, this message translates to:
  /// **'By following these steps, you can ensure precise tracking and better insights into your nutrition.'**
  String get byfol;

  /// No description provided for @steps_track.
  ///
  /// In en, this message translates to:
  /// **'Steps Track'**
  String get steps_track;

  /// No description provided for @steps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get steps;

  /// No description provided for @greetings.
  ///
  /// In en, this message translates to:
  /// **'Hi! I am Ana.How can I help you?'**
  String get greetings;

  /// No description provided for @querymsg.
  ///
  /// In en, this message translates to:
  /// **'Please enter about your query?'**
  String get querymsg;

  /// No description provided for @theappuses.
  ///
  /// In en, this message translates to:
  /// **'XLCarez is a wellness and health monitoring app.The measured indicators are not intended for medical use, including self-diagnosis. It is designed for general fitness and wellness purposes. In order to undergo any treatment or diagnosis, consult with a medical professional as required. This app does not diagnose or treat medical conditions.'**
  String get theappuses;

  /// No description provided for @instructfor.
  ///
  /// In en, this message translates to:
  /// **'Instructions for Scanning Face:'**
  String get instructfor;

  /// No description provided for @ensurethelight.
  ///
  /// In en, this message translates to:
  /// **'1. Ensure the light is coming from the front.'**
  String get ensurethelight;

  /// No description provided for @avoidbright.
  ///
  /// In en, this message translates to:
  /// **'2. Avoid bright lights behind you.'**
  String get avoidbright;

  /// No description provided for @positionyourself.
  ///
  /// In en, this message translates to:
  /// **'3. Position yourself in a well-lit area.'**
  String get positionyourself;

  /// No description provided for @keepyourface.
  ///
  /// In en, this message translates to:
  /// **'4. Keep your face clearly visible in the frame.'**
  String get keepyourface;

  /// No description provided for @failedtocapture.
  ///
  /// In en, this message translates to:
  /// **'Failed to capture your vitals data. Please restart and follow the guidelines provided.'**
  String get failedtocapture;

  /// No description provided for @picupyourdate.
  ///
  /// In en, this message translates to:
  /// **'Pick your dob'**
  String get picupyourdate;

  /// No description provided for @nterweight.
  ///
  /// In en, this message translates to:
  /// **'Enter your Weight(Kg)'**
  String get nterweight;

  /// No description provided for @neterheight.
  ///
  /// In en, this message translates to:
  /// **'Enter your Height(Cm)'**
  String get neterheight;

  /// No description provided for @enterheight.
  ///
  /// In en, this message translates to:
  /// **'Enter Height'**
  String get enterheight;

  /// No description provided for @enterweiht.
  ///
  /// In en, this message translates to:
  /// **'Enter Weight'**
  String get enterweiht;

  /// No description provided for @weightkgshouldbe.
  ///
  /// In en, this message translates to:
  /// **'Weight(Kg) should be between 40 to 150 kg'**
  String get weightkgshouldbe;

  /// No description provided for @enteree.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enteree;

  /// No description provided for @clinicainnotes.
  ///
  /// In en, this message translates to:
  /// **'Clinician Notes'**
  String get clinicainnotes;

  /// No description provided for @recomed.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get recomed;

  /// No description provided for @speciliaty.
  ///
  /// In en, this message translates to:
  /// **'Speciality'**
  String get speciliaty;

  /// No description provided for @head.
  ///
  /// In en, this message translates to:
  /// **'Head'**
  String get head;

  /// No description provided for @rightarm.
  ///
  /// In en, this message translates to:
  /// **'Right Arm'**
  String get rightarm;

  /// No description provided for @rightleg.
  ///
  /// In en, this message translates to:
  /// **'Right Leg'**
  String get rightleg;

  /// No description provided for @leftarm.
  ///
  /// In en, this message translates to:
  /// **'Left Arm'**
  String get leftarm;

  /// No description provided for @leftleg.
  ///
  /// In en, this message translates to:
  /// **'Left Leg'**
  String get leftleg;

  /// No description provided for @selecte.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selecte;

  /// No description provided for @commentse.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get commentse;

  /// No description provided for @pleaseselecthospital.
  ///
  /// In en, this message translates to:
  /// **'Please select Hospital to continue !!'**
  String get pleaseselecthospital;

  /// No description provided for @imagegen.
  ///
  /// In en, this message translates to:
  /// **'Image is being generated, please wait...'**
  String get imagegen;

  /// No description provided for @intrpret.
  ///
  /// In en, this message translates to:
  /// **'Interpretation'**
  String get intrpret;

  /// No description provided for @observedval.
  ///
  /// In en, this message translates to:
  /// **'Observed Value'**
  String get observedval;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidence;

  /// No description provided for @investigation.
  ///
  /// In en, this message translates to:
  /// **'Investigation'**
  String get investigation;

  /// No description provided for @brr.
  ///
  /// In en, this message translates to:
  /// **'Biological Refernce Range'**
  String get brr;

  /// No description provided for @vitalsingn.
  ///
  /// In en, this message translates to:
  /// **'Vital Signs'**
  String get vitalsingn;

  /// No description provided for @accur.
  ///
  /// In en, this message translates to:
  /// **'Accuracy Range'**
  String get accur;

  /// No description provided for @uim.
  ///
  /// In en, this message translates to:
  /// **'Unit of Measurement'**
  String get uim;

  /// No description provided for @resolution.
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get resolution;

  /// No description provided for @errl.
  ///
  /// In en, this message translates to:
  /// **'Error level'**
  String get errl;

  /// No description provided for @blodia.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Diastolic'**
  String get blodia;

  /// No description provided for @blosys.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Systolic'**
  String get blosys;

  /// No description provided for @sec.
  ///
  /// In en, this message translates to:
  /// **'sec'**
  String get sec;

  /// No description provided for @dos.
  ///
  /// In en, this message translates to:
  /// **'Do,s'**
  String get dos;

  /// No description provided for @donts.
  ///
  /// In en, this message translates to:
  /// **'Don\'ts'**
  String get donts;

  /// No description provided for @ensurethelightis.
  ///
  /// In en, this message translates to:
  /// **'Ensure the light is coming from the front.'**
  String get ensurethelightis;

  /// No description provided for @avoidbrightlight.
  ///
  /// In en, this message translates to:
  /// **'Avoid bright lights behind you.'**
  String get avoidbrightlight;

  /// No description provided for @positionyourselfina.
  ///
  /// In en, this message translates to:
  /// **'Position yourself in a well-lit area.'**
  String get positionyourselfina;

  /// No description provided for @keepyourfaceclearly.
  ///
  /// In en, this message translates to:
  /// **'Keep your face clearly visible in the frame'**
  String get keepyourfaceclearly;

  /// No description provided for @avoidscanning.
  ///
  /// In en, this message translates to:
  /// **'Avoid scanning in dim or dark environments.'**
  String get avoidscanning;

  /// No description provided for @avoidextreame.
  ///
  /// In en, this message translates to:
  /// **'Avoid extreme facial expressions.'**
  String get avoidextreame;

  /// No description provided for @donotmoveexcessivelyduring.
  ///
  /// In en, this message translates to:
  /// **'Do not move excessively during the scan.'**
  String get donotmoveexcessivelyduring;

  /// No description provided for @reciverequestfrom.
  ///
  /// In en, this message translates to:
  /// **'Receive request from'**
  String get reciverequestfrom;

  /// No description provided for @sentrequestto.
  ///
  /// In en, this message translates to:
  /// **'Sent request to'**
  String get sentrequestto;

  /// No description provided for @extreme.
  ///
  /// In en, this message translates to:
  /// **'Extreme'**
  String get extreme;

  /// No description provided for @connectrequsetsent.
  ///
  /// In en, this message translates to:
  /// **'You have already sent a connection request to this user!'**
  String get connectrequsetsent;

  /// No description provided for @invalidrequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid Request'**
  String get invalidrequest;

  /// No description provided for @hypthermia.
  ///
  /// In en, this message translates to:
  /// **'Hypothermia'**
  String get hypthermia;

  /// No description provided for @fever.
  ///
  /// In en, this message translates to:
  /// **'Fever'**
  String get fever;

  /// No description provided for @predia.
  ///
  /// In en, this message translates to:
  /// **'Pre-diabetes'**
  String get predia;

  /// No description provided for @diabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get diabetes;

  /// No description provided for @prediarisk.
  ///
  /// In en, this message translates to:
  /// **'Predaibetesrisk'**
  String get prediarisk;

  /// No description provided for @diaberisk.
  ///
  /// In en, this message translates to:
  /// **'Daibetesrisk'**
  String get diaberisk;

  /// No description provided for @notanemic.
  ///
  /// In en, this message translates to:
  /// **'You are not anemic.'**
  String get notanemic;

  /// No description provided for @anemic.
  ///
  /// In en, this message translates to:
  /// **'You are anemic.'**
  String get anemic;

  /// No description provided for @patientse.
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get patientse;

  /// No description provided for @hospitasee.
  ///
  /// In en, this message translates to:
  /// **'Hospitals'**
  String get hospitasee;

  /// No description provided for @organizationse.
  ///
  /// In en, this message translates to:
  /// **'Organizations'**
  String get organizationse;

  /// No description provided for @userse.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get userse;

  /// No description provided for @organizatione.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get organizatione;

  /// No description provided for @organizationname.
  ///
  /// In en, this message translates to:
  /// **'Organization Name'**
  String get organizationname;

  /// No description provided for @enteroganame.
  ///
  /// In en, this message translates to:
  /// **'Enter Organization Name'**
  String get enteroganame;

  /// No description provided for @shornamee.
  ///
  /// In en, this message translates to:
  /// **'Short Name'**
  String get shornamee;

  /// No description provided for @entershortname.
  ///
  /// In en, this message translates to:
  /// **'Enter Short Name'**
  String get entershortname;

  /// No description provided for @usre.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get usre;

  /// No description provided for @pleaseclickonthee.
  ///
  /// In en, this message translates to:
  /// **'Please click on the consent box to proceed'**
  String get pleaseclickonthee;

  /// No description provided for @rolesw.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get rolesw;

  /// No description provided for @pleaseselectrole.
  ///
  /// In en, this message translates to:
  /// **'Please Select Role'**
  String get pleaseselectrole;

  /// No description provided for @selectrolese.
  ///
  /// In en, this message translates to:
  /// **'Select Roles'**
  String get selectrolese;

  /// No description provided for @pleaseselectorganization.
  ///
  /// In en, this message translates to:
  /// **'Please Select Organization'**
  String get pleaseselectorganization;

  /// No description provided for @selectorganization.
  ///
  /// In en, this message translates to:
  /// **'Select Organiztions'**
  String get selectorganization;

  /// No description provided for @dialcodee.
  ///
  /// In en, this message translates to:
  /// **'Dial code'**
  String get dialcodee;

  /// No description provided for @hivasesquestiona.
  ///
  /// In en, this message translates to:
  /// **'Adherence Assessment'**
  String get hivasesquestiona;

  /// No description provided for @integrationscore.
  ///
  /// In en, this message translates to:
  /// **'Integration Score'**
  String get integrationscore;

  /// No description provided for @perseverencescore.
  ///
  /// In en, this message translates to:
  /// **'Perseverance Score'**
  String get perseverencescore;

  /// No description provided for @instructionsee.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get instructionsee;

  /// No description provided for @foreachstatebelow.
  ///
  /// In en, this message translates to:
  /// **'For each statement below, indicate how confident you have been in the past month (including today) that you can do the following. Use the response scale:'**
  String get foreachstatebelow;

  /// No description provided for @cannotdoatall.
  ///
  /// In en, this message translates to:
  /// **' 0 = Cannot do at all'**
  String get cannotdoatall;

  /// No description provided for @moderatelycertain.
  ///
  /// In en, this message translates to:
  /// **'1-9 = Moderately certain can do'**
  String get moderatelycertain;

  /// No description provided for @completelycertaincando.
  ///
  /// In en, this message translates to:
  /// **'10 = Completely certain can do'**
  String get completelycertaincando;

  /// No description provided for @hivquestionary1.
  ///
  /// In en, this message translates to:
  /// **'Stick to your treatment plan even when side effects interfere?'**
  String get hivquestionary1;

  /// No description provided for @hivquestionary2.
  ///
  /// In en, this message translates to:
  /// **'Integrate your treatment into your daily routine?'**
  String get hivquestionary2;

  /// No description provided for @hivquestionary3.
  ///
  /// In en, this message translates to:
  /// **'Take medication in front of people who don’t know you\'re HIV+?'**
  String get hivquestionary3;

  /// No description provided for @hivquestionary4.
  ///
  /// In en, this message translates to:
  /// **'Stick to your treatment schedule when your routine is disrupted?'**
  String get hivquestionary4;

  /// No description provided for @hivquestionary5.
  ///
  /// In en, this message translates to:
  /// **'Stick to your treatment schedule when you aren’t feeling well?'**
  String get hivquestionary5;

  /// No description provided for @hivquestionary6.
  ///
  /// In en, this message translates to:
  /// **'Stick to your treatment schedule when it means changing eating habits?'**
  String get hivquestionary6;

  /// No description provided for @hivquestionary7.
  ///
  /// In en, this message translates to:
  /// **'Continue treatment even if it interferes with daily activities?'**
  String get hivquestionary7;

  /// No description provided for @hivquestionary8.
  ///
  /// In en, this message translates to:
  /// **'Continue treatment even if T-cell count drops significantly?'**
  String get hivquestionary8;

  /// No description provided for @hivquestionary9.
  ///
  /// In en, this message translates to:
  /// **'Continue treatment even when feeling discouraged about health?'**
  String get hivquestionary9;

  /// No description provided for @hivquestionary10.
  ///
  /// In en, this message translates to:
  /// **'Continue treatment when clinic visits are a hassle?'**
  String get hivquestionary10;

  /// No description provided for @hivquestionary11.
  ///
  /// In en, this message translates to:
  /// **'Continue treatment even when people doubt its effectiveness?'**
  String get hivquestionary11;

  /// No description provided for @hivquestionary12.
  ///
  /// In en, this message translates to:
  /// **'Find something positive in treatment, even if it doesn’t improve health?'**
  String get hivquestionary12;

  /// No description provided for @pleaseansweraboveconti.
  ///
  /// In en, this message translates to:
  /// **'Please answer the question above to continue with your face scan.'**
  String get pleaseansweraboveconti;

  /// No description provided for @pleaseansweerquestion.
  ///
  /// In en, this message translates to:
  /// **'Please answer the question above to continue with your face scan.'**
  String get pleaseansweerquestion;

  /// No description provided for @invalidinput.
  ///
  /// In en, this message translates to:
  /// **'Invalid input'**
  String get invalidinput;

  /// No description provided for @notreleatedtofood.
  ///
  /// In en, this message translates to:
  /// **'This item is not related to food'**
  String get notreleatedtofood;

  /// No description provided for @totalscanse.
  ///
  /// In en, this message translates to:
  /// **'Total Scans'**
  String get totalscanse;

  /// No description provided for @orgcodee.
  ///
  /// In en, this message translates to:
  /// **'Org Code'**
  String get orgcodee;

  /// No description provided for @cleare.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get cleare;

  /// No description provided for @remindere.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get remindere;

  /// No description provided for @noreminders.
  ///
  /// In en, this message translates to:
  /// **'No reminders'**
  String get noreminders;

  /// No description provided for @neww.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get neww;

  /// No description provided for @selectmedicinee.
  ///
  /// In en, this message translates to:
  /// **'Select Medicine'**
  String get selectmedicinee;

  /// No description provided for @pleaseselectmedicine.
  ///
  /// In en, this message translates to:
  /// **'please select medicine before proceeding'**
  String get pleaseselectmedicine;

  /// No description provided for @othere.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get othere;

  /// No description provided for @otherisnotempty.
  ///
  /// In en, this message translates to:
  /// **'Other is cannot be empty'**
  String get otherisnotempty;

  /// No description provided for @custome.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custome;

  /// No description provided for @customreference.
  ///
  /// In en, this message translates to:
  /// **'Custom recurrence'**
  String get customreference;

  /// No description provided for @donee.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get donee;

  /// No description provided for @repeatevery.
  ///
  /// In en, this message translates to:
  /// **'Repeat every'**
  String get repeatevery;

  /// No description provided for @daysee.
  ///
  /// In en, this message translates to:
  /// **'Day\'s'**
  String get daysee;

  /// No description provided for @dayse.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get dayse;

  /// No description provided for @monthsee.
  ///
  /// In en, this message translates to:
  /// **'Months\'s'**
  String get monthsee;

  /// No description provided for @monthse.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get monthse;

  /// No description provided for @yearse.
  ///
  /// In en, this message translates to:
  /// **'Year\'s'**
  String get yearse;

  /// No description provided for @yeare.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get yeare;

  /// No description provided for @medicationreminder.
  ///
  /// In en, this message translates to:
  /// **'Medication Reminder'**
  String get medicationreminder;

  /// No description provided for @doesnotrepeat.
  ///
  /// In en, this message translates to:
  /// **'Does not repeat'**
  String get doesnotrepeat;

  /// No description provided for @everyday.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get everyday;

  /// No description provided for @everyweek.
  ///
  /// In en, this message translates to:
  /// **'Every week'**
  String get everyweek;

  /// No description provided for @everyfornightly.
  ///
  /// In en, this message translates to:
  /// **'Every fortnightly'**
  String get everyfornightly;

  /// No description provided for @everymonth.
  ///
  /// In en, this message translates to:
  /// **'Every month'**
  String get everymonth;

  /// No description provided for @everyyear.
  ///
  /// In en, this message translates to:
  /// **'Every year'**
  String get everyyear;

  /// No description provided for @nointernetconnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get nointernetconnection;

  /// No description provided for @pleasecheckyourconnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your connection again or connect to wifi.'**
  String get pleasecheckyourconnection;

  /// No description provided for @informationee.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get informationee;

  /// No description provided for @coupfield.
  ///
  /// In en, this message translates to:
  /// **'Enter Coupon Code to Reedem Scan\'s'**
  String get coupfield;

  /// No description provided for @apply_btn.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply_btn;

  /// No description provided for @complication.
  ///
  /// In en, this message translates to:
  /// **'Complications'**
  String get complication;

  /// No description provided for @macrovascular.
  ///
  /// In en, this message translates to:
  /// **'Macro-Vascular'**
  String get macrovascular;

  /// No description provided for @coronaryartery.
  ///
  /// In en, this message translates to:
  /// **'Coronary artery disease'**
  String get coronaryartery;

  /// No description provided for @cerebrovascular.
  ///
  /// In en, this message translates to:
  /// **'Cerebrovascular disease'**
  String get cerebrovascular;

  /// No description provided for @peripheral.
  ///
  /// In en, this message translates to:
  /// **'Peripheral artery disease'**
  String get peripheral;

  /// No description provided for @remark.
  ///
  /// In en, this message translates to:
  /// **'Remark'**
  String get remark;

  /// No description provided for @microvascular.
  ///
  /// In en, this message translates to:
  /// **'Micro-Vascular'**
  String get microvascular;

  /// No description provided for @retinopathy.
  ///
  /// In en, this message translates to:
  /// **'Retinopathy'**
  String get retinopathy;

  /// No description provided for @nephropathy.
  ///
  /// In en, this message translates to:
  /// **'Nephropathy'**
  String get nephropathy;

  /// No description provided for @neuropathy.
  ///
  /// In en, this message translates to:
  /// **'Neuropathy'**
  String get neuropathy;

  /// No description provided for @footcomlications.
  ///
  /// In en, this message translates to:
  /// **'Foot complications'**
  String get footcomlications;

  /// No description provided for @skin.
  ///
  /// In en, this message translates to:
  /// **'Skin redness, cracks, callus'**
  String get skin;

  /// No description provided for @sensation.
  ///
  /// In en, this message translates to:
  /// **'Reduced Sensation'**
  String get sensation;

  /// No description provided for @vibration.
  ///
  /// In en, this message translates to:
  /// **'Reduced Vibration'**
  String get vibration;

  /// No description provided for @deformity.
  ///
  /// In en, this message translates to:
  /// **'Deformity'**
  String get deformity;

  /// No description provided for @ulcer.
  ///
  /// In en, this message translates to:
  /// **'Ulcer'**
  String get ulcer;

  /// No description provided for @cconsultione.
  ///
  /// In en, this message translates to:
  /// **'Consultation'**
  String get cconsultione;

  /// No description provided for @visittypee.
  ///
  /// In en, this message translates to:
  /// **'Visit-Type'**
  String get visittypee;

  /// No description provided for @follwwupe.
  ///
  /// In en, this message translates to:
  /// **'Follow-Up'**
  String get follwwupe;

  /// No description provided for @visitduedate.
  ///
  /// In en, this message translates to:
  /// **'Visit Due date'**
  String get visitduedate;

  /// No description provided for @invduedate.
  ///
  /// In en, this message translates to:
  /// **'Inv Due date'**
  String get invduedate;

  /// No description provided for @acpcduedate.
  ///
  /// In en, this message translates to:
  /// **'AC-PC Due Date'**
  String get acpcduedate;

  /// No description provided for @cvdrisk.
  ///
  /// In en, this message translates to:
  /// **'CVD Risk'**
  String get cvdrisk;

  /// No description provided for @anthropometrye.
  ///
  /// In en, this message translates to:
  /// **'Anthropometry'**
  String get anthropometrye;

  /// No description provided for @heighte.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get heighte;

  /// No description provided for @weighte.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weighte;

  /// No description provided for @toboccousee.
  ///
  /// In en, this message translates to:
  /// **'Tobacco Use'**
  String get toboccousee;

  /// No description provided for @whocvdriskscore.
  ///
  /// In en, this message translates to:
  /// **'WHO-CVD Risk SCORE'**
  String get whocvdriskscore;

  /// No description provided for @nonlabbasedcvdriskscore.
  ///
  /// In en, this message translates to:
  /// **'Non lab based CVD risk score'**
  String get nonlabbasedcvdriskscore;

  /// No description provided for @labbasedcvdriskscore.
  ///
  /// In en, this message translates to:
  /// **'Lab based CVD risk score'**
  String get labbasedcvdriskscore;

  /// No description provided for @labinvestigation.
  ///
  /// In en, this message translates to:
  /// **'Lab Investigation'**
  String get labinvestigation;

  /// No description provided for @ureae.
  ///
  /// In en, this message translates to:
  /// **'Urea'**
  String get ureae;

  /// No description provided for @creatininee.
  ///
  /// In en, this message translates to:
  /// **'Creatinine'**
  String get creatininee;

  /// No description provided for @funduse.
  ///
  /// In en, this message translates to:
  /// **'Fundus'**
  String get funduse;

  /// No description provided for @patienteee.
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get patienteee;

  /// No description provided for @proxye.
  ///
  /// In en, this message translates to:
  /// **'Proxy'**
  String get proxye;

  /// No description provided for @confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get confirmed;

  /// No description provided for @mandatoryfields.
  ///
  /// In en, this message translates to:
  /// **'please enter mandatory fields'**
  String get mandatoryfields;

  /// No description provided for @weightrangeerror.
  ///
  /// In en, this message translates to:
  /// **'Weight in kg should be within the range of 40 to 150 kg'**
  String get weightrangeerror;

  /// No description provided for @heightrangeerror.
  ///
  /// In en, this message translates to:
  /// **'Height in cm should be within the range of 130 to 230 centimeters'**
  String get heightrangeerror;

  /// No description provided for @weighterrorlbs.
  ///
  /// In en, this message translates to:
  /// **'Weight in lbs should be within the range of 88 to 330 lbs'**
  String get weighterrorlbs;

  /// No description provided for @feet.
  ///
  /// In en, this message translates to:
  /// **'Feets'**
  String get feet;

  /// No description provided for @inch.
  ///
  /// In en, this message translates to:
  /// **'Inches'**
  String get inch;

  /// No description provided for @hgtf.
  ///
  /// In en, this message translates to:
  /// **'Height(Feet-Inches)'**
  String get hgtf;

  /// No description provided for @heightmax.
  ///
  /// In en, this message translates to:
  /// **'Height must be between 130 cm and 230 cm (approximately 4 feet 3 inches to 7 feet 7 inches).'**
  String get heightmax;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'it',
        'pt',
        'uk'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
