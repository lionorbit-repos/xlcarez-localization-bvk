import 'package:XLcarez/env/appexports.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
Future<void> repeatNotification(id) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
          'repeating channel id', 'repeating channel name',
          channelDescription: 'repeating description');
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.periodicallyShow(
    id++,
    'repeating title',
    'repeating body',
    RepeatInterval.everyMinute,
    notificationDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
}

Future<void> schedulerepeatNextNotification(
    {required int id,
    required int interval,
    required String unit,
    required DateTime date,
    body}) async {
      final location = tz.getLocation(
      (await FlutterTimezone.getLocalTimezone()).toString()); // Set your timezone
  // final tz.TZDateTime now = tz.TZDateTime.from(date,location);
   tz.TZDateTime scheduledTime ;
  tz.TZDateTime scheduledDate;
  scheduledDate = tz.TZDateTime.from(
      date,
      location,
    );

  // Calculate next notification time dynamically
  if (unit == "Day") {
    scheduledTime = scheduledDate.add(Duration(days: interval));
  } else if (unit == "Month") {
    int newMonth = scheduledDate.month + interval;
    int newYear = scheduledDate.year;

    while (newMonth > 12) {
      newMonth -= 12;
      newYear += 1;
    }

    int daysInNewMonth = DateTime(newYear, newMonth + 1, 0).day;
    int validDay = scheduledDate.day > daysInNewMonth ? daysInNewMonth : scheduledDate.day;

    scheduledTime = tz.TZDateTime(
        tz.local, newYear, newMonth, validDay, scheduledDate.hour, scheduledDate.minute);
  } else if (unit == "Year") {
    scheduledTime = tz.TZDateTime(tz.local, scheduledDate.year + interval, scheduledDate.month,
        scheduledDate.day, scheduledDate.hour, scheduledDate.minute);
  } else {
    return; // Invalid input
  }

  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'dynamic_repeating_channel_id',
    'Dynamic Repeating Notifications',
    channelDescription: 'Repeats dynamically after each trigger',
    importance: Importance.high,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    "Repeat every $interval ${interval > 1 ? "$unit's" : unit}",
    body,
    scheduledTime,
    payload: scheduledTime.toString(),
    notificationDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents:
        DateTimeComponents.time,
  );
}

Future<void> scheduleNotification() async {
  tz.TZDateTime scheduledDate =
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0, // Notification ID
    "Medication Reminder",
    "It's time to take your medicine!",
    scheduledDate,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'medication_channel',
        'Medication Reminders',
        importance: Importance.high,
        priority: Priority.high,
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents: DateTimeComponents.time,
     
  );
}

// tz.TZDateTime _nextInstanceOfMondayTenAM(
//     {required DateTime date, location, required int day}) {
//   tz.TZDateTime scheduledDate = tz.TZDateTime.from(date, location);
//   while (scheduledDate.weekday != day) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// tz.TZDateTime _nextInstance(time, minute) {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduledDate =
//       tz.TZDateTime(tz.local, now.year, now.month, now.day, time, minute);
//   if (scheduledDate.isBefore(now)) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   //print(scheduledDate.toString());
//   return scheduledDate;
// }

// Future<void> _scheduleDailyTenAMNotification(
//     {time, minute, message, id}) async {
//   try {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         id,
//         'Medication Reminder',
//         message,
//         _nextInstance(time, minute),
//         const NotificationDetails(
//           android: AndroidNotificationDetails('daily notification channel id',
//               'daily notification channel name',
//               channelDescription: 'daily notification description'),
//         ),
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//         payload: _nextInstance(time, minute).toIso8601String(),
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         matchDateTimeComponents: DateTimeComponents.time);
//   } catch (e) {
//     // print("error $e");
//   }
// }

