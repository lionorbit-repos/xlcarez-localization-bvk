// ignore_for_file: use_build_context_synchronously
import 'package:XLcarez/env/appexports.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) async {
      Provider.of<Networkwrappercontroller>(context,listen: false).initlize();
      Future.delayed(const Duration(milliseconds: 100), () async {
         final ctrl = Provider.of<Authcontroller>(context, listen: false);
        ctrl.checkAuthState(context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
        body: Stack(
          //alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: genratemediaquery(context).size.height/10,
              right: (genratemediaquery(context).size.width/500)-180,
              child: Image.asset(
                splashbg,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Apptextwidget(
                    fetchlocale(context).splashwelcome,
                    style: TxtStls.wstl20,
                  ),
                  appspace(h: 15),
                  TextButton(
                      onPressed: () {
                        navigationSlide(context, const Login(), x: 0.0, y: 1.0);
                      },
                      child: Apptextwidget(fetchlocale(context).login, style: TxtStls.wstl20)),
                  appspace(h: 10),
                  fillButton(
                    context,
                    load: false,
                    title: fetchlocale(context).getstarted,
                    btncol: scaffoldbgcol,
                    stle: TxtStls.themestyle16,
                    onTap: () {
                      navigationSlide(context, const Newsignupscreen(),
                          x: 0.0, y: 1.0);
                    },
                  ),
                  //appspace(h: 15),

                  appspace(h: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     padding: const EdgeInsets.all(20),
    //     height: genratemediaquery(context).size.height,
    //     width: genratemediaquery(context).size.width,
    //     decoration: const BoxDecoration(
    //       image: DecorationImage(
    //           image: AssetImage(splashbg),
    //           fit: BoxFit.cover,
    //           filterQuality: FilterQuality.high),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         Apptextwidget(
    //           "Reach Your\n Fitness Goals",
    //           style: TxtStls.splashlablestyle,
    //         ),
    //         TextButton(onPressed: (){
    //            navigationSlide(context,const Login(),
    //                             x: 0.0, y: 1.0);
    //         }, child: Apptextwidget("Login",style: TxtStls.wstl16)),
    //         appspace(h: 15),
    //         fillButton(context, load: false, title: "Get Started", onTap: (){
    //           navigationSlide(context,const Newsignupscreen(),
    //                             x: 0.0, y: 1.0);
    //         },),
    //         //appspace(h: 15),

    //         appspace(h: 60),
    //       ],
    //     ),
    //   ),
    // );
  }

  // _buildlogo() {
  //   return SizedBox(
  //       height: 250,
  //       child: Image.asset(
  //         logo,
  //         color: bgClr1,
  //       ));
  // }
}
