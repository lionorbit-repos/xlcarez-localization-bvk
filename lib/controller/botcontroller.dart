// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:XLcarez/env/appexports.dart';
import 'package:http/io_client.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

const botimage = "assets/bot.png";
const avtharimage = "assets/avatar.png";

class Botcontroller extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  String? _selectsymptom;
  String? get syptomselect => _selectsymptom;
  final List<Botmodel> _botlist = [];
  TextEditingController messageController = TextEditingController();
  List<Botmodel> get botlist => _botlist;
  final List<Botchat> _botchatlist = [];
  List<Botchat> get botchatlist => _botchatlist;
  List<Data> _symptoms = [];
  List<Data> get symptoms => _symptoms;
  bool symptomsload = false;
  bool questionload = false;
  bool _isListening = false;
  bool get listening => _isListening;
  late stt.SpeechToText _speech;
  String? text;
  var loadindex;
  void triggeraction({data, action, index}) {
    _botlist[index].actions = action;
    loadindex = index;
    fetchanswers(value: data, status: action).whenComplete(() {
      dealayedjump();
    });
    notifyListeners();
  }

  Future<void> speack({text, Locale? languge}) async {
    // print("${languge?.countryCode} ${languge?.languageCode}");
    final FlutterTts flutterTts = FlutterTts();
    //await getVoices(flutterTts);
    await flutterTts.setLanguage(languge?.languageCode ?? "en");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  void listen() async {
    // log("Voice Status $_isListening");
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => () {
          //print("Voice $status");
          _isListening = false;
          notifyListeners();
        },
        onError: (error) => () {
          //print("Mic error $error");
          _isListening = false;
          notifyListeners();
        },
      );

      if (available) {
        _isListening = true;
        text = null;
        notifyListeners();
        _speech.listen(onResult: (result) {
          text = result.recognizedWords;
          if (text != "") {
            var fulltext = "${messageController.text} $text";
            //print(fulltext);
            var unique = uniquefilter(fulltext);
            messageController.text = unique;
            notifyListeners();
          }

          //setState(() => _text = result.recognizedWords);
        });
      }
    } else {
      _isListening = false;
      notifyListeners();
      _speech.stop();
    }
  }

  String uniquefilter(String input) {
    // Set<String> uniqueWords = input.split(' ').toSet();
    Set<String> seen = {};
    var uniquewords = input
        .split(RegExp(r'\s+')) // Split words while handling multiple spaces
        .map((word) => word.replaceAll(
            RegExp(r'[^a-zA-Z]'), '')) // Remove special characters
        .where((word) =>
            word.isNotEmpty && seen.add(word)) // Keep unique words in order
        .join(' ');
    //input.split(RegExp(r'\s+')).where((word) => seen.add(word)).join(' ');
    //input.split(' ').where((word) => seen.add(word)).join(' ');
//print("Unique Words $uniquewords"); // {'hello', 'world'}
    return uniquewords;
  }

  void chnagesymtom({val}) {
    _selectsymptom = val;
    _botlist.add(Botmodel(
      message: val,
    ));
    godown();
    fetchquestions(value: val).whenComplete(() {
      dealayedjump();
    });
    notifyListeners();
  }

  void dealayedjump() {
    Future.delayed(const Duration(seconds: 2), () {
      godown();
    });
  }

  void godown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  }

  Future<void> fetchsymptoms() async {
    try {
      _botlist.clear();
      _symptoms.clear();
      symptomsload = true;
      notifyListeners();
      final request =
          Uri.parse("https://baithna.tribandtech.com:7075/get_unique_names");
      final response = await http.get(request);
      if (response.statusCode == 200) {
        var extractresponse = json.decode(response.body);
        List data = extractresponse["data"];
        _symptoms = data.map((e) => Data.fromJson(e)).toList();
        _botlist.insert(
            0,
            Botmodel(
              heading: """Hi! I am Ana. How can I help you?""",
              isbot: true,
            ));
        _botlist.add(Botmodel(
          //fileimage: botimage,
          // heading:
          //     """Hi! I can help you with the following\nservices.Please choose from the following options to proceed.""",
          isbot: true,
          data: _symptoms,
        ));
        notifyListeners();
        //log("data ${extractresponse["data"]}");
      }
      symptomsload = false;
      notifyListeners();
    } catch (e) {
      symptomsload = false;
      notifyListeners();
    }
  }

  Future<void> fetchquestions({value}) async {
    try {
      questionload = true;
      notifyListeners();
      final request =
          Uri.parse("https://baithna.tribandtech.com:7075/get_Questions");
      final response = await http.post(request,
          body: jsonEncode({"data": value}),
          headers: {"Content-Type": "application/json"});
      //  print(response.body);
      if (response.statusCode == 200) {
        var extractresponse = json.decode(response.body);
        List data = extractresponse["data"];
        List<Data> questionslist = [];
        questionslist = data.map((e) => Data.fromJson(e)).toList();
        if (questionslist.isNotEmpty) {
          _botlist.add(Botmodel(
              isbot: true, message: questionslist[0].indicators, actions: ""));
          notifyListeners();
        }
        notifyListeners();
      }
      questionload = false;
      notifyListeners();
    } catch (e) {
      questionload = false;
      notifyListeners();
    }
  }

  Future<void> fetchanswers({value, status}) async {
    try {
      questionload = true;
      notifyListeners();
      final request =
          Uri.parse("https://baithna.tribandtech.com:7075/get_answers");
      final response = await http.post(request,
          body: jsonEncode(
              {"data": value, "Status": status.toString().toLowerCase()}),
          headers: {"Content-Type": "application/json"});
      // print(response.body);
      if (response.statusCode == 200) {
        var extractresponse = json.decode(response.body);
        if (extractresponse.toString().contains("jump_questions")) {
          _botlist.add(Botmodel(
            actions: "",
            message: extractresponse["jump_questions"],
            isbot: true,
          ));
          notifyListeners();
        } else if (extractresponse.toString().contains("services_questions")) {
          fetchquestions(value: extractresponse["services_questions"]);
        } else {
          _botlist.add(Botmodel(
            isbot: true,
            checkout: extractresponse,
          ));
          notifyListeners();
        }
      }
      questionload = false;
      notifyListeners();
    } catch (e) {
      questionload = false;
      notifyListeners();
    }
  }

  void addmanulachat({message}) {
    _botchatlist.add(Botchat(
      message: message,
    ));
    notifyListeners();
  }

  void addmanuimage({img, ext}) {
    _botchatlist.add(Botchat(image: img, ext: ext));
    notifyListeners();
  }

  void tooglelistening() {
    _isListening = false;
    _speech.stop();
    notifyListeners();
  }

  Future<void> filepick(userid) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'img', 'png', 'jpeg', 'jpg']);
    if (result != null) {
      var mjson = {'title': 'chatbot', 'id': '0'};
      fileupload(
          file: result.files.single.path,
          id:userid,
          payload: mjson,
          ext: result.files.single.extension == "pdf" ? "pdf" : "Image");
    }
  }

  bool userchatload = false;
  Future<void> fetchat({payload}) async {
    try {
      userchatload = true;
      notifyListeners();
      final ioc = HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = IOClient(ioc);
      final request =
          Uri.parse("https://baithna.tribandtech.com:3031/responsive/chatbot");
      final response = await http.post(request,
          body: jsonEncode(payload),
          headers: {"Content-Type": "application/json"});
      // print(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var extractresponse = json.decode(response.body);
        if (extractresponse.toString().contains("Bot_response")) {
          if (extractresponse["status"]) {
            _botchatlist.add(Botchat(
              message: extractresponse["Bot_response"],
              isbot: true,
            ));
            notifyListeners();
          }
        }
      }
      userchatload = false;
      notifyListeners();
    } catch (e) {
      userchatload = false;
      notifyListeners();
    }
  }

  Future<void> chatbotquery(payload) async {
    try {
      log(payload.toString());
      userchatload = true;
      notifyListeners();
      final ioc = HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = IOClient(ioc);
      final request =
          Uri.parse("https://baithna.tribandtech.com:3031/Document/chatbot");
      final response = await http.post(request,
          body: jsonEncode(payload),
          headers: {"Content-Type": "application/json"});
      log(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var extractresponse = json.decode(response.body);
        if (extractresponse.toString().contains("response")) {
          if (extractresponse["status"]) {
            _botchatlist.add(Botchat(
              message: extractresponse["response"],
              isbot: true,
            ));
            notifyListeners();
          }
        }
      }
      userchatload = false;
      notifyListeners();
    } catch (e) {
      userchatload = false;
      notifyListeners();
    }
  }

  bool fileuploading = false;
  Future<void> fileupload({file, payload, ext,id}) async {
    try {
      fileuploading = true;
      notifyListeners();
      Uri urlre = Uri.parse("${baseurl}User/UploadFile");
      http.MultipartRequest request = http.MultipartRequest("POST", urlre);
      var header = await domainheaders();
      request.headers.addAll(header);
      file != null
          ? request.files.add(await http.MultipartFile.fromPath(
              "upload",
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
        final data = extracresponse["data"];
        if (extracresponse['status']) {
          addmanuimage(img: data, ext: ext);
          var mjson ={
            'is_document':true,
            "url":"$asseturl/Docs/$data",
            "user_id":id
          };
          chatbotquery(mjson);
        }

        // final status = extracresponse["status"];
        Fluttertoast.showToast(msg: message);
      }
      fileuploading = false;
      notifyListeners();
    } catch (ex) {
      log(ex.toString());
      fileuploading = false;
      notifyListeners();
    }
  }

  void reset() {
    _botchatlist.clear();
    _botchatlist.insert(
        0,
        Botchat(
          message: """Hi! I am Ana. How can I help you?""",
          isbot: true,
        ));
    _speech = stt.SpeechToText();
    text = null;
    _botlist.clear();
    userchatload = false;
    _selectsymptom = null;
    messageController.clear();
    tooglelistening();
    notifyListeners();
  }
}
