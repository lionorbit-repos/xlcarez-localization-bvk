// ignore_for_file: prefer_typing_uninitialized_variables, file_names
import 'package:XLcarez/env/appexports.dart';

class Botmodel{
  bool? isbot;
  List<Data>? data;
  String? fileimage;
  String? message;
  String? heading;
  var actions;
  dynamic checkout;
  Botmodel({this.data,this.isbot,this.message,this.heading,this.fileimage,this.actions,this.checkout});
}

class Botchat{
  bool? isbot;
  String? message;
  String? image;
  String? ext;
  Botchat({this.isbot,this.message,this.image,this.ext});
}