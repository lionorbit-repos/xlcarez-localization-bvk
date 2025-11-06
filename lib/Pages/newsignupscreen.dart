import '../env/appexports.dart';
part '../helper/signuphelper.dart';

class Newsignupscreen extends StatefulWidget {
  const Newsignupscreen({super.key});

  @override
  State<Newsignupscreen> createState() => _NewsignupscreenState();
}

class _NewsignupscreenState extends State<Newsignupscreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<Authcontroller>(context, listen: false).reset();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Authcontroller>(builder: (context, auth, child) {
      return MyThemeGradient(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            appBar: Themeappbar(
                leading: true,
                title: "",
                lead: IconButton(
                  onPressed: () {
                    loadback(context, auth: auth);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: fillcor,
                )),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset("assets/runninggirl.png", fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: loadkeys(context, auth: auth),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: loadtrack(context, auth: auth),
                  ),
                )
              ],
            )),
      );
    });
  }
}
