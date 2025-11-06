// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:XLcarez/env/appexports.dart';
import 'package:image_picker/image_picker.dart';

class Foodsearchscreen extends StatefulWidget {
  const Foodsearchscreen({super.key});

  @override
  State<Foodsearchscreen> createState() => _FoodsearchscreenState();
}

class _FoodsearchscreenState extends State<Foodsearchscreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<FoodSearchController>(context, listen: false).resetlist();
      Provider.of<FoodSearchController>(context, listen: false)
          .foodcontroller
          .clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Scaffold(
        appBar: Themeappbar(
          title: "${fetchlocale(context).add} ${fetchlocale(context).foodlog}",
          leading: true,
          centtile: true,
        ),
        body: Consumer3<FoodSearchController, Authcontroller,Localizationcontroller>(
            builder: (context, ctrl, file,loc,child) {
          return ctrl.isload || ctrl.imageloading
              ? loader()
              : SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: fillcor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Appscalemedia(
                                    child: TextField(
                                      controller: ctrl.foodcontroller,
                                      decoration:  InputDecoration(
                                          fillColor: fillcor,
                                          contentPadding: const EdgeInsets.all(10),
                                          filled: true,
                                          hintText: fetchlocale(context).serachfood,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              appspace(w: 5),
                              RotatedBox(
                                quarterTurns: 2,
                                child: GestureDetector(
                                  onTap: ()async{
                                    ctrl.foodpick(source: ImageSource.camera,lanughe: await loc.fetchlanguage());
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: const RotatedBox(
                                      quarterTurns: 2,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: fillcor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              appspace(w: 5),
                              GestureDetector(
                                onTap: ()async{
                                  ctrl.foodpick(source: ImageSource.gallery,lanughe: await loc.fetchlanguage());
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: const Icon(
                                    Icons.image,
                                    color: fillcor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: genratemediaquery(context).size.width,
                            child: fillButton(context,
                                load: false, title: fetchlocale(context).searche, onTap: ()async {
                              if (ctrl.foodcontroller.text.isNotEmpty) {
                                ctrl.getcaloriesbyimage(
                                    type: true,
                                    endpoint: "text_to_calorie",
                                    payload: {
                                      "input": ctrl.foodcontroller.text,
                                      "language": await loc.fetchlanguage()
                                    });
                              } else {
                                ctrl.resetlist();
                                ctrl.foodcontroller.clear();
                                ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                        content: Apptextwidget(
                                            fetchlocale(context).enter_fooditem)));
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //To log your food intake accurately, you can either manually enter the food items along with specific details or upload a food image. For manual entry, provide clear information such as the quantity and type of food consumed. For example, you can type 2 slices of bread with 100g vegetable curry to receive precise nutritional insights. Alternatively, you can upload a clear image of your meal using the options provided above. Our system will analyze the input and calculate the nutritional values based on your entries. Ensure accuracy in your details to get the best results for tracking and managing your dietary habits effectively.
                          Apptextwidget(
                              ctrl.foodimage == null && ctrl.fooddata == null
                                  ? fetchlocale(context).instructionsfoodlog
                                  : fetchlocale(context).nutritioninforamtion,
                              style: TxtStls.wstl16),
                          const SizedBox(
                            height: 10,
                          ),
                          Visibility(
                              visible: ctrl.foodimage == null &&
                                  ctrl.fooddata == null,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Apptextwidget(
                                        fetchlocale(context).manualentry,
                                        style: TxtStls.stl14,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).entermanfood,
                                        style: TxtStls.stl13,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).exampleman,
                                        style: TxtStls.stl13,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).fooduploadimage,
                                        style: TxtStls.stl14,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).optionsuploadfood,
                                        style: TxtStls.stl13,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).systemanalyze,
                                        style: TxtStls.stl13,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).accurateres,
                                        style: TxtStls.stl14,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).providespecific,
                                        style: TxtStls.stl13,
                                      ),
                                      Apptextwidget(
                                       fetchlocale(context).aviodgenric,
                                        style: TxtStls.stl13,
                                      ),
                                      Apptextwidget(
                                      fetchlocale(context).whyitmater,
                                        style: TxtStls.stl14,
                                      ),
                                      Apptextwidget(
                                       fetchlocale(context).accuratefood,
                                        style: TxtStls.stl13,
                                      ),
                                      Apptextwidget(
                                        fetchlocale(context).byfol,
                                        style: TxtStls.stl13,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          _buildimagewidget(),
                        ],
                      ),
                    ),
                  ),
                );
        }),
        bottomNavigationBar: bottomContainer(
          child: _buildbutton(),
        ),
      ),
    );
  }

  Consumer<FoodSearchController> _buildimagewidget() {
    return Consumer<FoodSearchController>(builder: (_, ctrl, child) {
      return ctrl.foodresult != null
          ? Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ctrl.foodimage != null
                        ? Container(
                            clipBehavior: Clip.hardEdge,
                            height: checkscreenwidth(genratemediaquery(context).size.width)=="Large"?genratemediaquery(context).size.height/1.5:genratemediaquery(context).size.height/2.5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: MemoryImage(
                                        base64Decode(ctrl.foodimage!)))),
                          )
                        : const SizedBox.shrink(),
                    Visibility(
                      visible: ctrl.foodimage != null,
                      child: const SizedBox(
                        height: 10,
                      ),
                    ),
                    Apptextwidget(
                      //ctrl.fooddata ?? "",
                      ctrl.fooddata == fetchlocale(context).invalidinput
                          ? fetchlocale(context).notreleatedtofood
                          : ctrl.fooddata ?? "",
                      style: TxtStls.stl15,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Apptextwidget(
                          fetchlocale(context).energee,
                          style: TxtStls.stl16,
                        ),
                        Apptextwidget(
                          "${ctrl.foodresult?["total_calories"] ?? "0.0"} ${fetchlocale(context).kcal}",
                          style: TxtStls.stl16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink();
    });
  }

  Consumer2<FoodSearchController, Authcontroller> _buildbutton() {
    return Consumer2<FoodSearchController, Authcontroller>(
        builder: (context, ctrl, auth, child) {
      return GestureDetector(
        onTap: () async {
          //log(ctrl.foodresult.toString());
          if (ctrl.foodresult?["food_item"] != null &&
              ctrl.foodresult?["total_calories"] != "" &&
              ctrl.fooddata != "Invalid input") {
            var item = {
              "id": "0",
              "userId": (await auth.fethuserid()).toString(),
              "itemName": ctrl.foodresult != null
                  ? ctrl.foodresult!["food_item"].toString()
                  : ctrl.foodcontroller.text,
              "nutritionInfo": ctrl.fooddata,
              "addedBy": (await auth.fethuserid()).toString(),
              "Calorie": ctrl.foodresult != null
                  ? ctrl.foodresult!["total_calories"].toString()
                  : "0.0",
            };
            //log(item.toString());
            ctrl
                .savefoodlog(
              file: ctrl.foodimageresult?.path,
              context,
              payloda: item,
            )
                .whenComplete(() async {
              ctrl.foodcontroller.clear();
              ctrl.resetlist();
              ctrl.getall(id: await auth.fethuserid());
              Navigator.pop(context);
            });
          } else {
            Fluttertoast.showToast(
                msg: ctrl.foodimageresult == null
                    ? fetchlocale(context).enter_fooditem
                    : fetchlocale(context).pleasechecktheimage);
          }
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Apptextwidget(
            fetchlocale(context).iatethis,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          )),
        ),
      );
    });
  }
}
