import 'package:XLcarez/env/appexports.dart';


class Fooddetailscreen extends StatelessWidget {
  final FoodLogModel model;
  const Fooddetailscreen({super.key, required this.model});
  static GlobalKey screenshotkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
          appBar: Themeappbar(
            title: model.itemName??"",
            leading: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: genratemediaquery(context).size.height / 20),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                    height: genratemediaquery(context).size.height,
                    width: genratemediaquery(context).size.width,
                    padding: EdgeInsets.fromLTRB(
                        15, genratemediaquery(context).size.height / 8, 15, 0),
                    decoration: const BoxDecoration(
                        color: scaffoldbgcol,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Apptextwidget(
                            fetchlocale(context).nutritioninforamtion,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Column(
                            children: [
                              Apptextwidget(model.nutritionInfo ?? ""),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                       Flexible(
                                        child: Apptextwidget(
                                          fetchlocale(context).energee,
                                          style: const TextStyle(
                                              color: Color(0xFF868686),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Flexible(
                                        child: Apptextwidget(
                                          "${model.calorie} ${fetchlocale(context).kcal}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    top: -50,
                    child: Hero(
                        tag: model.itemName.toString(),
                        child: RepaintBoundary(
                          key: screenshotkey,

                          //Image.memory(base64Decode(model.foodImage.toString())),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: scaffoldbgcol,
                            backgroundImage: checkimage(model.foodImage) as ImageProvider?,
                          ),
                        ))),
              ],
            ),
          )),
    );
  }
}

Object checkimage(val) {
  if (val == null) {
    return const AssetImage("assets/foodtrack.png");
  } else {
    return NetworkImage(
        "$asseturl/FoodLog/$val"); //MemoryImage(base64Decode(val));
  }
}
