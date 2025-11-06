// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:XLcarez/env/appexports.dart';

class Medicationcontroller extends ChangeNotifier {
  List<Medication> medicationlist = [];

  String? selectedMedicine;
  var listinterval = List.generate(99, (i) => i + 1);
  DateTime medicatiopndate = DateTime.now();
  var istriger = 'Does not repeat';
  var interval = 1;
  var mode = 'Day';

  List dosagelist = ["1/2", "1", "1 1/2", "2", "2 1/2", "3"];
  List frequencylist = ["BD", "HS", "OD", "QID", "SOS", "TDS"];

  dynamic checkfrequecny(val) {
    var checkfre = frequencylist.any((ep) => ep == val);
    if (checkfre) {
      return val;
    } else {
      return null;
    }
  }

void changefrequency(val){
medication.days = val;
notifyListeners();
}

void changedosage(val){
medication.dosage = val;
notifyListeners();
}

  dynamic checkdosage(val) {
    var checkfre = dosagelist.any((ep) => ep == val);
    if (checkfre) {
      return val;
    } else {
      return null;
    }
  }

  List<String> triggers = [
    'Does not repeat',
    'Every day',
    'Every week',
    'Every fortnightly',
    'Every month',
    'Every year'
  ];

  void chnageinterval(val) {
    interval = val;
    //addval();
    notifyListeners();
  }

  void addval() {
    try {
      var firstrigger =
          "Repeat every $interval ${interval > 1 ? "$mode's" : mode}";
      var check =
          triggers.firstWhere((ele) => ele == firstrigger, orElse: () => '');
      // print("Check $check");
      if (check != '') {
        triggers.removeAt(0);
        triggers.insert(0, firstrigger);
        istriger = firstrigger;
      } else {
        triggers.insert(0, firstrigger);
        istriger = firstrigger;
        // log("Add new");
      }
      // istriger = firstrigger;
      notifyListeners();
    } catch (e) {
      chnagetrigger(null);
      notifyListeners();
    }
  }

  void changemodel(val) {
    mode = val;
    //addval();
    notifyListeners();
  }

  TextEditingController othermedicationcontroller = TextEditingController();
  void chnagedateTime(DateTime date) {
    medicatiopndate = date;
    notifyListeners();
  }

  void addnewtriggers(val) {
    triggers.add(val);
    notifyListeners();
  }

  void chnagetrigger(val) {
    istriger = val;
    notifyListeners();
  }

  void chnagemedicne(val) {
    selectedMedicine = val;
    notifyListeners();
  }

  List<PendingNotificationRequest> list = [];

  Future<void> fethcmedications() async {
    var today = DateTime.now();
    list.clear();
    notifyListeners();

    List<PendingNotificationRequest> list2 =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    //  List<ActiveNotification> list3 =
    //     await flutterLocalNotificationsPlugin.getActiveNotifications();

//print("Active"+ list3.map((h)=>"${h.id}  ${h.body} ${h.payload}").toList().toString());

    if (list2.isNotEmpty) {
      List<PendingNotificationRequest> validNotifications = [];

      for (var ele in list2) {
        var data = DateTime.parse(ele.payload.toString().split("+")[0]);

        if (data.isBefore(today)) {
          await flutterLocalNotificationsPlugin.cancel(ele.id);
        } else {
          validNotifications.add(ele);
        }
      }

      list = validNotifications;
    }

    notifyListeners();
  }

  Future<void> clearnotifocations() async {
    await flutterLocalNotificationsPlugin.cancelAll().whenComplete(() {
      fethcmedications();
    });
  }

  int checkindex() {
    if (list.isEmpty) {
      return 0;
    } else {
      var chek = list.last.id;
      chek = chek + 1;
      return chek;
    }
  }

  void triggerreste() {
    triggers = [
      'Does not repeat',
      'Every day',
      'Every week',
      'Every fortnightly',
      'Every month',
      'Every year'
    ];
    // print("Triggers"+triggers.length.toString());
    notifyListeners();
  }

  void resedata() {
    selectedMedicine = null;
    medicatiopndate = DateTime.now();
    othermedicationcontroller.clear();
    triggerreste();
    istriger = 'Does not repeat';
    interval = 1;
    mode = "Day";
    listinterval = List.generate(99, (i) => i + 1);
    notifyListeners();
  }