/*
  // if (id != null) {
                                    //   print("edit");
                                    //   Navigator.pop(context);
                                    // } else {
                                    //   print("add");
                                    //   Navigator.pop(context);
                                    // }
                                    // AndroidNotificationDetails
                                    //     androidNotificationDetails =
                                    //     const AndroidNotificationDetails(
                                    //         'ic', 'General',
                                    //         channelDescription: "Reminders",
                                    //         importance: Importance.max,
                                    //         priority: Priority.high,
                                    //         ticker: 'ticker');
                                    // const DarwinNotificationDetails
                                    //     iosNotificationDetails =
                                    //     DarwinNotificationDetails(
                                    //         //categoryIdentifier: 'plainCategory',
                                    //         );
                                    // NotificationDetails notificationDetails =
                                    //     NotificationDetails(
                                    //         android: androidNotificationDetails,
                                    //         iOS: iosNotificationDetails);
                                    // await flutterLocalNotificationsPlugin.show(
                                    //     med.checkindex(),
                                    //     'plain title',
                                    //     'plain body',
                                    //     notificationDetails,
                                    //     payload: 'item x');
                                    scheduleDailyNotification(
                                            id: med.checkindex(),
                                            title: "Medictaion Reminder",
                                            date: med.medicatiopndate,
                                            body: med
                                                        .selectedMedicine ==
                                                    "Other"
                                                ? med.othermedicationcontroller
                                                    .text
                                                : med.selectedMedicine)
                                        .whenComplete(() {
                                      med.fethcmedications();
                                      med.resedata();
                                      Navigator.pop(context);
                                    });
                                    //print(med.checkindex().toString());
                                    // _scheduleDailyTenAMNotification(
                                    //         time: med.medicatiopndate.hour,
                                    //         minute: med.medicatiopndate.minute,
                                    //         id: med.checkindex(),
                                    //         message: med
                                    //                     .selectedMedicine ==
                                    //                 "Other"
                                    //             ? med.othermedicationcontroller
                                    //                 .text
                                    //             : med.selectedMedicine)
                                    //     .whenComplete(() {
                                    //   med.fethcmedications();
                                    //   med.resedata();
                                    //   Navigator.pop(context);
                                    // });
  */

Future<void> scheduleNotificationringonce(
    {required int id,
    required String title,
    required String? body,
    required DateTime date}) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'ringonceid',
    'Ringonce',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
    //sound: RawResourceAndroidNotificationSound('notification_sound'), // Add your custom sound if needed
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  final location = tz.getLocation(
      (await FlutterTimezone.getLocalTimezone()).toString()); // Set your timezone
  //print(location.toString());
  tz.TZDateTime scheduledDate;
  final today = DateTime.now();
  if (date.isBefore(today)) {
    scheduledDate = tz.TZDateTime.from(
      DateTime.now().add(const Duration(days: 1)),
      location,
    );
    // print(scheduledDate.toString());
  } else {
    scheduledDate = tz.TZDateTime.from(
      date,
      location,
    );
    // print("today");
    // print(scheduledDate.toString());
  }

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id, // Unique ID
    'Medication Reminder',
    body,
    payload: scheduledDate.toString(),
    scheduledDate,
    platformChannelSpecifics,
    androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    matchDateTimeComponents:
        DateTimeComponents.time,
  );
}

DateTimeComponents checkuinotification(String val) {
  switch (val) {
    case 'Every day':
      return DateTimeComponents.time;
    case 'Every week':
      return DateTimeComponents.dayOfWeekAndTime;
    default:
      return DateTimeComponents.time;
  }
}

DateTimeComponents checkdatetimeconent(String val) {
  switch (val) {
    case 'Every day':
      return DateTimeComponents.time;
    case 'Every week':
      return DateTimeComponents.dayOfWeekAndTime;
    case 'Every year':
      return DateTimeComponents.dateAndTime;
    case 'Every month':
      return DateTimeComponents.dayOfMonthAndTime;
    case 'Every fortnightly':
      return DateTimeComponents.dayOfMonthAndTime;
    default:
      return DateTimeComponents.time;
  }
}

Future<void> showNotification(
    {required int id,
    required String title,
    required String? body,
    required DateTime date}) async {
  AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails('generalid', 'General',
          channelDescription: "Reminders",
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const DarwinNotificationDetails iosNotificationDetails =
      DarwinNotificationDetails(
          //categoryIdentifier: 'plainCategory',
          );
  NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: iosNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
      id, "Medication Reminder", body, notificationDetails,
      payload: date.toIso8601String());
}

