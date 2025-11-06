// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:XLcarez/env/appexports.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Vitalgraph extends StatefulWidget {
  var id;
  Vitalgraph({super.key, this.id});
  @override
  State<Vitalgraph> createState() => _VitalgraphState();
}

class _VitalgraphState extends State<Vitalgraph> {
  var index = 0;
  late WebViewXController webViewXController;
  @override
  Widget build(BuildContext context) {
    // final lng = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return MyThemeGradient(
      child: Scaffold(
        appBar: Themeappbar(
          title: fetchlocale(context).trends,
          leading: true,
          act: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (index == 0) {
                      index = 1;
                    } else {
                      index = 0;
                    }
                  });
                },
                icon: const Icon(
                  Icons.rotate_90_degrees_ccw,
                  color: scaffoldbgcol,
                ))
          ],
        ),
        body: Appscalemedia(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: RotatedBox(
              quarterTurns: index,
              child: WebViewX(
                onPageStarted: (val) {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Apptextwidget(
                  //   "Loading..",
                  //   style: TxtStls.wstl12,
                  // )));
                },
                onPageFinished: (val) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                },
                onWebViewCreated: (cont) async {
                  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  // final token = sharedPreferences.getString("token");
                  // log(widget.id.toString());
                  //log(token.toString());
                  webViewXController = cont;
                  //webViewXController.clearCache();
                  webViewXController.loadContent(
                      'https://baithnabot.tribandtech.com:7879/superset/dashboard/32/?native_filters_key=WgZdFDrwksD8nBOMGWplFHAJq5BChMRWJFOZyC3U8cCfDtCn2atMfKsEUSNpTlif&userid=${widget.id}&standalone=3');
                  //webViewXController.loadContent('https://baithnabot.tribandtech.com:6061/XLcarez/${widget.id}/$token');
                  //https://baithnabot.tribandtech.com:6060/bluhealthtest/${widget.id}/$token
                },
                onWebResourceError: (err) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Apptextwidget(
                    fetchlocale(context).failedtoload,
                    style: TxtStls.wstl12,
                  )));
                },
                width: size.width,
                height: size.height,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//${loc.locale == const Locale("ar") ? '0' : '1'
