// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:XLcarez/env/appexports.dart';
import 'package:http/io_client.dart';
import 'package:image_picker/image_picker.dart';

class FoodSearchController extends ChangeNotifier {
  TextEditingController foodcontroller = TextEditingController();
  DateTime datetime = DateTime.now();
// final baseurl = "https://healthbergapi.lionorbit.com/api/";
  bool isload = false;
  // List<NutrientForm> _list = [];
  // List<NutrientForm> get nutrientlist => _list;
  // getfoodnutrient({query}) async {
  //   try {
  //     isload = true;
  //     resetlist();
  //     notifyListeners();
  //     //log("start");
  //     final request = Uri.parse(
  //         "https://api.nal.usda.gov/fdc/v1/foods/search?query=$query&dataType=Branded&pageSize=1&pageNumber=1&api_key=jVCuko1XAhSZhF5aBevSh8gHQ3LXCo3OklgQidyF");
  //     final response = await http.get(request);
  //     if (response.statusCode == 200) {
  //       var data = json.decode(response.body);
  //       List list = data["foods"][0]["foodNutrients"] ?? [];
  //       _list = list.map((k) => NutrientForm.fromJson(k)).toList();
  //       notifyListeners();
  //       // log(data["foods"][0]["foodNutrients"].toString());
  //     }
  //     isload = false;
  //     notifyListeners();
  //   } catch (ex) {
  //     log(ex.toString());
  //   }
  //   // log("end");
  // }

  String? foodimage;
  void changefoodimage(val) {
    foodimage = val;
    notifyListeners();
  }

  bool imageloading = false;
  String? fooddata;
  Map<String, dynamic>? foodresult;
  XFile? foodimageresult;
  //calorie_bot
  //{"base64decodedimage": data}
  Future<void> getcaloriesbyimage({type = false, endpoint, payload}) async {
    try {
      log(payload.toString());
      log(endpoint.toString());
      if(type){
       foodimage=null;
      foodimageresult=null;
      }
      imageloading = true;
      fooddata = null;
      foodresult = null;
      notifyListeners();
      final ioc = HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = IOClient(ioc);
      final request =
          Uri.parse("https://baithna.tribandtech.com:3031/$endpoint");
      final response =
          await http.post(request, body: jsonEncode(payload), headers: headers);
      //log(data.toString());
      log(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final extractresponse = json.decode(response.body);
        if (type) {
          //log("Extract$extractresponse");
          fooddata = extractresponse["description"];
          foodresult = {
            "total_calories": extractresponse["Calories"],
            "food_item": extractresponse["food_item"]
          };
          notifyListeners();
          // }
        } else {
          //log("Image");
          final data = extractresponse["response"][0]["message"]["content"];
          final result = extractresponse["result"];
          // log("Food Resukt $result");
          fooddata = data;
          foodresult = result;
          notifyListeners();
        }
        imageloading = false;
        notifyListeners();
      } else {
        imageloading = false;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
      resetlist();
      foodcontroller.clear();
      imageloading = false;
      notifyListeners();
    }
  }

  void chnagedate(DateTime date){
    try {
      datetime = date;
    notifyListeners();
    } catch (e) {
      datetime = DateTime.now();
      notifyListeners();
    }
  }

  void resetlist() {
    fooddata = null;
    foodimage = null;
    foodresult = null;
    foodimageresult = null;
    datetime = DateTime.now();
    // foodcontroller.clear();
    notifyListeners();
  }

  Future<void> foodpick({required ImageSource source,lanughe}) async {
    log("Language $lanughe");
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: source);
    if (xFile != null) {
      imageloading = true;
      // nutrientlist.clear();
      foodcontroller.clear();
      notifyListeners();
      foodimageresult = xFile;
      var bytes = base64Encode(await xFile.readAsBytes().whenComplete(() {
        imageloading = false;
        notifyListeners();
      }));
      changefoodimage(bytes);
      getcaloriesbyimage(
          endpoint: "calorie_bot", payload: {"base64decodedimage": bytes,"language": lanughe});
    }
  }

  void foodchoose(context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 150,
            decoration: BoxDecoration(
                color: bgClr1,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      foodpick(source: ImageSource.camera);
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.camera),
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      foodpick(source: ImageSource.gallery);
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.image),
                    ))
              ],
            ),
          );
        });
  }

  Future<void> savefoodlog(context, {file, payloda}) async {
    try {
      isload = true;
      notifyListeners();
      Uri urlre = Uri.parse("${baseurl}FoodLog/SaveFoodLog");
      http.MultipartRequest request = http.MultipartRequest("POST", urlre);
      var header = await domainheaders();
      request.headers.addAll(header);
      file != null
          ? request.files.add(await http.MultipartFile.fromPath(
              "upload",
              file,
            ))
          : null;
      request.fields.addAll(Map<String, String>.from(payloda));
      http.StreamedResponse response = await request.send();
      var resonstreem = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var extracresponse = json.decode(resonstreem.body);
        log(extracresponse.toString());
        final message = extracresponse["message"];
         final status = extracresponse["status"];
         if(!status){
          Fluttertoast.showToast(msg: message);
         }
      }
    } catch (ex) {
      log(ex.toString());
      isload = false;
      notifyListeners();
    }

    //log("sds");
    //isload = true;
    // notifyListeners();
    // final request = Uri.parse("${baseurl}FoodLog/SaveFoodLog");
    // final response = await http.post(
    //     headers: await domainheaders(), request, body: jsonEncode(payloda));
    // // log(response.body);
    // if (response.statusCode == 200) {
    //   isload = false;
    //   notifyListeners();
    //   Navigator.pop(context);
    // }
    // isload = false;
    // notifyListeners();
    //log("sdsdc");
  }

  var foodcal;
  List<FoodLogModel> foodlist = [];
  Future<void> getall({id}) async {
    //log(id.toString());
    try {
      isload = true;
      foodlist.clear();
      foodcal = "0.0";
      notifyListeners();
      final request = Uri.parse("${baseurl}FoodLog/GetAll");
      final response = await http.post(request,
          headers: await domainheaders(), body: jsonEncode({"id": id}));
      if (response.statusCode == 200) {
        final extractdata = json.decode(response.body);
        List data = extractdata["data"] ?? [];
        foodlist = data.map((e) => FoodLogModel.fromJson(e)).toList();
        foodlist.where((r) => r.userId == id).toList();
        chnagedate(DateTime.tryParse("${foodlist[0].createdDate}Z")??DateTime.now());
        // log(foodlist.map((r)=>r.createdDate .toString()).toList().toString());
        foodcal = summation();
        notifyListeners();
      }
      isload = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      isload = false;
      foodlist = [];
      notifyListeners();
    }
  }

  String summation() {
    if (foodlist.isEmpty) {
      return "0.0";
    } else {
      double sum = 0.0;
      for (var val in foodlist) {
        var calvalue = double.parse(val.calorie ?? "0");
        sum = sum + calvalue;
        //log(sum.toString());
      }
      return sum.toStringAsFixed(2);
    }
  }
}
