import 'dart:convert';
import 'dart:developer';
import 'package:XLcarez/env/appexports.dart';
import 'package:http/http.dart' as http;

Future postmethod({totalres = false, endpoint, body, header}) async {
  try {
    Uri url = Uri.parse("$baseurl$endpoint");
    final response = await http.post(url,
        body: jsonEncode(body), headers: header ?? await domainheaders());
    if (endpoint == "Pedometer/Save") {
      log(response.body);
    }

    if (response.statusCode == 200) {
      final extractres = json.decode(response.body);
      if (endpoint != "Pedometer/Save"&&endpoint!="User/UpdateUserScansLimitBycouponCode") {
        extractres["status"] == false
            ? Fluttertoast.showToast(
                msg: extractres["message"] ==
                        "Your account is inactive, Please contact Administrator."
                    ? "Your account is Deleted, Please contact Administrator."
                    : "${extractres["message"]}",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: extractres["status"] ? success : errorClr)
            : null;
      }

      return totalres
          ? extractres
          : extractres["status"]
              ? extractres["data"]
              : null;
    } else {
      final extractres = json.decode(response.body);
      if (endpoint != "Pedometer/Save"&&endpoint!="User/UpdateUserScansLimitBycouponCode") {
        extractres["status"] == false
            ? Fluttertoast.showToast(
                msg: extractres["message"] ==
                        "Your account is inactive, Please contact Administrator."
                    ? "Your account is Deleted, Please contact Administrator."
                    : "${extractres["message"]}",
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                backgroundColor: extractres["status"] ? success : errorClr)
            : null;
      }
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}

Future calpostmethod({totalres = false, endpoint, body, header}) async {
  try {
    Uri url = Uri.parse("https://bluhealthapi.lionorbit.com/api/$endpoint");
    final response = await http.post(url,
        body: jsonEncode(body), headers: header ?? await domainheaders());
    log(response.body);
    if (response.statusCode == 200) {
      final extractres = json.decode(response.body);
      extractres["status"] == false
          ? Fluttertoast.showToast(
              msg: extractres["message"],
              toastLength: Toast.LENGTH_SHORT,
              textColor: Colors.white,
              backgroundColor: extractres["status"] ? success : errorClr)
          : null;
      return totalres
          ? extractres
          : extractres["status"]
              ? extractres["data"]
              : null;
    } else {
      final extractres = json.decode(response.body);
      Fluttertoast.showToast(
          msg: extractres["message"],
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: extractres["status"] ? success : errorClr);
    }
  } catch (e) {
    // log(e.toString());
    return null;
  }
}

Future getmetod({totalres = false, endpoint, header}) async {
  try {
    Uri url = Uri.parse("$baseurl$endpoint");
    final response =
        await http.get(url, headers: header ?? await domainheaders());
    if (response.statusCode == 200) {
      final extractres = json.decode(response.body);
      return totalres
          ? extractres
          : extractres["status"]
              ? extractres["data"]
              : null;
    } else {
      final extractres = json.decode(response.body);
      Fluttertoast.showToast(
          msg: extractres["message"],
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: errorClr);
    }
  } catch (e) {
    return null;
  }
}

const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  "Access-Control-Allow-Origin": "*",
};

Future<Map<String, String>> domainheaders() async {
  var box = await Hive.openBox('XLcarezstore');
  final token = box.get('token');
  // SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
  //final token = await sharedPreferences.getString("token");
  //print(token);
  return {
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json, text/plain, */*',
    "Access-Control-Allow-Origin": "*",
    'Authorization': 'Bearer $token',
  };
}
