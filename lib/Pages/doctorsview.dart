import 'package:XLcarez/env/appexports.dart';

class Doctorsview extends StatefulWidget {
  const Doctorsview({super.key});

  @override
  State<Doctorsview> createState() => _DoctorsviewState();
}

class _DoctorsviewState extends State<Doctorsview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authcontroller>(builder: (_, ctrl, child) {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            // Align(alignment: Alignment.topRight,child: ElevatedButton.icon(icon: Icon(Icons.add,color: bgClr1,),onPressed: (){}, label: Text("Add Doctor",style: TxtStls.wstl13,))),
            appspace(h: 10),
            ctrl.doctorsload
                ? loader()
                : ctrl.doctorslist.isEmpty
                    ? const Expanded(child: Nodatafound())
                    : Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: checkscreenwidth(
                                                genratemediaquery(context)
                                                    .size
                                                    .width) ==
                                            "Small"
                                        ? 1
                                        : checkscreenwidth(
                                                    genratemediaquery(context)
                                                        .size
                                                        .width) ==
                                                "Medium"
                                            ? 2
                                            : 3,
                                    childAspectRatio: checkscreenwidth(
                                                genratemediaquery(context)
                                                    .size
                                                    .width) ==
                                            "Small"
                                        ? 2.2
                                        : checkscreenwidth(
                                                    genratemediaquery(context)
                                                        .size
                                                        .width) ==
                                                "Medium"
                                            ? 2.45
                                            : 2.5),
                            itemCount: ctrl.doctorslist.length,
                            itemBuilder: (_, i) {
                              final data = ctrl.doctorslist[i];
                              return Card(
                                surfaceTintColor: fillcor,
                                color: fillcor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                              child: networkImages(
                                                  url: data.image == null ||
                                                          data.image == ""
                                                      ? avtharimg
                                                      : "${asseturl}Users/${data.image}",
                                                  size: 80.0)),
                                          appspace(w: 10),
                                          Flexible(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Apptextwidget(
                                                  'Dr. ${data.userName ?? ""}',
                                                  style: TxtStls.stl16,
                                                ),
                                                appspace(h: 5),
                                                Wrap(
                                                  children: data.specialitylist!
                                                      .asMap()
                                                      .entries
                                                      .map((u) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 5),
                                                            child:
                                                                Apptextwidget(
                                                              "${u.value.specialityName ?? ""}${u.key == data.specialitylist!.length - 1 ? "" : ","}",
                                                              style:
                                                                  TxtStls.stl13,
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                                // Text(
                                                //   dateformat(
                                                //       format:
                                                //           "dd MMM yyy,hh:mm a",
                                                //       vale: DateTime.parse(
                                                //           "${data.createdDate}Z")),
                                                //   style: TxtStls.stl12,
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      appspace(h: 10),
                                      GestureDetector(
                                        onTap: () {
                                          navigationSlide(
                                              context,
                                              Doctorprofile(
                                                doctorModel: data.userId,
                                              ));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 2),
                                          height: 40,
                                          width: genratemediaquery(context)
                                              .size
                                              .width,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: primary.withValues(
                                                  alpha: 0.6),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Apptextwidget(
                                            fetchlocale(context)
                                                .bookappointment,
                                            style: TxtStls.apnttextstl,
                                          )),
                                        ),
                                      ),
                                      //  ElevatedButton(onPressed: (){
                                      //   navigationSlide(context, Doctorprofile(doctorModel: data,));
                                      //  }, child: Text("Book Appointment",style: TxtStls.wstl12,))
                                    ],
                                  ),
                                ),
                              );
                            })),
          ],
        ),
      );
    });
  }
}
