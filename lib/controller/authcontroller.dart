// ignore_for_file: empty_catches, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'package:XLcarez/env/appexports.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';

class Authcontroller extends ChangeNotifier {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmedpasswordcontroller = TextEditingController();
  TextEditingController referalcontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageconteoller = TextEditingController();
  TextEditingController weightconteoller = TextEditingController();
  TextEditingController weightconteollerlbs = TextEditingController();
  TextEditingController bmicontroller = TextEditingController();
  var currentorganization;

  bool isVisible = true;
  bool isconfirmVisible = true;

  var metricheight = "cms";
  var merticweight = "kg";

  var feet;
  void changefeet(val) {
    feet = val;
    notifyListeners();
  }

  var inch;
  void changeinchec(val) {
    inch = val;
    notifyListeners();
  }

  void changeheight({val}) {
    metricheight = val;
    var value = val == "cms" ? "$feet.$inch" : heightController.text;
    //log("Value is $value");
    if (val == "cms") {
      var outputvalue = calculateHeight(
          val: value, inputForm: "feet/inch", outputForm: "cms");
      if (outputvalue != "") {
        heightController.text = outputvalue;
        feet = value.split(".")[0];
        inch = value.split(".")[1];
      } else {
        heightController.text = "";
        feet = null;
        inch = null;
      }
    } else {
      var data = calculateHeight(
          val: value, inputForm: "cms", outputForm: "feet/inch");
      //log("check $data");
      if (data != "") {
        feet = data.split(".")[0];
        inch = data.split(".")[1];
        heightController.text = value;
      } else {
        heightController.text = "";
        feet = null;
        inch = null;
      }
    }
    notifyListeners();
  }

  void changeweight({val}) {
    //log("Weight metric $val");
    merticweight = val;
    var value = val == "kg" ? weightconteollerlbs.text : weightconteoller.text;
    if (val == "kg") {
      var outputvalue =
          calculateWeight(val: value, inputForm: "lb", outputForm: "kg");
      if (outputvalue != "") {
        weightconteoller.text = outputvalue;
        weightconteollerlbs.text = value;
      } else {
        weightconteoller.text = "";
        weightconteollerlbs.text = "";
      }
    } else {
      var outputval =
          calculateWeight(val: value, inputForm: "kg", outputForm: "lb");
      if (outputval != "") {
        weightconteollerlbs.text = outputval;
        weightconteoller.text = value;
      } else {
        weightconteoller.text = "";
        weightconteollerlbs.text = "";
      }
    }

    notifyListeners();
  }

  CountryDialCode? dailcode;
  void chnagedailcode(val) {
    dailcode = val;
    phonecontroller.clear();
    //print(dailcode?.name);
    notifyListeners();
  }

  CountryDialCode checkdialcodeiso(code) {
    final Map<String, String> dialcodechek =
        dialCodes.firstWhere((ele) => ele['code'] == code, orElse: () => {});
    //print(dialcodechek.toString());
    if (dialcodechek.isEmpty) {
      return CountryDialCode.fromJson(
        {
          'name': 'United States',
          'code': 'US',
          'dialCode': '+1',
        },
      );
    }
    return CountryDialCode.fromJson(dialcodechek);
  }

  List<HospitalModel> hospitalist = [];

  String? gender;
  dynamic _userData;
  dynamic get userData => _userData;

  dynamic _doctoruserData;
  dynamic get doctoruserData => _doctoruserData;
  void updateGender({value}) {
    gender = value;
    notifyListeners();
  }

  bool consent = false;
  void chnageconsentform(val) {
    consent = val;
    notifyListeners();
  }

  String? tracksignup;
  void chnagetrack({val}) {
    tracksignup = val;
    notifyListeners();
  }

  void chnagevisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void changconfirmvisible() {
    isconfirmVisible = !isconfirmVisible;
    notifyListeners();
  }

  void doctoreset() {
    _doctoruserData = null;
    notifyListeners();
  }

