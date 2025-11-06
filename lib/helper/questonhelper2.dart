import 'package:XLcarez/env/appexports.dart';

String fetchquestionslocalization(context, val) {
  var myquests = {
    "1.My motivation is lower when I am fatigued.":
        fetchlocale(context).mymotivation,
    "2.Exercise brings on my fatigue.": fetchlocale(context).extercisebrings,
    "3.I am easily fatigued.": fetchlocale(context).iameasilyfatigue,
    "4.Fatigue interferes with my physical functioning.":
        fetchlocale(context).fatigueinterface,
    " 5.Fatigue causes frequent problems for me.":
        fetchlocale(context).fatiguecauses,
    "6.My fatigue prevents sustained physical functioning.":
        fetchlocale(context).myfatigueprevents,
    "7.Fatigue interferes with carrying out certain duties and responsibilities.":
        fetchlocale(context).fatiqueinterfaceswith,
    "8.Fatigue is among my three most disabling symptoms.":
        fetchlocale(context).fatigueisamong,
    "9.Fatigue interferes with my work, family, or social life.":
        fetchlocale(context).fatigueinterfaceswithmy
  };
  return myquests[val] ?? "-";
}

/*
fatigueasseetment:

 "1.My motivation is lower when I am fatigued.",
    "2.Exercise brings on my fatigue.",
    "3.I am easily fatigued.",
    "4.Fatigue interferes with my physical functioning.",
    "5.Fatigue causes frequent problems for me.",
    "6.My fatigue prevents sustained physical functioning.",
    "7.Fatigue interferes with carrying out certain duties and responsibilities.",
    "8.Fatigue is among my three most disabling symptoms.",
    "9.Fatigue interferes with my work, family, or social life."
*/
