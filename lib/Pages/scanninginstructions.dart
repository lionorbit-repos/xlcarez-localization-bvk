// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';

class ScanningInstructionView extends StatefulWidget {
  const ScanningInstructionView({super.key});

  @override
  State<ScanningInstructionView> createState() =>
      _ScanningInstructionViewState();
}

class _ScanningInstructionViewState extends State<ScanningInstructionView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Scaffold(
        //backgroundColor: bgClr2,
        appBar: Themeappbar(
          title: fetchlocale(context).scaninginstructions,
          leading: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          height: size.height,
          width: size.width,
          color: Colors.white,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/Scaninstructionpage2.png"))),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  //  height: MediaQuery.of(context).size.height / 2.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.blue)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          fetchlocale(context).dos,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      myscantextwidget(
                          text: fetchlocale(context).ensurethelightis,
                          Color: Colors.green),
                      myscantextwidget(
                          text: fetchlocale(context).avoidbrightlight,
                          Color: Colors.green),
                      myscantextwidget(
                          text: fetchlocale(context).positionyourselfina,
                          Color: Colors.green),
                      myscantextwidget(
                          text: fetchlocale(context).keepyourfaceclearly,
                          Color: Colors.green),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          fetchlocale(context).donts,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      myscantextwidget(
                          icon: Icons.cancel,
                          text: fetchlocale(context).avoidscanning,
                          Color: Colors.red),
                      myscantextwidget(
                          icon: Icons.cancel,
                          text: fetchlocale(context).avoidextreame,
                          Color: Colors.red),
                      myscantextwidget(
                          icon: Icons.cancel,
                          text: fetchlocale(context).donotmoveexcessivelyduring,
                          Color: Colors.red),
                    ],
                  ),
                )
              ],
            ),
          ),
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/scan_instruction.png"))),
        ),
        bottomNavigationBar: bottomContainer(
            child: fillButton(context,
                load: false,
                title: fetchlocale(context).procede, onTap: ()async{
           // navigationSlide(context, const MeasurementScreen(), x: 0.0, y: 1.0);
          final ctr = Provider.of<MeasurementModel>(context, listen: false);
          await ctr.checksesstion().whenComplete(() {
            navigationSlide(context, const MeasurementScreen(), x: 0.0, y: 1.0);
          });
        })),
      ),
    );
  }
}

Widget myscantextwidget({
  icon = Icons.check_circle,
  text,
  Color = Colors.green,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon, size: 25, color: Color),
      const SizedBox(width: 5),
      Flexible(
        child: Apptextwidget(
          text,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    ],
  );
}