  void reset() {
    tracksignup = null;
    notifyListeners();
    firstnamecontroller.clear();
    referalcontroller.clear();
    consent = false;
    isVisible = true;
    isconfirmVisible = true;
    lastnamecontroller.clear();
    passwordcontroller.clear();
    confirmedpasswordcontroller.clear();
    ageconteoller.clear();
    phonecontroller.clear();
    emailcontroller.clear();
    gender = null;
    dobcontroller.clear();
    heightController.clear();
    couponcodecontroller.clear();
    ageconteoller.clear();
    bmicontroller.clear();
    weightconteoller.clear();
    weightconteollerlbs.clear();
    questionnairedaibeskip = false;
    questionnairecardioskip = false;
    questionnairehivskip = false;
    questionnairecmentalskip = false;
    dailcode = null;
    currentorganization = 1;
    feet = null;
    inch = null;
    metricheight = "cms";
    merticweight = "kg";
    //doctorslist.clear();
    // hospitalist.clear();
    _userData = null;
    notifyListeners();
  }

  var orgcode;
  void chnagecureentorganization(val) {
    currentorganization = (val == 0 || val == null) ? 1 : val;
    orgcode = organizationlist
        .firstWhere((ele) => ele.organizationId == currentorganization,
            orElse: () => Organisationmodel(orgCode: null))
        .orgCode;
    notifyListeners();
  }

  var userid;
  void chngeuserid(val) {
    userid = val ?? 0;
    notifyListeners();
  }

  void assignmanualdata(ConnectSearchModel connect) {
    firstnamecontroller.text = connect.firstName ?? "";
    lastnamecontroller.text = connect.lastName ?? "";
    emailcontroller.text = connect.email ?? "";
    phonecontroller.text = connect.phone ?? "";
    chnageroledid(connect.roleId);
    chnageconsentform(true);
    chnagecureentorganization(connect.organizationId);
    dailcode = checkdialcodeiso(connect.isoCode);
    notifyListeners();
  }

  void clearmanuluser() {
    firstnamecontroller.clear();
    lastnamecontroller.clear();
    emailcontroller.clear();
    phonecontroller.clear();
    dailcode = null;
    consent = false;
    chnagecureentorganization(_userData?["organizationId"]);
    chnageroledid(_userData?["roleId"], firsttime: true);
    // cureentroledid = userData?["roleId"];
    // currentorganization =
    //     userData?["organizationId"] == 0 ? 1 : userData?['organizationId'];
    notifyListeners();
  }

  var cureentroledid;
  void chnageroledid(val, {firsttime = false}) {
    if (firsttime) {
      try {
        var roleid = val ?? 0;
        if (roleid > 1) {
          var curoleid = roleid + 1;
          var check = rolelist
              .firstWhere((ele) => ele.roleId == curoleid,
                  orElse: () => Rolemodel(roleId: 0))
              .roleId;
          cureentroledid = check != 0 ? check : roleid;
        } else {
          cureentroledid = val;
        }

        notifyListeners();
      } catch (e) {
        cureentroledid = null;
        notifyListeners();
      }
    } else {
      cureentroledid = val;
      notifyListeners();
    }
  }

  void clarlistdata() {
    doctorslist.clear();
    hospitalist.clear();
    notifyListeners();
  }

  List<Rolemodel> fetchlist() {
    var userroledid = userData?["roleId"] ?? 0;
    //log(userroledid.toString());
    if (userroledid <= 1) {
      return rolelist.where((ele) => (ele.roleId ?? 0) > userroledid).toList();
    } else {
      return rolelist.where((ele) => (ele.roleId ?? 0) >= userroledid).toList();
    }
    //return rolelist.where((ele) => (ele.roleId ?? 0) >= userroledid).toList();
  }

  bool usersload = false;
  List<ConnectSearchModel> _originalusers = [];
  List<ConnectSearchModel> _users = [];
  List<ConnectSearchModel> get users => _users;

