import 'package:XLcarez/env/appexports.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class Healthymepage extends StatefulWidget {
  const Healthymepage({super.key});

  @override
  State<Healthymepage> createState() => _HealthymepageState();
}

class _HealthymepageState extends State<Healthymepage> {
  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Consumer<Vitalscontroller>(builder: (context, ctrl, child) {
        return Scaffold(
          appBar: Themeappbar(
            title: "Healthy Me",
            leading: true,
          ),
          body: SizedBox(
            height: genratemediaquery(context).size.height,
            width: genratemediaquery(context).size.width,
            child: RefreshIndicator.adaptive(
                onRefresh: () async {
                  ctrl.healthme();
                },
                child: ctrl.uploadloading
                    ? loader()
                    : ctrl.uploadlist.isEmpty
                        ? const Nodatafound()
                        : GridView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            shrinkWrap: true,
                            itemCount: ctrl.uploadlist.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.8,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemBuilder: (_, i) {
                              final data = ctrl.uploadlist[i];
                              return GestureDetector(
                                onTap: (){
                                  navigationSlide(context, ViewFile(filetype: data.fileExtension!, filename: data.uploadedFileName!,isnavigationfale: true,));
                                },
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: bgClr1,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: GridTile(
                                      footer: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Center(
                                          child: Apptextwidget(
                                            data.title ?? "",
                                            style: TxtStls.stl14,
                                          ),
                                        ),
                                      ),
                                      header: SizedBox(
                                        height: 180.0,
                                        child: ViewFile(filename: data.uploadedFileName!,filetype: data.fileExtension!,),
                                      ),
                                      child: const SizedBox.shrink()),
                                ),
                              );
                            })),
          ),
        );
      }),
    );
  }
}

class ViewFile extends StatelessWidget {
  final String filetype;
  final String filename;
  final bool isnavigationfale;
  const ViewFile({super.key, required this.filetype, required this.filename,this.isnavigationfale=false});

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
        backgroundColor: transparentcol,
        appBar: isnavigationfale?Themeappbar(title: filename,leading: true,):null,
        body: SizedBox.expand(
          child: filetype == ".pdf"  
          ? IgnorePointer(
            ignoring: !isnavigationfale,
            child: const PDF(backgroundColor: transparentcol).cachedFromUrl(
                 "${asseturl}Docs/$filename",
                 placeholder: (progress) => Center(child: Apptextwidget('$progress %')),
                 errorWidget: (error) => const Center(child: Nodatafound()),
               ),
          )
              : Image.network(
                  "${asseturl}Docs/$filename",
                  fit: BoxFit.fitWidth,
                  errorBuilder:
                      (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      color: Colors.grey, // Placeholder color
                      child: const Icon(
                        Icons.image_sharp,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
