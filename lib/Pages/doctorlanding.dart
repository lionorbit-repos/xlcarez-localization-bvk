import 'package:XLcarez/env/appexports.dart';

class Doctorlanding extends StatefulWidget {
  const Doctorlanding({super.key});

  @override
  State<Doctorlanding> createState() => _DoctorlandingState();
}

class _DoctorlandingState extends State<Doctorlanding> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final isfab = MediaQuery.of(context).viewInsets.bottom!=0;
    return Networkcheckwrapper(
      child: Scaffold(
        body: _items[index]["page"] as Widget,
        bottomNavigationBar: Visibility(
          visible: !isfab,
          child: BottomAppBar(
            height: 80,
            color: bgClr1,
            surfaceTintColor: bgClr1,
            clipBehavior: Clip.antiAlias,
            shape: const CircularNotchedRectangle(),
            notchMargin: 0.01,
            child: BottomNavigationBar(
                backgroundColor: bgClr1,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedItemColor: primary,
                unselectedItemColor: hintClr,
                currentIndex: index,
                onTap: (val) {
                  setState(() {
                    index = val;
                  });
                },
                items: _items
                    .asMap()
                    .entries
                    .map((r) => BottomNavigationBarItem(
                        activeIcon: null,
                        icon: r.value["icon"] as Widget,
                        label: fetchlabels(r.key)))
                    .toList()),
          ),
        ),
      ),
    );
  }

  String? fetchlabels(key) {
    var label = {
      0: fetchlocale(context).appointments,
      1: fetchlocale(context).patientse,
      2: fetchlocale(context).profile,
    };
    return label[key];
  }

  final _items = [
    {
      "icon": const ImageIcon(
        AssetImage(bottom6),
        size: 18.0,
      ),
      "page": const Appointmentsview(),
      "label": "Appointments"
    },
    {
      "icon": const ImageIcon(
        AssetImage(bottom8),
        size: 18.0,
      ),
      "page": const Center(
        child: Cliniciandasboard(),
      ),
      "label": "Patients"
    },
    {
      "icon": const ImageIcon(
        AssetImage(bottom9),
        size: 18.0,
      ),
      "page": const ProfileScreen(),
      "label": "Profile"
    },
  ];
}
