import 'package:XLcarez/env/appexports.dart';

class QuestionaryView extends StatefulWidget {
  const QuestionaryView({super.key});

  @override
  State<QuestionaryView> createState() => _QuestionaryViewState();
}

class _QuestionaryViewState extends State<QuestionaryView> {
  List<String> answers = [
    "Not at all",
    "Several days",
    "More than half the days",
    "Nearly everyday"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Consumer2<ScoreManagementController, Authcontroller>(
          builder: (context, mngCtrl, genral, child) {
        return Scaffold(
          //backgroundColor: bgClr2,
          appBar: Themeappbar(
            title: fetchlocale(context).mentalhealthhquestion,
            leading: true,
            lead: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: scaffoldbgcol,
                ),
                onPressed: () {
                  genral.chnagequestionaremental(iseverse: true);
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
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      questionAnswer(context,
                          header: fetchlocale(context).littleinterest,
                          groupValue: mngCtrl.qus1,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs1(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).fellingdown,
                          groupValue: mngCtrl.qus2,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs2(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).troublefalling,
                          groupValue: mngCtrl.qus3,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs3(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).fellingtired,
                          groupValue: mngCtrl.qus4,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs4(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).poorappetite,
                          groupValue: mngCtrl.qus5,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs5(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).feelingbadabout,
                          groupValue: mngCtrl.qus6,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs6(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).troubleconcentrate,
                          groupValue: mngCtrl.qus7,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs7(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).movingorspeaking,
                          groupValue: mngCtrl.qus8,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs8(value: value);
                      }),
                      const SizedBox(height: 5),
                      questionAnswer(context,
                          header: fetchlocale(context).thoughtsthatyou,
                          groupValue: mngCtrl.qus9,
                          list: answers, onChanged: (value) {
                        mngCtrl.updatequs9(value: value);
                      }),
                      const SizedBox(height: 5)
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              genral.chnagequestionaremental();
              navigationSlideAndRemoveUntil(context, const DisclaimerView(),
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
                  child: Apptextwidget(fetchlocale(context).skipe,
                      style: TxtStls.wstl13)),
            ),
          ),
          bottomNavigationBar: bottomContainer(
            child: fillButton(context,
                load: false, title: fetchlocale(context).next, onTap: () {
              var cardioProperties = [
                mngCtrl.qus1,
                mngCtrl.qus2,
                mngCtrl.qus3,
                mngCtrl.qus4,
                mngCtrl.qus5,
                mngCtrl.qus6,
                mngCtrl.qus7,
                mngCtrl.qus8,
                mngCtrl.qus9,
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
                genral.chnagequestionaremental(iseverse: true);
                //navigationSlide(context, const HIVASESForm());
                navigationSlide(context, const DisclaimerView());
              }
            }),
          ),
        );
      }),
    );
  }
}
