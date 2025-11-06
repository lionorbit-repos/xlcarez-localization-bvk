// ignore_for_file: must_be_immutable

import 'package:XLcarez/env/appexports.dart';

class Calculatordasboard extends StatelessWidget {
  const Calculatordasboard({super.key});
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
          appBar: Themeappbar(
            title: fetchlocale(context).healthassesment,
            leading: true,
          ),
          body: ListView.separated(
              separatorBuilder: (_, k) {
                return appspace(h: 5);
              },
              itemCount: fetchlocahealthassementlist(context).length,
              itemBuilder: (_, i) {
                final data = fetchlocahealthassementlist(context)[i];
                return SizedBox(
                    height: 150,
                    child: Healthasscard(
                      provider: AssetImage(data["url"] as String),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Apptextwidget(data["title"] as String, style: TxtStls.stl14,),
                        ElevatedButton(onPressed: (){
                        navigationSlide(context, data["page"],x: 1.0,y: 0.0);
                      }, child: Apptextwidget(fetchlocale(context).know_your_score,style: TxtStls.wstl14,))
                        ],
                      ),
                    ));
              })
          // ListView.separated(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //   shrinkWrap: true,
          //   separatorBuilder: (context, k) {
          //     return const SizedBox(
          //       height: 5,
          //     );
          //   },
          //   itemCount: fetchlocahealthassementlist(context).length,
          //   itemBuilder: (_, i) {
          //     final data = fetchlocahealthassementlist(context)[i];
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           height: 200,
          //           clipBehavior: Clip.antiAlias,
          //           decoration: BoxDecoration(
          //               border: Border.all(color: bgClr2),
          //               borderRadius: BorderRadius.circular(15),
          //               image: DecorationImage(
          //                   fit: BoxFit.fitWidth,
          //                   image: AssetImage(data["url"] as String))),
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Flexible(
          //               child: Apptextwidget(
          //                 data["title"] as String,
          //                 style: TxtStls.wstl16,
          //               ),
          //             ),
          //             ElevatedButton(onPressed: (){
          //               navigationSlide(context, data["page"],x: 1.0,y: 0.0);
          //             }, child: Apptextwidget(fetchlocale(context).know_your_score,style: TxtStls.wstl14,))
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Apptextwidget(
          //           data["descritpion"] as String,
          //           style: TxtStls.wstl12,
          //         )
          //       ],
          //     );
          //   }),
          ),
    );
  }
}

class CardDesignView extends StatefulWidget {
  const CardDesignView({super.key});
  @override
  State<CardDesignView> createState() => _CardDesignViewState();
}

class _CardDesignViewState extends State<CardDesignView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Container(
              height: 200,
              width: size.width,
              decoration: BoxDecoration(
                color: const Color(0xFF283d3b),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFF197278),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Healthasscard extends StatefulWidget {
  ImageProvider? provider;
  Widget? child;
  Healthasscard({super.key, this.provider, this.child});
  @override
  State<Healthasscard> createState() => _HealthasscardState();
}

class _HealthasscardState extends State<Healthasscard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.bottomRight,
              width: size.width,
              decoration: BoxDecoration(
                color: scaffoldbgcol,
                borderRadius: BorderRadius.circular(10),
              ),
              child: widget.child ?? const SizedBox.shrink(),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFF197278),
                  image: widget.provider != null
                      ? DecorationImage(
                          image: widget.provider!, fit: BoxFit.fitWidth)
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.35, size.height);
    path.quadraticBezierTo(
        size.width * 0.45, size.height * 0.3, size.width * 0.75, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close(); // Closing the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
