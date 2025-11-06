// ignore_for_file: use_build_context_synchronously

import 'package:XLcarez/env/appexports.dart';

class WelcomeNote extends StatelessWidget {
  const WelcomeNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: genratemediaquery(context).size.height,
          width: genratemediaquery(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black, BlendMode.exclusion),
                  image: AssetImage(regiterlogo),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover)),
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(
              top: 50,
              right: 15,
              left: 15,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black.withValues(alpha:0.6),
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(logo,color: Colors.white,),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Welcome to XLcarez!",
                      style: TxtStls.wstl20,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Thank you for choosing XLcarez, your trusted partner in proactive health management. Our innovative app, powered by advanced Binah.ai technology, is designed to make health monitoring simple, accurate, and accessible.",
                      style: TxtStls.wstl13,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "With XLcarez, you can effortlessly track your vital signs in real time, gain valuable insights into your health, and receive personalized recommendations tailored to your wellness journey. Our goal is to empower you with the tools and information you need to take charge of your health.",
                      style: TxtStls.wstl13,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "As you embark on this journey, remember that while our AI-driven features provide valuable data, they are best used alongside professional medical advice. We encourage you to consult with your healthcare provider for any clinical assessments.",
                      style: TxtStls.wstl13,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Let’s take this step towards a healthier future together! Your health is our priority, and we’re here to support you every step of the way.",
                      style: TxtStls.wstl13,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Welcome aboard!",
                      style: TxtStls.wstl20,
                    ),
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar:
         fillButton(context, load: false, title: "Continue", onTap: () async {
           var box = await Hive.openBox('XLcarezstore');
         box.put('first',1);
              //       SharedPreferences sharedPreferences =
              // await SharedPreferences.getInstance();
              //       sharedPreferences.setInt("first", 1);
                    navigationSlideAndRemoveUntil(context, const Splash());
                  })
    );
  }
}

/*
SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topRight,child: SizedBox(height: 100,width: 100,child: Image.asset(logo),)),
              const SizedBox(height: 15,),
              Text("Welcome to XLcarez!",style: TxtStls.stl16,),
               const SizedBox(height: 15,),
              Text("Thank you for choosing XLcarez, your trusted partner in proactive health management. Our innovative app, powered by advanced Binah.ai technology, is designed to make health monitoring simple, accurate, and accessible.",style: TxtStls.stl14,),
              const SizedBox(height: 15,),
              Text("With XLcarez, you can effortlessly track your vital signs in real time, gain valuable insights into your health, and receive personalized recommendations tailored to your wellness journey. Our goal is to empower you with the tools and information you need to take charge of your health.",style: TxtStls.stl14,),
              const SizedBox(height: 15,),
              Text("As you embark on this journey, remember that while our AI-driven features provide valuable data, they are best used alongside professional medical advice. We encourage you to consult with your healthcare provider for any clinical assessments.",style: TxtStls.stl14,),
              const SizedBox(height: 15,),
              Text("Let’s take this step towards a healthier future together! Your health is our priority, and we’re here to support you every step of the way.",style: TxtStls.stl14,),
              const SizedBox(height: 15,),
              Text("Welcome aboard!",style: TxtStls.stl16,),
            ],
          ),
        ),
      ),
*/