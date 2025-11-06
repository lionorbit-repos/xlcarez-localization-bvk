// ignore_for_file: prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:XLcarez/Pages/circlespage.dart';
import 'package:XLcarez/env/appexports.dart';

class Doctortabview extends StatefulWidget {
  const Doctortabview({super.key});

  @override
  State<Doctortabview> createState() => _DoctortabviewState();
}

class _DoctortabviewState extends State<Doctortabview>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2, initialIndex: index);
  }

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
        appBar: Themeappbar(
          title: fetchlocale(context).doctorse,
          act: [
            IconButton(
                onPressed: () async {
                  final ctrl =
                      Provider.of<Authcontroller>(context, listen: false);
                  ctrl.getallsoctors(id: await ctrl.fethuserid());
                  Provider.of<ConnectivityController>(context, listen: false)
                      .getAllConnections();
                },
                icon: const Icon(Icons.refresh,color: scaffoldbgcol,))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  onTap: (val) {
                    setState(() {
                      index = val;
                    });
                    //ctrl.change(val);
                  },
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  dividerColor: Colors.transparent,
                  labelStyle: TxtStls.themestyle13,
                  unselectedLabelColor: scaffoldbgcol,
                  unselectedLabelStyle: TxtStls.wstl13,
                  indicator: BoxDecoration(
                      color: scaffoldbgcol,
                      borderRadius: BorderRadius.circular(20)),
                  controller: tabController,
                  tabs: [
                     Tab(
                      child: Apptextwidget(
                      fetchlocale(context).doctorse,
                      ),
                    ),
                     Tab(
                      child: Apptextwidget(
                        fetchlocale(context).mycareteam
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: index == 0
                      ? const Doctorsview()
                      : ConnectionsViewAll(
                          title: "",
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
