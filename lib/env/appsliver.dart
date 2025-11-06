// ignore_for_file: unused_element

import 'dart:math';

import 'package:XLcarez/Pages/NotificationView.dart';
import 'package:XLcarez/env/appexports.dart';
import 'package:intl/intl.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

SliverPersistentHeader appheader({minHeight, maxHeight, Widget? child}) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _SliverAppBarDelegate(
      minHeight: minHeight,
      maxHeight: maxHeight,
      child: Container(color: Colors.transparent, child: child),
    ),
  );
}

Widget mySliverAppBar(context) {
  return Consumer<Authcontroller>(builder: (context, authCtrl, child) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          // TextButton.icon(
          //   iconAlignment: IconAlignment.end,
          //   onPressed: () {
          //     navigationSlide(context, const VitalsAdd());
          //   },
          //   label: Apptextwidget(
          //     fetchlocale(context).vitals,
          //     style: TxtStls.wstl13,
          //   ),
          //   icon: CircleAvatar(
          //       radius: 10,
          //       backgroundColor: success,
          //       child: const Icon(
          //         Icons.add,
          //         color: scaffoldbgcol,
          //         size: 15.0,
          //       )),
          // ),
          IconButton(
                                        icon: Image.asset('assets/MediflixLogoTrans.png',width:200, height:35, fit: BoxFit.fitHeight, filterQuality: FilterQuality.high),
                                        onPressed: () {},
                                      ),
          CircleAvatar(
            backgroundColor: scaffoldbgcol,
            child: IconButton(
                onPressed: () {
                  authCtrl.scanqr(context);
                },
                icon: const Icon(
                  Icons.qr_code_scanner,
                  color: primary,
                  size: 20.0,
                )),
          ),
           
                                   
          // appspace(w: 5),
          // CircleAvatar(
          //   backgroundColor: scaffoldbgcol,
          //   child: IconButton(
          //       onPressed: () {
          //         navigationSlide(context, const Reaminders());
          //       },
          //       icon: const Icon(
          //         Icons.alarm,
          //         color: primary,
          //         size: 20.0,
          //       )),
          // ),
          appspace(w: 5),
          CircleAvatar(
            backgroundColor: scaffoldbgcol,
            child: IconButton(
                onPressed: () {
                  navigationSlide(context, const RequestsView());
                },
                icon: const Icon(
                  Icons.notifications_active,
                  color: primary,
                  size: 20.0,
                )),
          ),

          // GestureDetector(
          //     onTap: () {
          //      navigationSlide(context, const ProfileScreen());
          //     },
          //     child: networkImages(
          //         size: 60.0,
          //         url: authCtrl.userData?["image"] == "" ||
          //                 authCtrl.userData?["image"] == null
          //             ? avtharimg
          //             : "${asseturl}Users/${authCtrl.userData?["image"]}")),
          appspace(w: 10)
        ],
        titleSpacing: 15,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  navigationSlide(context, const ProfileScreen());
                },
                child: networkImages(
                    size: 50.0,
                    url: authCtrl.userData?["image"] == "" ||
                            authCtrl.userData?["image"] == null
                        ? avtharimg
                        : "${asseturl}Users/${authCtrl.userData?["image"]}")),
          ],
        ),
        floating: true,
        pinned: true,
        snap: true,
        stretch: true,
      ),
    );
  });
}

String fethdate(authCtrl) {
  try {
    return DateFormat("dd-MMM-yyyy,hh:mm a")
        .format(DateTime.parse(authCtrl.userData?["createdDate"] + "Z"));
  } catch (ex) {
    return "";
  }
}