Future<void> scheduleDailyNotification(
    {required int id,
    required String title,
    required String? body,
    required DateTime date}) async {
  final location = tz.getLocation(
      (await FlutterTimezone.getLocalTimezone()).toString()); // Set your timezone
  //print(location.toString());
  tz.TZDateTime scheduledDate;
  final today = DateTime.now();
  if (date.isBefore(today)) {
    scheduledDate = tz.TZDateTime.from(
      DateTime.now().add(const Duration(days: 1)),
      location,
    );
    //print(scheduledDate.toString());
  } else {
    scheduledDate = tz.TZDateTime.from(
      date,
      location,
    );
    // print("today");
    // print(scheduledDate.toString());
  }

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    'Daily Medication Reminder',
    body,
    scheduledDate,
    payload: scheduledDate.toString(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily reminders at a fixed time',
        importance: Importance.high,
        priority: Priority.high,
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents:
        DateTimeComponents.time, // Ensures it repeats daily
  );
}

Future<void> scheduleDailyNotificationweekly(
    {required int id,
    required String title,
    required String? body,
    required DateTime date}) async {
  final location = tz.getLocation(
      (await FlutterTimezone.getLocalTimezone()).toString()); // Set your timezone
  // print(location.toString());
  tz.TZDateTime scheduledDate;
  final today = DateTime.now();
  if (date.isBefore(today)) {
    scheduledDate = tz.TZDateTime.from(
      DateTime.now().add(const Duration(days: 7)),
      location,
    );
    //print(scheduledDate.toString());
  } else {
    scheduledDate = tz.TZDateTime.from(
      date,
      location,
    );
    // print("today");
    // print(scheduledDate.toString());
  }

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    'Weekly Medication Reminder',
    body,
    scheduledDate,
    payload: scheduledDate.toString(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'weekly_channel_id',
        'Weekly Notifications',
        channelDescription: 'Weekly reminders at a fixed time',
        importance: Importance.high,
        priority: Priority.high,
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents:
        DateTimeComponents.dayOfWeekAndTime, // Ensures it repeats daily
  );
}

Future<tz.TZDateTime> fetchtriggerdate({required DateTime date, required String trigger}) async {
  final location = tz.getLocation((await FlutterTimezone.getLocalTimezone()).toString());
  tz.TZDateTime scheduledDate;
  final today = DateTime.now();
  if (date.isBefore(today)) {
    if (trigger == "Every day") {
      scheduledDate = tz.TZDateTime.from(
        date.add(const Duration(days: 1)),
        location,
      );
    } else if (trigger == "Every week") {
      scheduledDate = tz.TZDateTime.from(
        date.add(const Duration(days: 7)),
        location,
      );
    } else if (trigger == "Every month") {
      if ((date.month + 1) <= 12) {
        scheduledDate = tz.TZDateTime.from(
          DateTime(today.year, date.month + 1, date.day),
          location,
        );
      } else {
        scheduledDate = tz.TZDateTime.from(
          DateTime(date.year + 1, date.month + 1, date.day),
          location,
        );
      }
    } else if (trigger == "Every year") {
      scheduledDate = tz.TZDateTime.from(
        DateTime(date.year + 1, date.month, date.day),
        location,
      );
    } else if (trigger == "Every fortnightly") {
      scheduledDate = tz.TZDateTime.from(
        date.add(const Duration(days: 15)),
        location,
      );
    } else {
      scheduledDate = tz.TZDateTime.from(
        date.add(const Duration(days: 1)),
        location,
      );
    }
    //print(scheduledDate.toString());
  } else {
    scheduledDate = tz.TZDateTime.from(
      date,
      location,
    );
  }
  return scheduledDate;
}

Future<void> showcustomenotification(
    {required int id,
    required String title,
    required String? body,
    required DateTime date,
    required trigger}) async {
  final actulasceduldedate =
      await fetchtriggerdate(date: date, trigger: trigger);
  await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      '${trigger.toString().replaceAll("Every", "").capitalize()} Medication Reminder',
      body,
      actulasceduldedate,
      payload: actulasceduldedate.toString(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel_id',
          'Channel Notifications',
          channelDescription: 'Channel Description',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      //uILocalNotificationDateInterpretation: checkuinotification(trigger),
      matchDateTimeComponents: trigger == "Does not repeat"
          ? null
          : checkdatetimeconent(trigger) // Ensures it repeats daily
      );
}
