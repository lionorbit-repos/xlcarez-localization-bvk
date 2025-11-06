// ignore_for_file: file_names

import 'package:XLcarez/env/appexports.dart';

class Nointernetview extends StatefulWidget {
  const Nointernetview({super.key});

  @override
  State<Nointernetview> createState() => _NointernetviewState();
}

class _NointernetviewState extends State<Nointernetview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: scaffoldbgcol,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Apptextwidget(fetchlocale(context).nointernetconnection,
                style: TxtStls.stl16),
            appspace(h: 20),
            Image.asset(
              "assets/nointernetimage.png",
            ),
            Apptextwidget(
                textAlign: TextAlign.center,
                fetchlocale(context).pleasecheckyourconnection,
                style: TxtStls.stl14),
          ],
        ),
      ),
    );
  }
}
