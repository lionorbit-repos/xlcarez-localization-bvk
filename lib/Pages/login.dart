import 'package:XLcarez/env/appexports.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
        body: Consumer2<Authcontroller, Networkwrappercontroller>(
            builder: (context, ctrl, networkctrl, child) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            child: Form(
              key: key,
             
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Apptextwidget(
                    fetchlocale(context).login,
                    style: TxtStls.splashlablestyle,
                  ),
                  appspace(h: 5),
                  Apptextwidget(
                    "${fetchlocale(context).welcomeback} !",
                    style: TxtStls.wstl20,
                  ),
                  appspace(h: 10),
                  mycustomefield(
                    label: fetchlocale(context).email,
                    child: emailFieldicon(
                        controller: emailcontroller,
                        labelText: fetchlocale(context).email,
                        hintText: fetchlocale(context).emailint,
                        isblack: false),
                  ),
                  appspace(h: 5),
                  mycustomefield(
                    label: fetchlocale(context).pwd,
                    child: passwordField(
                        controller: passwordcontroller,
                        labelText: fetchlocale(context).pwd,
                        hintText: fetchlocale(context).enterpwd,
                        isblack: false,
                        obscureText: isVisible,
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        }),
                  ),
                  appspace(h: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (emailcontroller.text.isNotEmpty) {
                            ctrl.forgotpassword(email: emailcontroller.text);
                          } else {
                            Fluttertoast.showToast(
                                msg: fetchlocale(context).emailerror);
                          }
                        },
                        child: Apptextwidget(
                          fetchlocale(context).forgetpwd,
                          style: TxtStls.forgetstyle,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showAdaptiveDialog(
                              context: context,
                              builder: (_) {
                                return appdailog(context,
                                    ationtitleyes: fetchlocale(context).ok,
                                    actionsyes: () {
                                  Navigator.pop(context);
                                },
                                    alert: Apptextwidget(
                                      fetchlocale(context).alert,
                                      style: TxtStls.stl16,
                                    ),
                                    content: Apptextwidget(
                                      fetchlocale(context).mailcheckmsg,
                                      style: TxtStls.stl13,
                                    ));
                              });
                        },
                        icon: const Icon(Icons.info),
                        color: bgClr1,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      navigationSlide(context, const Newsignupscreen(),
                          x: 0.0, y: 1.0);
                    },
                    child: Column(
                      children: [
                        Apptextwidget(
                          fetchlocale(context).acquestion,
                          style: TxtStls.labelStl,
                        ),
                        appspace(h: 5),
                        Apptextwidget(
                          fetchlocale(context).rghere,
                          style: TxtStls.forgetstyle,
                        ),
                      ],
                    ),
                  ),
                  appspace(h: 10),
                  fillButton(context,
                      load: ctrl.isload || ctrl.passwordload,
                      title: fetchlocale(context).login,
                      width: 300.0, onTap: () {
                    if (networkctrl.connectionstatus ==
                        InternetStatus.connected) {
                      if (key.currentState!.validate()) {
                        var ljson = {
                          "email": emailcontroller.text,
                          "password": passwordcontroller.text,
                        };
                        ctrl.login(context,
                            endpoint: "Authentication/Login", ljson: ljson);
                      }
                    }
                  }),
                  appspace(h: 20),
                  Visibility(
                      visible: networkctrl.connectionstatus ==
                          InternetStatus.disconnected,
                      child: Apptextwidget(
                          networkctrl.connectionstatus.toString())),
                  //const Spacer(),
                ],
              ),
            ),
          );
        }),
        //         bottomNavigationBar:
        //             Consumer<Authcontroller>(builder: (context, ctrl, child) {
        //           return BottomAppBar(
        //             color: transparentcol,
        //             surfaceTintColor: scaffoldbgcol,
        //             height: 250,
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 GestureDetector(
        //                   onTap: () {
        //                     navigationSlide(context, const Newsignupscreen(),
        //                         x: 0.0, y: 1.0);
        //                   },
        //                   child: Column(
        //                     children: [
        //                       Apptextwidget(
        //                         "If you don’t have account",
        //                         style: TxtStls.labelStl,
        //                       ),
        //                       appspace(h: 5),
        //                       Apptextwidget(
        //                         "Register Here",
        //                         style: TxtStls.forgetstyle,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 appspace(h: 10),
        //                 fillButton(context,
        //                     load: ctrl.isload || ctrl.passwordload,
        //                     title: "Login",
        //                     width: 300.0, onTap: () {
        //                   if (key.currentState!.validate()) {
        //                     var ljson = {
        //                       "email": emailcontroller.text,
        //                       "password": passwordcontroller.text,
        //                     };
        //                     ctrl.login(context,
        //                         endpoint: "Authentication/Login", ljson: ljson);
        //                   }
        //                 }),
        //                 appspace(h: 20),
        //               ],
        //             ),
        //           );
        //         }
        //  ),
      ),
    );
  }
}

/*
SingleChildScrollView(
          child: Container(
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(loginbg),
                    filterQuality: FilterQuality.medium,
                    fit: BoxFit.cover)),
            child: Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(
                  top: 250, right: 20, left: 20, bottom: 40),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Form(
                key: key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          logo,
                          color: Colors.white,
                        )),
                    appspace(h: 20),
                    Text(
                      "Login to Your Account",
                      style: TxtStls.wstl13,
                    ),
                    appspace(h: 5),
                    emailField(
                        isblack: true,
                        labelText: "Email",
                        controller: emailcontroller,
                        hintText: "Enter your email"),
                    appspace(h: 5),
                    passwordField(
                        isblack: true,
                        labelText: "Password",
                        controller: passwordcontroller,
                        hintText: "Enter your password",
                        obscureText: isVisible,
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        }),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            if (emailcontroller.text.isNotEmpty) {
                              ctrl.forgotpassword(email: emailcontroller.text);
                            }
                            else{
                              Fluttertoast.showToast(msg: "Email cannot be empty");
                            }
                          },
                          child: Text(
                            "Forget Password?",
                            style: TxtStls.wstl13,
                          )),
                    ),
                    appspace(h: 15),
                    fillButton(context, load: ctrl.isload||ctrl.passwordload, title: "Login",
                        onTap: () {
                      if (key.currentState!.validate()) {
                        var ljson = {
                          "email": emailcontroller.text,
                          "password": passwordcontroller.text,
                        };
                        ctrl.login(context,
                            endpoint: "Authentication/Login", ljson: ljson);
                      }
                    }),
                    appspace(h: 10),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",style: TxtStls.wstl13,),
                      appspace(w: 2),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Text(
                            "Sign Up",
                            style: TxtStls.forgotStl,
                          ),
                          onTap: () {
                            navigationSlide(context,Signup(),
                                x: 0.0, y: 1.0);
                          },
                        )
                    ],
                  ) 
                  ],
                ),
              ),
            ),
          ),
        );
*/
