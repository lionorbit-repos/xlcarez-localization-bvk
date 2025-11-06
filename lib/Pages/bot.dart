// ignore_for_file: deprecated_member_use

import 'package:XLcarez/env/appexports.dart';

class Bot extends StatefulWidget {
  const Bot({super.key});

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {
  @override
  void initState() {
    final botcontroller = Provider.of<Botcontroller>(context, listen: false);
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      botcontroller.reset();
      botcontroller.fetchsymptoms();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Scaffold(
       //backgroundColor: Colors.white,
        appBar: Themeappbar(title: "Bot",leading: true,),
        body: SafeArea(
            child: SizedBox(
          height: size.height,
          width: size.width,
          child: Consumer<Botcontroller>(builder: (_, ctrl, child) {
            return ctrl.symptomsload
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    controller: ctrl.scrollController,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: ctrl.botlist.length,
                    itemBuilder: (_, i) {
                      final data = ctrl.botlist[i];
                      return botwidget(data, i);
                    });
          }),
        )),
      ),
    );
  }

  Widget botwidget(Botmodel botmodel, index) {
    return Consumer<Botcontroller>(builder: (context, botctrl, child) {
      return Align(
        alignment: botmodel.isbot != null
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          width: 300,
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: botmodel.isbot != null
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: SizedBox(
                      height: 40,
                      width: 60,
                      child: botmodel.isbot != null
                          ? Lottie.asset("assets/mxk3H9GBpj.json")
                          : Image.asset(avtharimage))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  elevation: 5,
                  child: index == botctrl.loadindex && botctrl.questionload
                      ? const CircularProgressIndicator()
                      : botmodel.checkout != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "DIAGNOSIS:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    botmodel.checkout["DIAGNOSIS"] ?? "",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Medical_Department:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    botmodel.checkout["Medical_Department"] ??
                                        "",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "SELF_CARE:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    botmodel.checkout["SELF_CARE"] ?? "",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.lightBlueAccent),
                                      onPressed: () {
                                        botctrl.reset();
                                        botctrl.fetchsymptoms();
                                      },
                                      child: const Text("Reset"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Center(
                                        child: Text(
                                      botmodel.heading ?? "",
                                      style: const TextStyle(fontSize: 18),
                                    )),
                                  ),
                                  //const SizedBox(height: 10,),
                                  botmodel.data != null
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: botmodel.data!.length,
                                          itemBuilder: (_, i) {
                                            final data = botmodel.data![i];
                                            return InkWell(
                                              onTap: () {
                                                botctrl.chnagesymtom(
                                                    val: data.indicators);
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 10),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: data.indicators ==
                                                            botctrl.syptomselect
                                                        ? Colors.lightBlueAccent
                                                        : Colors.transparent,
                                                    border: Border.all(
                                                        color: data.indicators ==
                                                                botctrl
                                                                    .syptomselect
                                                            ? Colors.transparent
                                                            : Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Text(
                                                  data.indicators ?? "",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          botctrl.syptomselect ==
                                                                  data.indicators
                                                              ? Colors.white
                                                              : Colors.black),
                                                ),
                                              ),
                                            );
                                          })
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            botmodel.message != null
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      botmodel.message ?? "",
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            botmodel.actions != null
                                                ? ButtonBar(
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .lightBlueAccent),
                                                          onPressed:
                                                              botmodel.actions !=
                                                                      "No"
                                                                  ? () {
                                                                      if (botmodel
                                                                              .actions ==
                                                                          "Yes") {
                                                                      } else {
                                                                        botctrl.triggeraction(
                                                                            index:
                                                                                index,
                                                                            data:
                                                                                botmodel.message,
                                                                            action: "Yes");
                                                                      }
                                                                    }
                                                                  : null,
                                                          child: const Text(
                                                              "Yes")),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .lightBlueAccent),
                                                          onPressed:
                                                              botmodel.actions !=
                                                                      "Yes"
                                                                  ? () {
                                                                      if (botmodel
                                                                              .actions ==
                                                                          "No") {
                                                                      } else {
                                                                        botctrl.triggeraction(
                                                                            index:
                                                                                index,
                                                                            data:
                                                                                botmodel.message,
                                                                            action: "No");
                                                                      }
                                                                    }
                                                                  : null,
                                                          child:
                                                              const Text("No")),
                                                    ],
                                                  )
                                                : const SizedBox.shrink(),
                                          ],
                                        ),
                                ],
                              ),
                            )),
            ],
          ),
        ),
      );
    });
  }
}

/*

*/
