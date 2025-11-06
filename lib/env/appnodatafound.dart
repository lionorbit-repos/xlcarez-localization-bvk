// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:XLcarez/env/appexports.dart';

class Nodatafound extends StatelessWidget {
  final content;
  const Nodatafound({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Apptextwidget(
        content ?? fetchlocale(context).no_data,
        style: TxtStls.wstl20,
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: SingleChildScrollView(
    //     physics: const AlwaysScrollableScrollPhysics(),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         // Image.asset(nodatafound),
    //         // appspace(h: 5),

    //       ],
    //     ),
    //   ),
    // );
  }
}
