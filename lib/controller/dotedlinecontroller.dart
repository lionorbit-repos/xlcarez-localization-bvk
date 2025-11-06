
import 'package:XLcarez/env/appexports.dart';

class Dotedlinecontroller  extends ChangeNotifier {
  final int dashCount = 60; // 60 dashes for each second
  List<Color> dashColors = [];
  Timer? timer;
  int currentDash = 0;
  void init(){
    dashColors = List<Color>.filled(dashCount, Colors.grey);
    notifyListeners();
  }
  void startTimer() {
    dashColors = List<Color>.filled(dashCount, Colors.grey);
      currentDash = 0;
      notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDash < dashCount) {
        dashColors[currentDash] = Colors.blue;
          currentDash++;
          notifyListeners();
      } else {
        timer.cancel(); // Stop the timer after 60 seconds
      }
    });
  }
  void canceltimer(){
    timer?.cancel();
    init();
    notifyListeners();
  }
}