  TextEditingController searchcontroller = TextEditingController();

  Future<void> usersdata() async {
    try {
      usersload = true;
      _originalusers.clear();
      notifyListeners();
      final res = await postmethod(endpoint: "User/GetAll", body: {"id": 0});
      //log(res.toString());
      if (res != null) {
        List list = res ?? [];
        _originalusers =
            list.map((v) => ConnectSearchModel.fromJson(v)).toList();
        _users = _originalusers;
        var box = await Hive.openBox('XLcarezstore');
        final roleId = box.get('roleId');
        final orgid = box.get('organizationId');
        // SharedPreferencesAsync sharedPreferencesAsync =
        //     SharedPreferencesAsync();
        // var roleId = await sharedPreferencesAsync.getInt('roleId');
        // var orgid = await sharedPreferencesAsync.getInt('organizationId');
        chnagedropdownuser(roleId);
        chnagedropdownuserorg(orgid == 0 ? 1 : orgid);
        notifyListeners();
      }
      usersload = false;
      notifyListeners();
    } catch (e) {
      //log("User $e");
      usersload = false;
      notifyListeners();
    }
  }

  var dropdownuser;
  void chnagedropdownuser(val) {
    dropdownuser = val;
    _users = _originalusers
        .where((el) =>
            el.organizationId == dropdownuserorg && el.roleId == dropdownuser)
        .toList();
    notifyListeners();
  }

  var dropdownuserorg = 1;
  void chnagedropdownuserorg(val) {
    dropdownuserorg = val ?? 1;
    _users = _originalusers
        .where((el) =>
            el.organizationId == dropdownuserorg && el.roleId == dropdownuser)
        .toList();
    notifyListeners();
  }

  void searchuser(String val) {
    List<ConnectSearchModel> tempusers = [];
    tempusers = _originalusers
        .where((el) =>
            el.organizationId == dropdownuserorg && el.roleId == dropdownuser)
        .toList();
    if (val.isEmpty) {
      _users = tempusers;
    } else {
      _users = tempusers.where((e) {
        final input = val.toLowerCase();
        final fname = e.firstName.toString().toLowerCase();
        final lname = e.lastName.toString().toLowerCase();
        return fname.contains(input) || lname.contains(input);
      }).toList();
    }
    notifyListeners();
  }

  bool roleload = false;
  List<Rolemodel> _rolelist = [];
  List<Rolemodel> get rolelist => _rolelist;

  Future<void> getroles() async {
    try {
      roleload = true;
      _rolelist.clear();
      notifyListeners();
      final res = await postmethod(endpoint: "User/GetRoles", body: {"id": 0});
      if (res != null) {
        List list = res ?? [];
        _rolelist = list.map((e) => Rolemodel.fromJson(e)).toList();
        notifyListeners();
      }
      roleload = false;
      notifyListeners();
    } catch (e) {
      roleload = false;
      notifyListeners();
    }
  }

  bool organizationload = false;
  List<Organisationmodel> _organizationlist = [];
  List<Organisationmodel> get organizationlist => _organizationlist;

  Organisationmodel organisationmodel = Organisationmodel.fromJson(
      {'organizationId': 0, 'scanLimit': 0, "orgTotalScans": 1});
  void changeorganzation(Organisationmodel org) {
    organisationmodel = org;
    notifyListeners();
  }

  Future<void> saveorganization() async {
    try {
      organizationload = true;
      notifyListeners();
      final res = await postmethod(
        endpoint: 'Organization/Save',
        totalres: true,
        body: organisationmodel.toJson(),
      );
      //log(res.toString());
      if (res?['data'] != null) {
        final status = res?["status"] ?? false;
        if (status) {
          getorganizations();
          changeorganzation(Organisationmodel.fromJson(
              {'organizationId': 0, 'scanLimit': 1, "orgTotalScans": 1}));
        }
        Fluttertoast.showToast(msg: res?["data"]["message"]);
      }
      organizationload = false;
      notifyListeners();
    } catch (e) {
      organizationload = false;
      notifyListeners();
    }
  }

