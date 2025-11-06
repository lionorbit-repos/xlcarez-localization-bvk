part of '../Pages/newsignupscreen.dart';

final key = GlobalKey<FormState>();
final key1 = GlobalKey<FormState>();
final key2 = GlobalKey<FormState>();
Widget signupemail(context, {required Authcontroller auth}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 250,
          width: 250,
        ),
        registertext(context, title: fetchlocale(context).email),
        appspace(h: 5),
        mycustomefield(
          label: fetchlocale(context).email,
          child: emailFieldicon(
            controller: auth.emailcontroller,
            labelText: fetchlocale(context).email,
            hintText: fetchlocale(context).emailint,
            isblack: false,
          ),
        ),
        appspace(h: 10),
        fillButton(context,
            load: false,
            title: fetchlocale(context).next,
            btncol: scaffoldbgcol,
            stle: TxtStls.themestyle16, onTap: () {
          if (key2.currentState!.validate()) {
            auth.chnagetrack(val: "name");
            //key.currentState?.reset();
          }
        }),
        appspace(h: 10),
        GestureDetector(
          onTap: () {
            commonlauncth(
                url:
                    "https://sites.google.com/lionorbit.com/xlcarezprivacypolicy/home");
          },
          //By continuing, you confirm your acceptance of our Terms and Conditions and Privacy Policy.
          child: RichText(
              text: TextSpan(
                  text: fetchlocale(context).tcstatement,
                  style: TxtStls.labelStl,
                  children: [
                TextSpan(
                    text: fetchlocale(context).tandc,
                    style: TxtStls.termsstyle),
                TextSpan(
                    text: '\n${fetchlocale(context).and} ',
                    style: TxtStls.labelStl),
                TextSpan(
                    text: fetchlocale(context).pp, style: TxtStls.termsstyle)
              ])),
        )
      ],
    ),
  );
}

Widget signupname(context, Authcontroller auth) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 250,
          width: 250,
        ),
        registertext(context, title: fetchlocale(context).namee),
        appspace(h: 5),
        mycustomefield(
          label: fetchlocale(context).namee,
          child: newnameField(
            controller: auth.firstnamecontroller,
            labelText: fetchlocale(context).namee,
            hintText: fetchlocale(context).wtname,
          ),
        ),
        appspace(h: 10),
        fillButton(context, load: false, title: fetchlocale(context).next,
            onTap: () {
          if (key1.currentState!.validate()) {
            auth.chnagetrack(val: "password");
            //key.currentState?.reset();
          }
        }),
      ],
    ),
  );
}

