// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:XLcarez/env/appexports.dart';
import 'package:XLcarez/env/avtharglow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class BotchatView extends StatefulWidget {
  const BotchatView({super.key});

  @override
  State<BotchatView> createState() => _BotchatViewState();
}

class _BotchatViewState extends State<BotchatView> {
  FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    final botcontroller = Provider.of<Botcontroller>(context, listen: false);
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      botcontroller.reset();
      //botcontroller.fetchsymptoms();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Consumer2<Authcontroller, Botcontroller>(
          builder: (context, auth, ctrl, child) {
        return Scaffold(
          //backgroundColor: Colors.white,
          appBar: Themeappbar(
            title: "Chat Bot",
            leading: true,
          ),
          body: SafeArea(
              child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: ctrl.botchatlist.length,
                      itemBuilder: (_, i) {
                        final data = ctrl.botchatlist[i];
                        return botwidget(data, i);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: AvatarGlow(
                      animate: ctrl.listening,
                      glowColor: primary,
                      child: IconButton(
                          onPressed: () {
                            ctrl.listen();
                          },
                          icon: const Icon(
                            Icons.mic,
                            color: scaffoldbgcol,
                          ))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          focusNode: focusNode,
                          onTapOutside: (val) {
                            focusNode.unfocus();
                          },
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          controller: ctrl.messageController,
                          onChanged: (val) {
                            //log(val.toString());
                            if (val.toString().trim().isEmpty) {
                              ctrl.messageController.clear();
                            } else {
                              ctrl.messageController.text = val;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: fetchlocale(context).querymsg,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      appspace(w: 10),
                      CircleAvatar(
                        backgroundColor: scaffoldbgcol,
                        child: IconButton(
                          onPressed: () {
                            ctrl.filepick(auth.userData?["userId"]);
                          },
                          icon: const Icon(Icons.attach_file),
                          color: primary,
                        ),
                      ),
                      appspace(w: 10),
                      CircleAvatar(
                        backgroundColor: scaffoldbgcol,
                        child: IconButton(
                          onPressed: () {
                            if (ctrl.messageController.text.isNotEmpty) {
                              focusNode.unfocus();
                              // var mjson = {
                              //   "input": ctrl.messageController.text,
                              //   "user": "${auth.userData?["userId"]}"
                              // };
                              var chathistory = ctrl.botchatlist
                                  .where((ele) => ele.message != null)
                                  .map((l) => filterparms(l))
                                  .toList();
                              log(chathistory.toString());
                              var mjson = {
                                "is_document": false,
                                "user_query": ctrl.messageController.text,
                                "user_id": "${auth.userData?["userId"]}",
                                "chat_history":ctrl.botchatlist.where((ele)=>ele.message!=null).map((j)=>j.message.toString()).toList(),
                                //"chat_history":ctrl.botchatlist.where((ele)=>ele.message!=null).map((l)=>{"Bot-Ana":l.isbot==true?l.message:"","user":l.isbot==null?l.message:""}).toList(),
                                //"chat_history": ctrl.botchatlist.where((ele)=>ele.message!=null).map((l)=>{"Bot-Ana":l.isbot==true?l.message:"","user":l.isbot==null?l.message:""}).toList().toString(),
                              };
                              ctrl.tooglelistening();
                              ctrl.addmanulachat(
                                  message: ctrl.messageController.text);
                              ctrl
                                  .chatbotquery(
                                mjson,
                              )
                                  .whenComplete(() {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent
                                        .toDouble(),
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeOut,
                                  );
                                });
                                ctrl.messageController.clear();
                                focusNode.unfocus();
                              });
                            }
                          },
                          icon: const Icon(Icons.send),
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        );
      }),
    );
  }

  Map<String, String?> filterparms(Botchat chat) {
    if (chat.isbot != null) {
      return {"Bot-Ana": chat.message};
    } else {
      return {'user': chat.message};
    }
  }

  Widget botwidget(Botchat botmodel, index) {
    return Consumer3<Botcontroller, Authcontroller, Localizationcontroller>(
        builder: (context, botctrl, authCtrl, loc, child) {
      return Align(
        alignment: botmodel.isbot != null
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: IntrinsicWidth(
          child: Container(
            //width: botmodel.isbot != null ? 300 : 150,
            // margin: const EdgeInsets.only(bottom:),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: botmodel.isbot != null
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              mainAxisAlignment: botmodel.isbot != null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                botmodel.isbot != null
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                            backgroundColor: scaffoldbgcol,
                            child: Lottie.asset("assets/mxk3H9GBpj.json")))
                    : networkImages(
                        url: authCtrl.userData?["image"] == "" ||
                                authCtrl.userData?["image"] == null
                            ? avtharimg
                            : "${asseturl}Users/${authCtrl.userData?["image"]}",
                        size: 20.0),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        index == botctrl.botchatlist.length - 1 &&
                                (botctrl.userchatload || botctrl.fileuploading)
                            ? const CircularProgressIndicator()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: messagewidget(botmodel),
                                // child: Apptextwidget(index == 0
                                //     ? fetchlocale(context).greetings
                                //     : botmodel.message ?? ""),
                              ),
                        Visibility(
                          visible: botmodel.message != null,
                          child: IconButton(
                              onPressed: () {
                                botctrl.speack(
                                    languge: loc.locale,
                                    text: index == 0
                                        ? fetchlocale(context).greetings
                                        : botmodel.message ?? "");
                              },
                              icon: const Icon(Icons.volume_up)),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget messagewidget(Botchat model) {
  if (model.message != null) {
    return Apptextwidget(model.message ?? "");
  } else if (model.ext == "Image") {
    return SizedBox(
      height: 150.0,
      child: CachedNetworkImage(
        imageUrl: "${asseturl}Docs/${model.image}",
      ),
    );
  } else if (model.ext == "pdf") {
    return SizedBox(
        height: 150.0,
        width: 150.0,
        child: const PDF().cachedFromUrl(
          "${asseturl}Docs/${model.image}",
          placeholder: (progress) =>
              Center(child: Apptextwidget('$progress %')),
          errorWidget: (error) => const Center(child: Nodatafound()),
        ));
  } else {
    return const SizedBox.shrink();
  }
}