  TextEditingController couponcodecontroller = TextEditingController();
  bool couponloading = false;
  Future<void> couponcodes(context, {payload}) async {
    try {
      couponloading = true;
      notifyListeners();
      final res = await postmethod(
          endpoint: "User/UpdateUserScansLimitBycouponCode",
          body: payload,
          totalres: true);
      //log(res.toString());
      final extractresp = res;
      if (extractresp != null) {
        final statues = extractresp?["status"];
        final message = extractresp?["message"];
        if (!statues) {
          //log("App false");
          couponcodecontroller.clear();
          showAdaptiveDialog(
              context: context,
              builder: (_) {
                return appdailog(context, actionno: () {
                  Navigator.pop(context);
                },
                    alert: Apptextwidget(fetchlocale(context).alert),
                    content: Apptextwidget(message ?? ""));
              });
        } else {
          Fluttertoast.showToast(msg: message, backgroundColor: success);
          getbyid();
          couponcodecontroller.clear();
          notifyListeners();
        }
      }
      couponloading = false;
      notifyListeners();
    } catch (e) {
      couponloading = false;
      notifyListeners();
    }
  }

  Future<void> getorganizations() async {
    try {
      organizationload = true;
      _organizationlist.clear();
      notifyListeners();
      final res = await postmethod(
          endpoint: "Organization/GetAllOrganization", body: {"id": 0});
      if (res != null) {
        List list = res ?? [];
        _organizationlist =
            list.map((e) => Organisationmodel.fromJson(e)).toList();
        notifyListeners();
      }
      organizationload = false;
      notifyListeners();
    } catch (e) {
      organizationload = false;
      notifyListeners();
    }
  }

  bool isload = false;
  Future<void> login(context, {endpoint, ljson}) async {
    try {
      isload = true;
      notifyListeners();
      final res = await postmethod(
          endpoint: endpoint, body: ljson, header: headers, totalres: true);
      if (res?['data']['user'] != null) {
        var roleid = res['data']["user"]["roleId"];
        if (roleid == 4 ||
            roleid == 5 ||
            roleid == 1 ||
            roleid == 2 ||
            roleid == 3) {
          var status = res['message'];
          Fluttertoast.showToast(msg: status);
          var box = await Hive.openBox('XLcarezstore');
          box.put('token', res['data']["token"]);
          box.put('organizationId', res['data']["user"]["organizationId"]);
          box.put('userId', res['data']["user"]["userId"]);
          box.put('roleId', res['data']["user"]["roleId"]);
          box.put('token', res['data']["token"]);
          box.put('token', res['data']["token"]);
          box.put('first', 1);
          box.put('isProfileCompleted',
              res['data']["user"]["isProfileCompleted"] ?? 0);
          // SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
          // await sharedPreferences.setString("token", res['data']["token"]);
          // await sharedPreferences.setInt(
          //     "organizationId", res['data']["user"]["organizationId"]);
          // await sharedPreferences.setInt(
          //     "userId", res['data']["user"]["userId"]);
          // await sharedPreferences.setInt(
          //     "roleId", res['data']["user"]["roleId"]);
          // await sharedPreferences.setInt("first", 1);
          // await sharedPreferences.setInt("isProfileCompleted",
          //     res['data']["user"]["isProfileCompleted"] ?? 0);
          checkAuthState(context);
        } else {
          logOut(context);
          Fluttertoast.showToast(
              msg:
                  "The login is not available on mobile. Please use the web version.");
        }
      }
      isload = false;
      notifyListeners();
    } catch (e) {
      // print("error login $e");
      isload = false;
      notifyListeners();
    }
  }

