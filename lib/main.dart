import 'package:XLcarez/env/appexports.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'dart:ui' as ui;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

//com.app.xlcare 
//com.app.healthaxis.healthaxis
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initializes Hive storage

  await Hive.openBox('XLcarezstore');

  tz.initializeTimeZones();
  String timeZoneName = (await FlutterTimezone.getLocalTimezone()).toString();
  //print(timeZoneName);
  // tz.setLocalLocation(tz.getLocation(timeZoneName));
  try {
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    //print("Timezone successfully set!");
  } catch (e) {
    //print("Error setting timezone: $e");
  }

  requestNotificationPermissions();
  //Android initialization settings
  const AndroidInitializationSettings androidInitSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // iOS initialization settings
  const DarwinInitializationSettings iosInitSettings =
      DarwinInitializationSettings(
          defaultPresentAlert: true, defaultPresentBadge: true);

  // Combine settings
  const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings, iOS: iosInitSettings);

  // Initialize the plugin
  await flutterLocalNotificationsPlugin.initialize(initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
    // Handle notification tap
    //print("Notification Tapped: ${response.payload}");
  });
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Networkwrappercontroller()),
    ChangeNotifierProvider(create: (_) => Vitalscontroller()),
    ChangeNotifierProvider(create: (_) => MeasurementModel()),
    ChangeNotifierProvider(create: (_) => Appointmentcontroller()),
    ChangeNotifierProvider(create: (_) => Localizationcontroller()),
    //ChangeNotifierProvider(create: (_) => FootstepController()),
    ChangeNotifierProvider(create: (_) => DiabitiesController()),
    ChangeNotifierProvider(create: (_) => Dotedlinecontroller()),
    ChangeNotifierProvider(create: (_) => ScoreManagementController()),
    ChangeNotifierProvider(create: (_) => Authcontroller()),
    ChangeNotifierProvider(create: (_) => FoodSearchController()),
    ChangeNotifierProvider(create: (_) => ConnectivityController()),
    ChangeNotifierProvider(create: (_) => Medicationcontroller()),
    ChangeNotifierProvider(create: (_) => CalculationRiskController()),
    ChangeNotifierProvider(create: (_) => Botcontroller()),
    ChangeNotifierProvider(create: (_) => Assesmentcontroller()),
    ChangeNotifierProvider(create: (_) => StepController())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) async {
      final lanctrl =
          Provider.of<Localizationcontroller>(context, listen: false);
      Locale deviceLanguage = ui.PlatformDispatcher.instance.locale;
      var locale = Locale(deviceLanguage.languageCode.split("_")[0]);
      var box = await Hive.openBox('XLcarezstore');
      final data = box.get('lanid');
      final lan = box.get('language');
      // SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
      // var data = await sharedPreferences.getInt("lanid");
      // var lan = await sharedPreferences.getString("language");
      if (data == null) {
        lanctrl.setLocale(locale);
      } else {
        lanctrl.setLocale(Locale(lan ?? "en"));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); 
    return apptheme(home: const Splash());
  }
}