Widget signupassword(context, Authcontroller auth) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: genratemediaquery(context).size.height / 4.5,
        ),
        registertext(context, title: fetchlocale(context).pwd),
        appspace(h: 5),
        mycustomefield(
          label: fetchlocale(context).pwd,
          child: passwordField(
              controller: auth.passwordcontroller,
              labelText: fetchlocale(context).pwd,
              hintText: fetchlocale(context).enterpwd,
              isblack: false,
              obscureText: auth.isVisible,
              onPressed: () {
                auth.chnagevisible();
              }),
        ),
        appspace(h: 10),
        mycustomefield(
          label: fetchlocale(context).cnfpwd,
          child: passwordField(
              controller: auth.confirmedpasswordcontroller,
              labelText: fetchlocale(context).cnfpwd,
              hintText: fetchlocale(context).entercnfpwd,
              isblack: false,
              obscureText: auth.isconfirmVisible,
              onPressed: () {
                auth.changconfirmvisible();
              }),
        ),
        appspace(h: 10),
        mycustomefield(
          label: fetchlocale(context).orgcodee,
          child: textfiled(
              isblack: false,
              controller: auth.referalcontroller,
              errortext: fetchlocale(context).orgcodee,
              hintText:
                  "${fetchlocale(context).enter} ${fetchlocale(context).orgcodee}"),
        ),
        appspace(h: 10),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: bgClr1)),
          fillColor: WidgetStatePropertyAll(bgClr1),
          checkColor: primary,
          value: auth.consent,
          onChanged: (val) {
            auth.chnageconsentform(val!);
          },
          title: GestureDetector(
              onTap: () {
                navigationSlide(context, const Healthcareformview(),
                    x: 0.0, y: 1.0);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Apptextwidget(
                    fetchlocale(context).consente,
                    style: TxtStls.stl13,
                  ),
                  appspace(h: 2),
                  Container(
                    color: primary,
                    height: 2,
                    width: 80,
                  )
                ],
              )),
        ),
        fillButton(context,
            load: auth.isload,
            title: fetchlocale(context).getstarted, onTap: () {
          if (key.currentState!.validate()) {
            if (auth.consent) {
              if (auth.passwordcontroller.text ==
                  auth.confirmedpasswordcontroller.text) {
                // String firstname;
                // String lastname;
                // try {
                //   firstname = auth.firstnamecontroller.text.split(" ")[0];
                //   lastname = auth.firstnamecontroller.text.split(" ")[1];
                // } catch (e) {
                //   firstname = auth.firstnamecontroller.text;
                //   lastname = "";
                // }
                var rjson = {
                  "userId": 0,
                  "firstName": auth.firstnamecontroller.text,
                  "lastName": auth.lastnamecontroller.text,
                  "email": auth.emailcontroller.text,
                  "phone": "",
                  "password": auth.passwordcontroller.text,
                  "roleId": 5,
                  "status": "Active",
                  "createdBy": 0,
                  "organizationId": auth.currentorganization,
                  "isProfileCompleted": 0,
                  "orgCode": auth.referalcontroller.text,
                  "image": "",
                  "gender": null,
                  "dob": webdateformat(auth.dobcontroller),
                  "consentName":
                      "${auth.firstnamecontroller.text} ${auth.lastnamecontroller.text}",
                  "height": "",
                  "weight": "",
                };
                auth.signup(context, endpoint: "User/Register", rjson: rjson);
                //print(rjson.toString());
              } else {
                Fluttertoast.showToast(
                    gravity: ToastGravity.TOP,
                    msg: fetchlocale(context).pwdmissmatch);
              }
            } else {
              Fluttertoast.showToast(
                  gravity: ToastGravity.TOP,
                  msg: "Please click on the consent box to proceed");
            }
          }
        }),
      ],
    ),
  );
}

Widget registertext(context, {title}) {
  return Column(
    children: [
      Apptextwidget(
        '''${fetchlocale(context).your} \n${fetchlocale(context).fitnesstracker}''',
        style: TxtStls.splashlablestyle,
      ),
      appspace(h: 10),
      Apptextwidget(
        fetchlocale(context).regtagline1,
        style: TxtStls.wstl20,
      ),
      Apptextwidget(
        fetchlocale(context).regtagline2,
        style: TxtStls.wstl20,
      ),
      appspace(h: 40),
      Apptextwidget(
        "${fetchlocale(context).createac} $title",
        style: TxtStls.wstl20,
      ),
    ],
  );
}

void loadback(context, {required Authcontroller auth}) {
  final istracked = auth.tracksignup;
  if (istracked == "name") {
    //key.currentState?.reset();
    return auth.chnagetrack(val: null);
  } else if (istracked == "password") {
    //key.currentState?.reset();
    return auth.chnagetrack(val: "name");
  } else {
    return Navigator.pop(context);
  }
}

GlobalKey<FormState> loadkeys(context, {required Authcontroller auth}) {
  final istracked = auth.tracksignup;
  if (istracked == "name") {
    //key.currentState?.reset();
    return key1;
  } else if (istracked == "password") {
    //key.currentState?.reset();
    return key;
  } else {
    return key2;
  }
}

Widget loadtrack(context, {required Authcontroller auth}) {
  final istracked = auth.tracksignup;
  if (istracked == "name") {
    return signupname(context, auth);
  } else if (istracked == "password") {
    return signupassword(context, auth);
  } else {
    return signupemail(context, auth: auth);
  }
}
