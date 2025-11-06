// ignore_for_file: use_build_context_synchronously
import 'package:XLcarez/env/appexports.dart';

class Fatigueassesment extends StatefulWidget {
  const Fatigueassesment({super.key});

  @override
  State<Fatigueassesment> createState() => _FatigueassesmentState();
}

class _FatigueassesmentState extends State<Fatigueassesment> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<Assesmentcontroller>(context, listen: false).resetfatique();
    });
    super.initState();
  }

  List questions = const [
    "1.My motivation is lower when I am fatigued.",
    "2.Exercise brings on my fatigue.",
    "3.I am easily fatigued.",
    "4.Fatigue interferes with my physical functioning.",
    "5.Fatigue causes frequent problems for me.",
    "6.My fatigue prevents sustained physical functioning.",
    "7.Fatigue interferes with carrying out certain duties and responsibilities.",
    "8.Fatigue is among my three most disabling symptoms.",
    "9.Fatigue interferes with my work, family, or social life."
  ];
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer2<Assesmentcontroller, Authcontroller>(
          builder: (context, ctrl, auth, chuld) {
        return Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).fatiguetitle,
            leading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Container(
                  height: 140,
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              const Color(0XFF721c24).withValues(alpha: 0.2)),
                      color: const Color(0XFF721c24).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning,
                        color: Color(0XFF721c24),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          child: Apptextwidget(
                        "${fetchlocale(context).fatiguewar} ${fetchlocale(context).fatigueaddinfo}",
                        // "Note that you should consult a healthcare \nprofessional if you are suffering from fatigue. Additional assessments may be necessary to determine the severity and impact of fatigue on daily life.",
                        style: TxtStls.warningstyle,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Apptextwidget(
                  fetchlocale(context).fatigueinst,
                  style: TxtStls.wstl14,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (_, i) {
                        return questionAnswerassesment(context,
                            groupValue: ctrl.fetchfatique(i),
                            isfatigue: true,
                            header: ctrl.fetchfatigues(context, i),
                            //questions[i],
                            list: ctrl.fatigueanswers, onChanged: (val) {
                          ctrl.chnagefaigue(val, i);
                        });
                      },
                      separatorBuilder: (_, j) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemCount: 9),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: ctrl.fatiquescore != "",
            child: bottomContainer(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Apptextwidget(
                  fetchlocale(context).fatiguetotalscore,
                  style: TxtStls.stl14,
                ),
                Apptextwidget(
                  "${ctrl.fatiquescore} Pts",
                  style: ctrl.handlevalue(ctrl.fatiquescore)
                      ? TxtStls.errstyle20
                      : TxtStls.appstyle20,
                ),
                RichText(
                    text: TextSpan(
                        text: "${fetchlocale(context).scoreint} ",
                        style: TxtStls.appstyle14,
                        children: [
                      TextSpan(
                          text: "${ctrl.fatiquescore}",
                          style: ctrl.handlevalue(ctrl.fatiquescore)
                              ? TxtStls.errorStl
                              : TxtStls.appstyle14),
                      TextSpan(
                          text:
                              " ${fetchlocale(context).youare} ${ctrl.handlevalue(ctrl.fatiquescore) ? fetchlocale(context).not : ""} ${fetchlocale(context).leveltext}")
                    ])),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: fillButton(context,
                      load: ctrl.saveloading,
                      title: fetchlocale(context).save, onTap: () async {
                    var fatiquepayload = {
                      "fatigueId": 0,
                      "userId": await auth.fethuserid(),
                      "motivationfatigue":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue1),
                      "exercisefatigue":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue2),
                      "easilyfatigued":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue3),
                      "physicalfunctioningfatigue":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue4),
                      "causesfatigue":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue5),
                      "myfatigueprevents":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue6),
                      "fatiguedutiesandresponsibilities":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue7),
                      "fatiguesymtoms":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue8),
                      "fatiguesocial":
                          ctrl.fetchfatiguelabel(val: ctrl.fatigue9),
                      "fatiguescore": ctrl.fatiquescore.toString(),
                    };
                  //  log(fatiquepayload.toString());
                     ctrl.savedata(context,endpoint: "Question/SaveFatigue",payload: fatiquepayload);
                  }),
                )
                //Apptextwidget("According to your score of "${ctrl.fatiquescore}" you are "${double.parse(ctrl.fatiquescore).round()<=3.9?"not":""}" experiencing clinically significant fatigue level.",style: TxtStls.appstyle14,)
              ],
            )),
          ),
        );
      }),
    );
  }
}
