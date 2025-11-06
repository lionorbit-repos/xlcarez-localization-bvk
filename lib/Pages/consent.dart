import 'package:XLcarez/env/appexports.dart';

class Healthcareformview extends StatelessWidget {
  const Healthcareformview({super.key});

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Authcontroller>(builder: (context, ctrl, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              fetchlocale(context).healthcareconsentform,
              style: TxtStls.stl16,
              overflow: TextOverflow.visible,
            ),
            elevation: 0.0,
            centerTitle: false,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: bgClr2,
            scrolledUnderElevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(applogo),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).gdprcomliant,
                    style: TxtStls.stl16,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).xlcarezapllicationgdpr,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).introductione,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).thankyouforchoosing,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).purposeofdata,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).bysinging,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).healthcaremonitoring),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).providingpersonalized),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).researchanddevelopment),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).complaincewith),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).typesofdata,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).wayofcollect,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).vitalsignse),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).healthhistory),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).demographice),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).leagalbasis,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).weprocessyour,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).datatention,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).yourpersonaldata,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).datasharing,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).yourdatamaybe,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).healthcareprofession),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).researchinstitution),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).thirdpartysevice),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).yourrights,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).youhavethefollowing,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).therighttoacees),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).therighttorextify),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).therighttoearase),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).therighttorestrict),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).therighttodata),
                  const SizedBox(
                    height: 5,
                  ),
                  buuletpoints(fetchlocale(context).therighttowithdraw),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).contactinformation,
                    style: TxtStls.appstyle14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).ifyouhaveany,
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${fetchlocale(context).email}:Support@lionorbit.com",
                    style: TxtStls.appstyle12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fetchlocale(context).consente,
                    style: TxtStls.stl20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    fetchlocale(context).bywritingthename,
                    style: TxtStls.stl12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        fetchlocale(context).namee,
                        style: TxtStls.stl15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: 180,
                          child: TextField(
                            readOnly: true,
                            controller: TextEditingController.fromValue(
                                TextEditingValue(
                                    text:
                                        "${ctrl.firstnamecontroller.text} ${ctrl.lastnamecontroller.text}")),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    fetchlocale(context).thankyouforyourtrust,
                    style: TxtStls.stl14,
                  )
                ],
              ),
            ),
          )),
        );
      }),
    );
  }

  Row buuletpoints(val) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "●",
          style: TxtStls.appstyle12,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
            child: Text(
          val,
          style: TxtStls.appstyle12,
        )),
      ],
    );
  }
}
