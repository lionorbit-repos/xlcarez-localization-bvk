// ignore_for_file: use_build_context_synchronously


import 'package:XLcarez/env/appexports.dart';
import 'package:google_fonts/google_fonts.dart';

class Sleepassesment extends StatefulWidget {
  const Sleepassesment({super.key});

  @override
  State<Sleepassesment> createState() => _SleepassesmentState();
}

class _SleepassesmentState extends State<Sleepassesment> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<Assesmentcontroller>(context, listen: false).resetsleep();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Consumer2<Assesmentcontroller, Authcontroller>(
          builder: (context, asctl, auth, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).sleeptitle,
            leading: true,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Apptextwidget(
                      "${fetchlocale(context).sleepheading}😴",
                      style: TxtStls.wstl20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q1,
                        groupValue: asctl.sleep1,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep1(context, val);
                    }),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q2,
                        groupValue: asctl.sleep2,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep2(context, val);
                    }),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q3,
                        groupValue: asctl.sleep3,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep3(context, val);
                    }),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q4,
                        groupValue: asctl.sleep4,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep4(context, val);
                    }),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q5,
                        groupValue: asctl.sleep5,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep5(context, val);
                    }),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q7,
                        groupValue: asctl.sleep6,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep6(context, val);
                    }),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q8,
                        groupValue: asctl.sleep7,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep7(context, val);
                    }),
                    questionAnswerassesment(context,
                        header: fetchlocale(context).sleep_q9,
                        groupValue: asctl.sleep8,
                        list: asctl.answers, onChanged: (val) {
                      asctl.changsleep8(context, val);
                    }),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: bottomContainer(
              child: Container(
            decoration: BoxDecoration(
                color: scaffoldbgcol, borderRadius: BorderRadius.circular(10)),
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Apptextwidget(
                            fetchlocale(context).riskscore,
                            style: TxtStls.stl14,
                          ),
                          Apptextwidget(
                            "${asctl.risckscore} ${fetchlocale(context).daytimesleepness}",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w700,
                                    color: asctl.checkcolur(),
                                    fontFamily: 'Inter')),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Apptextwidget(
                          fetchlocale(context).fatiguetotalscore,
                          style: TxtStls.stl14,
                        ),
                        Apptextwidget(
                          "${asctl.sleepscore} Pts",
                          style: TxtStls.appstyle20,
                        ),
                      ],
                    ),
                  ],
                ),
                fillButton(context,
                    load: asctl.saveloading,
                    title: fetchlocale(context).save, onTap: () async {
                  var sleeppayload = {
                    "sleepId": 0,
                    "userId": await auth.fethuserid(),
                    "sittingandreading": asctl.fetchlable(val: asctl.sleep1),
                    "watchingtv": asctl.fetchlable(val: asctl.sleep2),
                    "sittinginactiveinpublicplace":
                        asctl.fetchlable(val: asctl.sleep3),
                    "passengerinacar": asctl.fetchlable(val: asctl.sleep4),
                    "lyingdown": asctl.fetchlable(val: asctl.sleep5),
                    "sittingandtalkingtosomeone":
                        asctl.fetchlable(val: asctl.sleep6),
                    "sittingquietlyafterlunch":
                        asctl.fetchlable(val: asctl.sleep7),
                    "inacarwhenstoppedintraffic":
                        asctl.fetchlable(val: asctl.sleep8),
                    "sleepscore": asctl.sleepscore.toString(),
                  };
                //  log(sleeppayload.toString());
                  asctl.savedata(context,
                      endpoint: "Question/SaveSleep", payload: sleeppayload);
                })
              ],
            ),
          )),
        );
      }),
    );
  }
}
