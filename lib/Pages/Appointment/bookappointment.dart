// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_constructors
import 'package:XLcarez/env/appexports.dart';

class BookAppointmentView extends StatelessWidget {
  var name;
  BookAppointmentView({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    //log(name??"df");
    return MyThemeGradient(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bookingsucessfull.png"))),
            ),
            Apptextwidget(
              """${fetchlocale(context).youhavesuccessfully} \n $name.
              """,
              style: TxtStls.stl15,
            ),
          ],
        ),
        bottomNavigationBar: bottomContainer(
            child: fillButton(context, load: false, title: fetchlocale(context).backtohome,
                onTap: () {
          navigationSlideAndRemoveUntil(context, Landing());
        })),
      ),
    );
  }
}

//             """Your Appointment Booking with $name has
// successfully completed.""",