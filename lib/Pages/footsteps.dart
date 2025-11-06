// import 'package:XLcarez/env/appexports.dart';

// class FootstepTrack extends StatefulWidget {
//   const FootstepTrack({super.key});

//   @override
//   State<FootstepTrack> createState() => _FootstepTrackState();
// }

// class _FootstepTrackState extends State<FootstepTrack> {
//   @override
//   void initState() {
//     final controller = Provider.of<FootstepController>(context, listen: false);
//     final auth = Provider.of<Authcontroller>(context, listen: false);
//     WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
//       if (!mounted) return;
//       controller.checkAndRequestPermissions(auth);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FootstepController>(builder: (context, footctrl, child) {
//       return GestureDetector(
//         onTap: (){
//          // print("ghg");
//           navigationSlide(context,  const Steplist());
//         },
//         child: dashboardcard(
//             url: "assets/calorie.png",
//             title: fetchlocale(context).stepcount,
//             value:footctrl.apisteps==0?"${footctrl.footsteplist.isNotEmpty?footctrl.footsteplist[0]["stepCount"]:"0"}":footctrl.apisteps,
//             //footctrl.apisteps!="-"?footctrl.formatNumber(double.parse(footctrl.apisteps)):"",
//             extra: ""),
//       );
//     });
//   }
// }