  Future<bool> doesNotificationExist(int? notificationId) async {
    if (notificationId == null) {
      return false;
    } else {
      List<PendingNotificationRequest> pendingNotifications =
          await flutterLocalNotificationsPlugin.pendingNotificationRequests();

      return pendingNotifications
          .any((notification) => notification.id == notificationId);
    }
  }

  Future<void> editreminder(context, {id}) async {
    bool exists = await doesNotificationExist(id);
    if (exists) {
      await flutterLocalNotificationsPlugin.cancel(id).whenComplete(() {
        addreminder(context);
      });
    } else {
      addreminder(context);
    }
  }

  Future<void> checkscedhulerepeat(context, {id}) async {
    bool exists = await doesNotificationExist(id);
    if (exists) {
      await flutterLocalNotificationsPlugin.cancel(id).whenComplete(() {
        schedulerepeatNextNotification(
                id: checkindex(),
                interval: interval,
                unit: mode,
                date: medicatiopndate,
                body: selectedMedicine == "Other"
                    ? othermedicationcontroller.text
                    : selectedMedicine)
            .whenComplete(() {
          fethcmedications();
          resedata();
          Navigator.pop(context);
        });
      });
    } else {
      schedulerepeatNextNotification(
              id: checkindex(),
              interval: interval,
              unit: mode,
              date: medicatiopndate,
              body: selectedMedicine == "Other"
                  ? othermedicationcontroller.text
                  : selectedMedicine)
          .whenComplete(() {
        fethcmedications();
        resedata();
        Navigator.pop(context);
      });
    }
  }

  void addreminder(context) {
    showcustomenotification(
            trigger: istriger,
            id: checkindex(),
            title: "Medictaion Reminder",
            date: medicatiopndate,
            body: selectedMedicine == "Other"
                ? othermedicationcontroller.text
                : selectedMedicine)
        .whenComplete(() {
      fethcmedications();
      resedata();
      Navigator.pop(context);
    });

    // if (istriger == "Daily") {
    //   log("Daily");
    //   scheduleDailyNotification(
    //           id: checkindex(),
    //           title: "Medictaion Reminder",
    //           date: medicatiopndate,
    //           body: selectedMedicine == "Other"
    //               ? othermedicationcontroller.text
    //               : selectedMedicine)
    //       .whenComplete(() {
    //     fethcmedications();
    //     resedata();
    //     Navigator.pop(context);
    //   });
    // } else if (istriger == "Weekly") {
    //   log("Weekly");
    //   scheduleDailyNotificationweekly(
    //           id: checkindex(),
    //           title: "Medictaion Reminder",
    //           date: medicatiopndate,
    //           body: selectedMedicine == "Other"
    //               ? othermedicationcontroller.text
    //               : selectedMedicine)
    //       .whenComplete(() {
    //     fethcmedications();
    //     resedata();
    //     Navigator.pop(context);
    //   });
    // } else {
    //   log("Ring Once");
    //   scheduleNotificationringonce(
    //           id: checkindex(),
    //           title: "Medictaion Reminder",
    //           date: medicatiopndate,
    //           body: selectedMedicine == "Other"
    //               ? othermedicationcontroller.text
    //               : selectedMedicine)
    //       .whenComplete(() {
    //     fethcmedications();
    //     resedata();
    //     Navigator.pop(context);
    //   });
    // }
  }

  Medication medication = Medication.fromJson({"medicationId": 0});
  void assignmedication(Medication med) {
    medication = med;
    notifyListeners();
  }

  var userid;
  void changeusrrid(id) {
    userid = id;
    notifyListeners();
  }

  void resetmedication() {
    medication = Medication.fromJson({"medicationId": 0});
    userid = null;
    notifyListeners();
  }

  bool savemedicationload = false;
  Future<void> savemedication({mjson}) async {
    try {
      savemedicationload = true;
      notifyListeners();
      await postmethod(endpoint: "Medication/Save", body: mjson);
      savemedicationload = false;
      notifyListeners();
    } catch (e) {
      savemedicationload = false;
      notifyListeners();
    }
  }

  bool medicationload = false;
  Future<void> getmedications({id}) async {
    try {
      medicationlist.clear();
      medicationload = true;
      notifyListeners();
      final res =
          await postmethod(endpoint: "Medication/GetById", body: {"id": id});
      //log("Id$id");
      if (res != null) {
        List list = res;
        medicationlist = list.map((y) => Medication.fromJson(y)).toList();
        notifyListeners();
      }
      medicationload = false;
      notifyListeners();
    } catch (e) {
      medicationload = false;
      notifyListeners();
    }
  }
}
