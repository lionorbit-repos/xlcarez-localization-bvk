// ignore_for_file: file_names, prefer_final_fields


import 'package:XLcarez/env/appexports.dart';

class ConnectivityController extends ChangeNotifier {
  bool sendLoading = false;
  Future<void> sendRequest(context, {fromUserId, toUserId}) async {
    try {
      sendLoading = true;
      notifyListeners();
      final response = await postmethod(totalres: true,
          endpoint: "Connection/Request",
          body: {"toUserId": toUserId, "fromUserId": fromUserId});
      if (response != null && response["status"] == true) {
        Fluttertoast.showToast(msg: response["message"]);
        // AppToastMessages.successMessage(msg: response["message"]);
      } else {
        Fluttertoast.showToast(msg: response["message"]);
        // AppToastMessages.successMessage(msg: response["message"]);
      }
      sendLoading = false;
      notifyListeners();
    } on Exception {
      sendLoading = false;
      notifyListeners();
    }
  }
  List<ConnectionGetAllModel> _requestedlist = [];
  List<ConnectionGetAllModel> get requestedlist {
    return [..._requestedlist];
  }
  List<ConnectionGetAllModel> _acceptedList = [];
  List<ConnectionGetAllModel> get acceptedList {
    return [..._acceptedList];
  }
  List<ConnectionGetAllModel> _rejectedList = [];
  List<ConnectionGetAllModel> get rejectedList {
    return [..._rejectedList];
  }
  List<ConnectionGetAllModel> _mainList = [];
  List<ConnectionGetAllModel> get mainList {
    return [..._mainList];
  }
  List<ConnectionGetAllModel> _conectionList1 = [];
  List<ConnectionGetAllModel> get conectionList1 {
    return [..._conectionList1];
  }
  bool connectionLoading = false;

  bool checkalreadyexistconnectin({fromid,toid}){
  //  print("From id $fromid");
  //  print("To id $toid");
    var check = _mainList.where((ele)=>ele.fromUserId==fromid&&ele.toUserId==toid||ele.fromUserId==toid&&ele.toUserId==fromid).toList();
    if(check.isNotEmpty){
     // print(check[0].toJson());
     //Fluttertoast.showToast(msg: "You already ${data.userId== await auth.fethuserid()?"Sent":"Recived"} connect request ${data.userId== await auth.fethuserid()?"to this ${auth.userData?["userName"]}":"from this ${data.firstName} ${data.lastName}"}  !!");
    }
    return check.isNotEmpty;
  }
  Future<void> getAllConnections() async {
    try {
      connectionLoading = true;
      _acceptedList.clear();
      _mainList.clear();
      _rejectedList.clear();
      _requestedlist.clear();
      notifyListeners();
      final response = await postmethod(endpoint: "Connection/GetAll", body: {},totalres: true);
      if (response != null && response["status"]==true) {
        final connectionData = response["data"];
        //log(connectionData.toString());
        _mainList = connectionData == null
            ? []
            : List<ConnectionGetAllModel>.from(
                connectionData.map((e) => ConnectionGetAllModel.fromJson(e)));
        _requestedlist =
            _mainList.where((e) => e.status.toString() == "Requested").toList();
        _acceptedList =
            _mainList.where((e) => e.status.toString() == "Accepted").toList();
        _rejectedList = _mainList.where((e)=>e.status.toString()=="Rejected").toList();
      }
      else {
        _mainList = [];
        _requestedlist = [];
        _acceptedList = [];
        _rejectedList =[];
      }
      connectionLoading = false;
       getCareTeam();
       getCircles();
      notifyListeners();
    } on Exception {
      connectionLoading = false;
      notifyListeners();
    }
  }
  bool arLoading = false;
  Future<void> updateRequestStatus(context, {id, status}) async {
    arLoading = true;
    notifyListeners();
    final response = await postmethod(
      totalres: true,
        endpoint: "Connection/UpdateStatus",
        body: {"id": id, "status": status});
    if (response != null && response["status"] == true) {
      // AppToastMessages.successMessage(msg: response["message"]);
    } else {
      // AppToastMessages.successMessage(msg: response["message"]);
    }
    arLoading = false;
    notifyListeners();
  }
  List<ConnectionGetAllModel> carelist=[];
  List<ConnectionGetAllModel> circleList=[];
  void getCareTeam(){
    carelist = _acceptedList.where((e)=>e.toUserRole=="Clinician").toList();
    notifyListeners();
  }
  void getCircles(){
    circleList = _acceptedList.where((e)=>e.toUserRole=="Patient").toList();
    notifyListeners();
  }
  TextEditingController searchcontroller = TextEditingController();
  bool searchload = false;

  List<ConnectSearchModel>  _searchlist =[];
  List<ConnectSearchModel> get searchlist => _searchlist;
  Future searchusers({payload})async{
    try {
      _searchlist.clear();
      searchload= true;
      notifyListeners();
      final response = await postmethod(endpoint: 'User/SearchByUserName',body: payload);
      if(response!=null){
        List list = response;
        _searchlist = list.map((j)=>ConnectSearchModel.fromJson(j)).toList();
        notifyListeners();
      }
      searchload=false;
      notifyListeners();
    } catch (e) {
      //log(e.toString());
      searchload=false;
      notifyListeners();
  }

}
void resetdata(){
  _searchlist.clear();
  searchcontroller.clear();
  notifyListeners();
}
}