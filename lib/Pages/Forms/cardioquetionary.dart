import 'package:XLcarez/env/appexports.dart';

class CardioQuestionary extends StatefulWidget {
  const CardioQuestionary({super.key});

  @override
  State<CardioQuestionary> createState() => _CardioQuestionaryState();
}

class _CardioQuestionaryState extends State<CardioQuestionary> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Consumer2<ScoreManagementController, Authcontroller>(
          builder: (context, mngCtrl, genral, child) {
        return Scaffold(
          // backgroundColor: bgClr2,
          appBar: Themeappbar(
            title: fetchlocale(context).cardiovasculariskquestio,
            leading: true,
            lead: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: scaffoldbgcol,
                ),
                onPressed: () {
                  genral.chnagequestionarecardio(iseverse: true);
                  Navigator.pop(context);
                }),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(15),
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      questionAnswer(context,
                          header: fetchlocale(context).areyoufacing,
                          groupValue: mngCtrl.cardio1,
                          list: ["Yes", "No"], onChanged: (value) {
                        mngCtrl.updateCardio1(value: value);
                      }),
                      const SizedBox(height: 15),
                      questionAnswer(context,
                          header: fetchlocale(context).doyoudrinking,
                          groupValue: mngCtrl.cardio2,
                          list: ["Yes", "No"], onChanged: (value) {
                        mngCtrl.updateCardio2(value: value);
                      }),
                     // const SizedBox(height: 15),
                      const SizedBox(height: 15),
                      questionAnswer(context,
                          header: fetchlocale(context).doyouanylong,
                          groupValue: mngCtrl.cardio4,
                          list: ["Yes", "No"], onChanged: (value) {
                        mngCtrl.updateCardio4(value: value);
                      }),
                      const SizedBox(height: 15),
                      questionAnswer(context,
                          header: fetchlocale(context).regularmedicines,
                          groupValue: mngCtrl.cardio5,
                          list: ["Yes", "No"], onChanged: (value) {
                        mngCtrl.updateCardio5(value: value);
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              genral.chnagequestionarecardio();
              navigationSlideAndRemoveUntil(context, const QuestionaryView(),
                  isroute: true);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, right: 10),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: primary,
                  border: Border.all(color: primary, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Apptextwidget(
                fetchlocale(context).skipe,
                style: TxtStls.wstl13,
              )),
            ),
          ),
          bottomNavigationBar: bottomContainer(
            child: fillButton(context,
                load: false, title: fetchlocale(context).next, onTap: () {
              var cardioProperties = [
                mngCtrl.cardio1,
                mngCtrl.cardio2,
                mngCtrl.cardio3,
                mngCtrl.cardio4,
                mngCtrl.cardio5,
              ];

              bool allFilled = true;
              for (var cardio in cardioProperties) {
                if (cardio == null) {
                  Fluttertoast.showToast(
                      msg: fetchlocale(context).pleaseanswerallquestions,
                      toastLength: Toast.LENGTH_SHORT,
                      textColor: Colors.white);
                  allFilled = false;
                  break;
                }
              }
              if (allFilled) {
                genral.chnagequestionarecardio(iseverse: true);
                navigationSlide(context, const QuestionaryView());
              }
            }),
          ),
        );
      }),
    );
  }
}