  // Position? _position;
  // Position? get position => _position;

//   Future<void> currentlocation()async{
//   var permission  = await Permission.location.status;
//   log(permission.toString());
//   if(permission==PermissionStatus.denied){
//     if (await Permission.location.request().isGranted) {
//        _position = await Geolocator.getCurrentPosition();
//         await fetchaddress();
//     } else {

//     }
//   }
//   else if(permission==PermissionStatus.permanentlyDenied){
//     AppSettings.openAppSettings(
//       type: AppSettingsType.location,
//       asAnotherTask: false
//     );
//   }
//   else if(permission==PermissionStatus.granted){
//     _position = await Geolocator.getCurrentPosition();
//         await fetchaddress();
//   }
// }

// Future foodimage()async{
//   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.media);
//   if(result!=null){
//  var  val =  base64Encode(await result.files.single.xFile.readAsBytes());
//   return val;
//   }
// }

  Future pickImage(context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.media);
    if (result != null) {
      log(result.files.single.xFile.path);
      await cropImage(
        context,
        imageFile: result.files.single.path,
      );
    } else {}
  }

  Future cropImage(context, {imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile,
      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Adjust Your Profile",
            toolbarColor: primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: "Adjust Your Profile",
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    if (croppedFile != null) {
      log("Cropped data ${croppedFile.path.toString()}");
      updateprofile(payload: {
        "Id": (await fethuserid()).toString(),
        "Image": croppedFile.path
      }, file: croppedFile.path)
          .whenComplete(() {
        getbyid();
      });
    }
  }

  bool isdeleteload = false;
  Future<void> deleteprofile(context, {rjon}) async {
    try {
      isdeleteload = true;
      notifyListeners();
      final response = await postmethod(
          totalres: true, endpoint: "User/UpdateStatus", body: rjon);
      if (response != null) {
        final staus = response["status"];
        Fluttertoast.showToast(
            msg: staus ? "User Deleted Successfully." : response["message"]);
        staus ? logOut(context) : null;
      }
      isdeleteload = false;
      notifyListeners();
    } catch (e) {
      isdeleteload = false;
      notifyListeners();
    }
  }

  bool commonload = false;
  Future<void> updateprofile({payload, file}) async {
    try {
      commonload = true;
      notifyListeners();
      Uri urlre = Uri.parse("${baseurl}User/UploadImage");
      http.MultipartRequest request = http.MultipartRequest("POST", urlre);
      var header = await domainheaders();
      request.headers.addAll(header);
      file != null
          ? request.files.add(await http.MultipartFile.fromPath(
              "Image",
              file,
            ))
          : null;
      request.fields.addAll(Map<String, String>.from(payload));
      http.StreamedResponse response = await request.send();
      var resonstreem = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var extracresponse = json.decode(resonstreem.body);
        log(extracresponse.toString());
        final message = extracresponse["message"];
        // final status = extracresponse["status"];
        Fluttertoast.showToast(msg: message);
      }
      commonload = false;
      notifyListeners();
    } catch (ex) {
      log(ex.toString());
      commonload = false;
      notifyListeners();
    }
  }

  List<DoctorModel> doctorslist = [];
  bool doctorsload = false;
  Future<void> getallsoctors({id}) async {
    try {
      doctorslist.clear();
      doctorsload = true;
      notifyListeners();
      final res = await postmethod(
          endpoint: "User/GetDoctorsByUserId", body: {"id": id});
      if (res != null) {
        List list = res;
        final doclist = list.map((e) => DoctorModel.fromJson(e)).toList();
        final mapuser = <int?>{};
        final uniquelist = doclist.where((h) => mapuser.add(h.userId)).toList();
        //log(uniquelist.length.toString());
        doctorslist = uniquelist;
      }
      //log(doctorslist.map((f) => f.toJson().toString()).toList().toString());
      doctorsload = false;
      notifyListeners();
    } catch (e) {
      doctorsload = false;
      notifyListeners();
    }
  }

  List<SpecialityModel> specilatylist = [];
  List<SpecialityModel> allspecilatylist = [];
  bool specilatyload = false;
  Future<void> getallspecilatyies({id}) async {
    try {
      specilatylist.clear();
      specilatyload = true;
      notifyListeners();
      final res = await postmethod(
          endpoint: "Speciality/GetAllSpecialities", body: {"id": id ?? 0});
      if (res != null) {
        List list = res;
        //log(list.length.toString()+"Specialty");
        if (id == null) {
          allspecilatylist =
              list.map((e) => SpecialityModel.fromJson(e)).toList();
          notifyListeners();
        } else {
          specilatylist = list.map((e) => SpecialityModel.fromJson(e)).toList();
          //log(specilatylist.length.toString());
          notifyListeners();
        }
      }
      //log(doctorslist.map((f) => f.toJson().toString()).toList().toString());
      specilatyload = false;
      notifyListeners();
    } catch (e) {
      specilatyload = false;
      notifyListeners();
    }
  }

  // var addrs;
  // fetchaddress() async {
  //   if (_position != null) {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         _position!.latitude, position!.longitude);
  //     addrs = placemarks[0].country;
  //   }
  //   notifyListeners();
  // }

  Future<void> getbyid() async {
    try {
      reset();
      isload = true;
      notifyListeners();
      final res = await postmethod(
          endpoint: "User/GetById", body: {"id": await fethuserid()});
      log(res.toString());
      if (res != null) {
        _userData = res;
        assigndata();
        notifyListeners();
        log(res.toString());
      }
      isload = false;
      notifyListeners();
    } catch (e) {
      isload = false;
      notifyListeners();
    }
  }

  // bool isdoctorload = false;

  // Future<void> getdoctordetails(id) async {
  //   try {
  //     doctoreset();
  //     isdoctorload = true;
  //     notifyListeners();
  //     final res = await postmethod(
  //         endpoint: "User/GetById", body: {"id": id});
  //     if (res != null) {
  //       _doctoruserData = res;
  //       notifyListeners();
  //       log("Clinician Response $res");
  //     }
  //     isdoctorload = false;
  //     notifyListeners();
  //   } catch (e) {
  //     isdoctorload = false;
  //     notifyListeners();
  //   }
  // }

  void assigndata() {
    try {
      dobcontroller.text = (_userData?["dob"] != null 
      ? dateformat(format: "dd-MM-yyy", vale: DateTime.parse(_userData!["dob"]))
      : "");
      gender = _userData?["gender"];
      chnagecureentorganization(userData?["organizationId"]);
      chnageroledid(_userData?["roleId"]);
      dailcode = checkdialcodeiso(_userData["isoCode"]);
      heightController.text = _userData?["height"] ?? "";
      weightconteoller.text = _userData?["weight"] ?? "";
      emailcontroller.text = _userData?["email"] ?? "";
      firstnamecontroller.text = _userData?["firstName"] ?? "";
      lastnamecontroller.text = _userData?["lastName"] ?? "";
      phonecontroller.text = _userData?["phone"] ?? "";
      if (heightController.text.isNotEmpty ||
          weightconteoller.text.isNotEmpty) {
        bmicontroller.text = calculateBmi(
            userheight: _userData?["height"], userweight: _userData?["weight"]);
      }

      if (dobcontroller.text.isNotEmpty) {
        try {
          var date = checkdate(date: _userData["dob"]);
          if (date != null) {
            ageconteoller.text = calculateAge(dob: date).toString();
            log(ageconteoller.text);
          }
        } catch (e) {
          ageconteoller.text = "";
        }
      } else {
        ageconteoller.clear();
      }
      metricheight = _userData["heightUnit"] ?? "cms";
      merticweight = _userData["weightUnit"] ?? "kg";
      weightconteollerlbs = TextEditingController.fromValue(
          TextEditingValue(text: "${_userData?["metricWeight"] ?? ""}"));
      checkheight(
          valueincms: _userData?["height"],
          valuemetric: _userData?["metricHeight"]);
      consent = true;
      List list = _userData["userHospitals"] ?? [];
      hospitalist = list.map((r) => HospitalModel.fromJson(r)).toList();
      notifyListeners();
    } catch (ex) {
      // log("Assign data $ex");
    }
  }

  void checkheight({valueincms, valuemetric}) {
    if (valueincms != null && valueincms != "") {
      if (valuemetric == null || valuemetric == "") {
        var data = calculateHeight(
            val: valueincms, inputForm: "cms", outputForm: "feet/inch");
        //log("check $data");
        feet = data.split(".")[0];
        inch = data.split(".")[1];
      } else {
        feet = valuemetric.toString().split(".")[0];
        inch = valuemetric.toString().split(".")[1];
      }
    } else {
      if (valuemetric != null && valuemetric != "") {
        feet = valuemetric.toString().split(".")[0];
        inch = valuemetric.toString().split(".")[1];
      } else {
        feet = null;
        inch = null;
      }
    }
    notifyListeners();
  }

  var userscandata;
  bool isloadscan = false;
  Future<void> getscanbyid({id}) async {
    try {
      resetscandata();
      isloadscan = true;
      notifyListeners();
      final res = await postmethod(endpoint: "User/GetById", body: {"id": id});
      if (res != null) {
        userscandata = res;
        notifyListeners();
      } else {
        resetscandata();
      }
      isloadscan = false;
      notifyListeners();
    } catch (e) {
      userscandata = null;
      isloadscan = false;
      notifyListeners();
    }
  }

  void resetscandata() {
    userscandata = null;
    notifyListeners();
  }

  bool admindashboardload = false;
  var admindahboardcounts;
  Future<void> admindahboardcount() async {
    try {
      admindashboardload = true;
      notifyListeners();
      final res = await postmethod(endpoint: 'User/GetCounts');
      log(res.toString());
      if (res != null) {
        admindahboardcounts = res[0] ?? [];
        notifyListeners();
      }
      admindashboardload = false;
      notifyListeners();
    } catch (ex) {
      admindashboardload = false;
      notifyListeners();
    }
  }

  bool passwordload = false;
  Future<void> forgotpassword({email}) async {
    try {
      passwordload = true;
      notifyListeners();
      final res = await postmethod(
          totalres: true,
          endpoint: "Authentication/SendForgotPasswordMail",
          body: {"email": email});
      passwordload = false;
      notifyListeners();
      final message = res["message"];
      Fluttertoast.showToast(msg: message);
    } catch (e) {
      passwordload = false;
      notifyListeners();
      Fluttertoast.showToast(msg: "Failed to sendrequest please try again");
    }
  }

  Future<void> scanqr(context) async {
    final xurrentuserid = await fethuserid();
    final connectctrl =
        Provider.of<ConnectivityController>(context, listen: false);
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#539DF3', "Cancel", false, ScanMode.QR);
    if (barcodeScanRes != "-1") {
      if (!connectctrl.checkalreadyexistconnectin(
          fromid: xurrentuserid, toid: int.parse(barcodeScanRes))) {
        if (barcodeScanRes != xurrentuserid.toString()) {
          getscanbyid(id: barcodeScanRes);
          navigationSlideAndRemoveUntil(context, const Connectview());
        } else {
          Fluttertoast.showToast(msg: fetchlocale(context).invalidrequest);
        }
      } else {
        Fluttertoast.showToast(msg: fetchlocale(context).connectrequsetsent);
      }
    }
  }

  bool questionnairedaibeskip = false;

  void chnagequestionaredai({iseverse = false}) {
    questionnairedaibeskip = iseverse ? false : true;
    // questionnairecardioskip = true;
    // questionnairecmentalskip = true;
    notifyListeners();
  }

  bool questionnairehivskip = false;

  void chnagequestionarhiv({iseverse = false}) {
    questionnairehivskip = iseverse ? false : true;
    // questionnairecardioskip = true;
    // questionnairecmentalskip = true;
    notifyListeners();
  }

  bool questionnairecardioskip = false;

  void chnagequestionarecardio({iseverse = false}) {
    questionnairecardioskip = iseverse ? false : true;
    //questionnairecmentalskip = true;
    notifyListeners();
  }

  bool questionnairecmentalskip = false;

  void chnagequestionaremental({iseverse = false}) {
    questionnairecmentalskip = iseverse ? false : true;
    notifyListeners();
  }

  Future<void> signup(context,
      {endpoint,
      rjson,
      bool isfirttime = false,
      bool newuseradd = false}) async {
    try {
      isload = true;
      notifyListeners();
      final res = await postmethod(
          endpoint: endpoint,
          body: rjson,
          header: endpoint == "User/Register" ? headers : null,
          totalres: true);
      log(res.toString());
      if (res["status"]) {
        if (rjson["userId"] == 0) {
          Fluttertoast.showToast(
              msg: endpoint == "User/Register" || newuseradd
                  ? "User Registered Sucessfully"
                  : rjson["message"]);
          if (newuseradd) {
            clearmanuluser();
            usersdata();
            Navigator.pop(context);
          } else {
            navigationSlideAndRemoveUntil(context, const Splash());
            reset();
          }
        } else {
          getbyid();
          if (isfirttime) {
            var box = await Hive.openBox('XLcarezstore');
            box.put('isProfileCompleted', 1);
            // SharedPreferences sharedPreferences =
            //     await SharedPreferences.getInstance();
            // sharedPreferences.setInt("isProfileCompleted", 1);
          }
          isfirttime
              ? navigationSlideAndRemoveUntil(context, const Landing())
              : Navigator.pop(context);
        }
      }
      isload = false;
      notifyListeners();
    } catch (e) {
      isload = false;
      notifyListeners();
    }
  }

  Future<void> checkAuthState(context) async {
    var box = await Hive.openBox('XLcarezstore');
    final token = box.get('roleId');
    final iscompleted = box.get('isProfileCompleted');
    final userid = box.get('userId');
    //print("Check auth state $token");
    // SharedPreferencesAsync preferences = SharedPreferencesAsync();
    // var token = await preferences.getInt("roleId");
    // var iscompleted = await preferences.getInt("isProfileCompleted");
    // var userid = await preferences.getInt("userId");
    if (token == 5) {
      if (iscompleted == 1) {
        navigationSlideAndRemoveUntil(context, const Landing());
      } else {
        navigationSlideAndRemoveUntil(
            context,
            Signup(
              id: userid,
              isfirstime: true,
            ));
      }
    } else if (token == 4) {
      navigationSlideAndRemoveUntil(context, const Doctorlanding());
    } else if (token == 1) {
      navigationSlideAndRemoveUntil(context, const Adminlanding());
    } else if (token == 2 || token == 3) {
      navigationSlideAndRemoveUntil(context, const Orgaadminlanding());
    }
  }

  Future<void> logOut(context, {bool isfirst = false}) async {
    try {
      var box = await Hive.openBox('XLcarezstore');
      await box.clear();
      //SharedPreferencesAsync preference = SharedPreferencesAsync();
      //preference.clear();
      _userData = null;
      Provider.of<Networkwrappercontroller>(context, listen: false).reset();
      reset();
      clarlistdata();
      notifyListeners();
      if (!isfirst) {
        navigationSlideAndRemoveUntil(context, const Login());
      }
    } catch (ex) {}
  }

  Future fethuserid() async {
    var box = await Hive.openBox('XLcarezstore');
    return box.get('userId');
    //SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    //return await sharedPreferences.getInt("userId");
  }

  Future fethroleid() async {
    var box = await Hive.openBox('XLcarezstore');
    return box.get('roleId');
    //SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
    //return await sharedPreferences.getInt("roleId");
  }
}
