import 'package:XLcarez/env/appexports.dart';

fetchquestionsloc(context, val) {
  //log(val);
  var myquest = {
    "Only white European": fetchlocale(context).daiques,
    "Other ethnic group": fetchlocale(context).diaques1,
    "Yes": fetchlocale(context).yes,
    "No": fetchlocale(context).no,
    "<90cm (35.3in)": fetchlocale(context).daiques5opt1,
    "90-99.9cm (35.4-39.3in)": fetchlocale(context).size1,
    "100-109.9cm (39.4in-42.9in)": fetchlocale(context).size2,
    "110cm (43in) or above": fetchlocale(context).size3,
    "Not at all": fetchlocale(context).depop1,
    "Several days": fetchlocale(context).depop2,
    "More than half the days": fetchlocale(context).depop3,
    "Nearly everyday": fetchlocale(context).depop4,
  };
  return myquest[val] ?? "-";
}

fetchlocalmylist(context, val) {
  var mylist = {
    "Patient": fetchlocale(context).patienteee,
    "Proxy": fetchlocale(context).proxye
  };
  return mylist[val] ?? "-";
}

/*
"Not at all",
    "Several days",
    "More than half the days",
    "Nearly everyday"
*/

fetchtitles(context, val) {
  var data = {
    "Email": fetchlocale(context).email,
    "Password": fetchlocale(context).pwd,
    "Pay Later": fetchlocale(context).payLater,
    "Pay Now": fetchlocale(context).payNow,
    "Invalid Orientation": fetchlocale(context).invalidOrientation,
    "Face Not Detected": fetchlocale(context).faceNotDetected,
    "Titled Head": fetchlocale(context).titledHead,
    "You are Too Far": fetchlocale(context).youAreTooFar,
    "Uneven Lighting": fetchlocale(context).unevenLighting,
  };
  return data[val] ?? "-";
}

fethvitalsdata(context, val) {
  var data = {
    "Pulse Rate": fetchlocale(context).pulserate,
    "Respiration Rate": fetchlocale(context).respirationrate,
    "Stress Index": fetchlocale(context).stressindex,
    "Oxygen Saturation": fetchlocale(context).oxygensaturation,
    "oxygenSaturation": fetchlocale(context).oxygensaturation,
    "Blood Pressure": fetchlocale(context).bloodpressure,
    "Wellness Index": fetchlocale(context).wellnessindex,
    "Stress Level": fetchlocale(context).stresslevel,
    "Wellness Level": fetchlocale(context).wellnessindex,
    "Hemoglobin A1C": fetchlocale(context).hemoglobina1c,
    "Hemoglobin": fetchlocale(context).hemoglobin,
    "Temperature": fetchlocale(context).temperature,
    "Sugar": fetchlocale(context).sugar,
    "Cholesterol": fetchlocale(context).cholesterol
  };
  return data[val] ?? "-";
}

fetchlabel(context, val) {
  var map = {
    "Vitals": fetchlocale(context).vitals,
    "Food Log": fetchlocale(context).flog,
    "Medication": fetchlocale(context).medication,
    "Clinician Notes": fetchlocale(context).clinicainnotes,
    "Recommendation": fetchlocale(context).recomed,
  };
  return map[val];
}

dynamic fetchlevels(context, val) {
  //print(val.toString());
  var data = {
    "high": fetchlocale(context).high,
    "High": fetchlocale(context).high,
    "mild": fetchlocale(context).mild,
    "Mild": fetchlocale(context).mild,
    "normal": fetchlocale(context).normal,
    "Normal": fetchlocale(context).normal,
    "medium": fetchlocale(context).medium,
    "Medium": fetchlocale(context).medium,
    "low": fetchlocale(context).low,
    "Low": fetchlocale(context).low,
    "The accuracy range currently is  3-8, and under R&D":
        fetchlocale(context).accuracyRange,
    "Men: 14 to 18 g/dL \nWomen: 12 to 16 g/dL for Hemoglobin":
        fetchlocale(context).hemoglobin_text,
    "Low Risk": fetchlocale(context).cardiokeys1,
    "Moderate Risk": fetchlocale(context).cardiokeys2,
    "High Risk": fetchlocale(context).cardiokeys3,
    "Very High Risk": fetchlocale(context).cardiokeys4,
    "Increased Risk": fetchlocale(context).increasedrisk,
    "Established Cardiovascular Disease": fetchlocale(context).cardiokeys5,
    "None": fetchlocale(context).depression_keys1,
    "Severe Depression": fetchlocale(context).depression_keys5,
    "Mild Depression": fetchlocale(context).depression_keys2,
    "Moderate Depression": fetchlocale(context).depression_keys3,
    "Moderately Severe Depression": fetchlocale(context).depression_keys4,
    "extreme": fetchlocale(context).extreme,
    "Extreme": fetchlocale(context).extreme,
    "Hypothermia": fetchlocale(context).hypthermia,
    "Fever": fetchlocale(context).fever,
    "Pre-diabetes": fetchlocale(context).predia,
    "Diabetes": fetchlocale(context).diabetes,
    "Predaibetesrisk": fetchlocale(context).prediarisk,
    "Daibetesrisk": fetchlocale(context).diaberisk,
    "You are not anemic": fetchlocale(context).notanemic,
    "You are anemic.": fetchlocale(context).anemic
  };
  return data[val] != null ? (data[val].toString().capitalize()) : val ?? "";
}

fetcherrortext(context, val) {
  var data = {
    "Email": fetchlocale(context).email_error,
    "Password": fetchlocale(context).pass_error,
    "Weight in kg should be within the range of 40 to 150 kg":
        fetchlocale(context).weightrangeerror,
    "Height in cm should be within the range of 130 to 230 centimeters":
        fetchlocale(context).heightrangeerror,
    "Weight in lbs should be within the range of 88 to 330 lbs":
        fetchlocale(context).weighterrorlbs
  };
  return data[val] ?? "-";
}

fetchloacalestatus(context, status) {
  var mapstaus = {
    "Waitlisted": fetchlocale(context).waitlisted,
    "Checkin": fetchlocale(context).checkin,
    "Completed": fetchlocale(context).completed,
    "Confirmed": fetchlocale(context).confirmed,
  };
  return mapstaus[status];
}

fetchlocaloptionfatigue(context, val) {
  var data = {
    "Strongly disagree": fetchlocale(context).fatsopt1,
    "Disagree": fetchlocale(context).fatsopt2,
    "Slightly disagree": fetchlocale(context).fatsopt3,
    "Neither agree or disagree": fetchlocale(context).fatsopt4,
    "Slightly agree": fetchlocale(context).fatsopt5,
    "Agree": fetchlocale(context).fatsopt6,
    "Strongly agree": fetchlocale(context).fatsopt7,
  };
  return data[val];
}

fetchlocaloptionsleep(context, val) {
  var data = {
    "Never": fetchlocale(context).sleep_a1,
    "Slight": fetchlocale(context).sleep_a2,
    "Moderate": fetchlocale(context).sleep_a3,
    "High": fetchlocale(context).sleep_a4,
  };
  return data[val];
}

fetchrisklevel(context, val) {
  var data = {
    "Increased Risk": fetchlocale(context).increasedrisk,
    "Low Risk": fetchlocale(context).cardiokeys1,
    "Moderate Risk": fetchlocale(context).cardiokeys2,
    "High Risk": fetchlocale(context).cardiokeys3,
    "Very High Risk": fetchlocale(context).cardiokeys4,
    "Established Cardiovascular Disease": fetchlocale(context).cardiokeys5,
    "None": fetchlocale(context).depression_keys1,
    "Mild Depression": fetchlocale(context).depression_keys2,
    "Moderate Depression": fetchlocale(context).depression_keys3,
    "Moderate Severe Depression": fetchlocale(context).depression_keys4,
    "Severe Depression": fetchlocale(context).depression_keys5,
    "Obesity": fetchlocale(context).obesity,
    "Normal weight": fetchlocale(context).n_weight,
    "Underweight": fetchlocale(context).u_weight,
    "Overweight": fetchlocale(context).o_weight,
  };
  return data[val] ?? "-";
}

fetchrisktitles(context, val) {
  var titles = {
    "Diabetic": fetchlocale(context).diabetic,
    "Cardiac": fetchlocale(context).cardiac,
    "Obesity": fetchlocale(context).obesity,
  };
  return titles[val] ?? "-";
}

String calculateWeight({
  required String val,
  required String inputForm,
  required String outputForm,
}) {
  // debugPrint("$inputForm - $outputForm $val");
  if(val!=""){
    var inputval = double.tryParse(val) ?? 0.0;
  if (inputForm == outputForm) {
    return val;
  }

  if (inputForm == "kg" && outputForm == "lb") {
    return ((inputval * 2.20462)).toStringAsFixed(2);
  } else if (inputForm == "lb" && outputForm == "kg") {
    return ((inputval / 2.20462)).toStringAsFixed(2);
  } else {
    return "";
  }
  }else{
    return "";
  }
}

String calculateHeight({
  required String val,
  required String inputForm,
  required String outputForm,
}) {
  if (val != "") {
    double inputVal = double.tryParse(val) ?? 0.0;

    if (inputForm == outputForm) {
      return val;
    }

    if (inputForm == "cms" && outputForm == "feet/inch") {
      double totalInches = inputVal / 2.54;
      int feet = totalInches ~/ 12;
      int inches = (totalInches % 12).round();
      return "$feet.$inches";
    } else if (inputForm == "feet/inch" && outputForm == "cms") {
      var feet = inputVal.toString().split(".")[0];
      var inch = inputVal.toString().split(".")[1];
      // 'val' should be total inches (e.g., 5'7" = 67 inches = "67")
      double cm = (((double.tryParse(feet) ?? 1.0) * 12) +
              (double.tryParse(inch) ?? 0.0)) *
          2.54;
      return (cm.round()).toString();
    } else {
      return "";
    }
  } else {
    return "";
  }
}

List<Map<String, Object>> fetchlocahealthassementlist(context) {
  final loc = Provider.of<Localizationcontroller>(context, listen: false);
  if (loc.locale == const Locale("en")) {
    return [
      {
        "title": "Sleep Scale Assessment",
        "url": "assets/sleepscale.png",
        "page": const Sleepassesment(),
        "descritpion": """
Epworth scale is used for a general assessment of sleepiness problems; we still need to perform the diagnostic process that should lead us to the core of the issue. Remember — excessive doziness can be a sign of severe health problems!

Diseases and disorders that may cause excessive sleepiness during the day:

Narcolepsy — a neurological disorder which symptoms include cataplexy (sudden loss of muscle control), excessive sleepiness and falling asleep in random places, hallucinations and sleep paralysis present when a person is waking up or falling asleep.

Sleep apnea — a disease usually caused by excessive weight and a large neck circumference. When a person affected by the disease is asleep, their muscles lose the tension, and the airways get blocked — the person's still breathing, but the air cannot get through, which results in a feeling of choking/snoring, and subsequent waking up. This situation may take place several times per hour(!). The patient is usually not aware of these little interruptions during the night's sleep, and the only clinical symptom is excessive sleepiness during the day.

The disease, if not treated, may lead to arterial hypertension or neurological and heart problems. 💔

Depression and other serious psychiatric diseases — excessive sleepiness might be a direct sign of ongoing psychiatric illness. Even up to 80% of people with depression have insomnia and an altered day-night cycle.

Restless legs syndrome — weird, painful feeling in legs that goes away with movement. Patients stay awake during the night because they can't stay still.

Diabetes

Parkinson's disease, multiple sclerosis, or other neurological disorders.

Asthma — signs and symptoms of asthma usually appear during the night, when falling asleep and waking up.
"""
      },
      {
        "title": "Fatigue Assessment",
        "url": "assets/fatigue.jpg",
        "page": const Fatigueassesment(),
        "descritpion": """
What is the fatigue severity scale (FSS) assessment?
Let's start from the beginning — what are the symptoms of fatigue? The symptoms of fatigue include:

Chronic feelings of exhaustion and tiredness.
Lack of motivation.
Anxiety and irritability.
Dizziness.
Sleep distrubances.
Cognitive disturbances, such as memory problems, lack of focus, and concentration.
Impaired decision-making.
Muscle weakness and pain and
Slowed reflexes.

Conditions such as multiple sclerosis, systemic lupus erythematosus, arthritis, stroke, and fibromyalgia are often accompanied by fatigue. Fatigue involves many physical, mental, and emotional symptoms that can significantly affect one's quality of life. Hence, assessing the severity of it can be crucial for determining the appropriate treatment plan.

"""
      },
      {
        "title": "Adherence Assessment",
        "url": "assets/hivassesment.jpg",
        "page": const HIVASESForm(),
        "descritpion": """
 About the Assessment
 The HIV Adherence Self-Efficacy Scale (HIV-ASES) is designed to measure an individual's confidence in adhering to HIV treatment regimens. The assessment consists of 12 items that evaluate a person's ability to integrate treatment into their daily routine and persevere through challenges such as side effects, lifestyle changes, and social stigma. Each item is rated on a scale from 0 to 10, where higher scores indicate greater confidence in adherence. 
 The assessment provides three key scores: the Total Score, which represents overall adherence self-efficacy, the Integration Score, which measures how well an individual incorporates treatment into their daily life, and the Perseverance Score, which evaluates their ability to stay committed to treatment despite difficulties. These scores help healthcare providers and individuals identify areas where additional support may be needed to improve treatment adherence and overall health outcomes. The HIV-ASES is a valuable tool in both clinical and research settings for monitoring adherence behavior and guiding interventions.
"""
      }
    ];
  } else if (loc.locale == const Locale("fr")) {
    return [
      {
        "title": "Évaluation de l'échelle de sommeil",
        "url": "assets/sleepscale.png",
        "page": const Sleepassesment(),
        "descritpion": """
L'échelle d'Epworth est utilisée pour une évaluation générale des problèmes de somnolence ; nous devons néanmoins réaliser le processus diagnostique qui devrait nous mener à l'origine du problème. Rappelez-vous : une somnolence excessive peut être un signe de graves problèmes de santé !

Maladies et troubles pouvant causer une somnolence excessive durant la journée :

Narcolepsie – un trouble neurologique dont les symptômes incluent la cataplexie (perte soudaine du contrôle musculaire), une somnolence excessive, des endormissements dans des endroits aléatoires, des hallucinations et des paralysies du sommeil survenant au réveil ou à l’endormissement.

Apnée du sommeil – une maladie généralement causée par un excès de poids et un tour de cou important. Lorsque la personne affectée dort, ses muscles perdent leur tonus, et les voies respiratoires se bloquent. La personne continue de respirer, mais l'air ne peut pas passer, ce qui provoque une sensation d'étouffement/de ronflement, suivie d'un réveil. Cette situation peut se produire plusieurs fois par heure(!). Le patient n'est généralement pas conscient de ces petites interruptions pendant la nuit, et le seul symptôme clinique est une somnolence excessive pendant la journée.

Si cette maladie n'est pas traitée, elle peut entraîner une hypertension artérielle ou des problèmes neurologiques et cardiaques. 💔

Dépression et autres maladies psychiatriques graves – une somnolence excessive peut être un signe direct d'une maladie psychiatrique en cours. Jusqu'à 80 % des personnes souffrant de dépression présentent de l'insomnie et un cycle veille-sommeil altéré.

Syndrome des jambes sans repos – sensation étrange et douloureuse dans les jambes qui disparaît avec le mouvement. Les patients restent éveillés la nuit car ils ne peuvent pas rester immobiles.

Diabète

Maladie de Parkinson, sclérose en plaques ou autres troubles neurologiques.

Asthme – les signes et symptômes de l’asthme apparaissent souvent la nuit, lors de l’endormissement ou au réveil.
"""
      },
      {
        "title": "Évaluation de la fatigue",
        "url": "assets/fatigue.jpg",
        "page": const Fatigueassesment(),
        "descritpion": """
Qu'est-ce que l'évaluation de l'échelle de sévérité de la fatigue (FSS) ?
Commençons par le début — quels sont les symptômes de la fatigue ? Les symptômes de la fatigue comprennent :

Un sentiment chronique d'épuisement et de fatigue ;
Un manque de motivation ;
De l'anxiété et de l'irritabilité ;
Des étourdissements ;
Des troubles du sommeil ;
Des troubles cognitifs, tels que des problèmes de mémoire, un manque de concentration et d'attention ;
Une prise de décision altérée ;
Une faiblesse musculaire et des douleurs ;
Des réflexes ralentis.
Des conditions telles que la sclérose en plaques, le lupus érythémateux systémique, l'arthrite, l'accident vasculaire cérébral (AVC) et la fibromyalgie sont souvent accompagnées de fatigue. La fatigue englobe de nombreux symptômes physiques, mentaux et émotionnels qui peuvent affecter de manière significative la qualité de vie. Par conséquent, évaluer la gravité de la fatigue peut être essentiel pour déterminer le plan de traitement approprié.

"""
      },
      {
        "title": "Évaluation de l'adhésion",
        "url": "assets/hivassesment.jpg",
        "page": const HIVASESForm(),
        "descritpion": """
    À propos de l'évaluation
    L'Échelle d'Auto-efficacité à l'Adhésion au VIH (HIV-ASES) est conçue pour mesurer la confiance d'un individu dans son adhésion aux traitements contre le VIH. L'évaluation comprend 12 éléments qui évaluent la capacité d'une personne à intégrer le traitement dans sa routine quotidienne et à surmonter des défis tels que les effets secondaires, les changements de mode de vie et la stigmatisation sociale. Chaque élément est noté sur une échelle de 0 à 10, où des scores plus élevés indiquent une plus grande confiance en l'adhésion.
    L'évaluation fournit trois scores clés : le Score Total, qui représente l'auto-efficacité globale en matière d'adhésion, le Score d'Intégration, qui mesure la capacité d'un individu à intégrer le traitement dans sa vie quotidienne, et le Score de Persévérance, qui évalue sa capacité à rester engagé malgré les difficultés. Ces scores aident les professionnels de santé et les patients à identifier les domaines nécessitant un soutien supplémentaire pour améliorer l'adhésion au traitement et les résultats de santé globaux. L'HIV-ASES est un outil précieux en clinique et en recherche pour surveiller l'adhésion au traitement et guider les interventions.
    """
      }
    ];
  } else if (loc.locale == const Locale("de")) {
    return [
      {
        "title": "Bewertung der Schlafskala",
        "url": "assets/sleepscale.png",
        "page": const Sleepassesment(),
        "descritpion": """
Die Epworth-Skala wird für eine allgemeine Bewertung von Problemen mit Schläfrigkeit verwendet; dennoch müssen wir den diagnostischen Prozess durchführen, der uns zur Ursache des Problems führen sollte. Denken Sie daran – übermäßige Schläfrigkeit kann ein Zeichen für schwerwiegende Gesundheitsprobleme sein!

Krankheiten und Störungen, die tagsüber übermäßige Schläfrigkeit verursachen können:

Narkolepsie – eine neurologische Störung, deren Symptome Kataplexie (plötzlicher Verlust der Muskelkontrolle), übermäßige Schläfrigkeit und Einschlafen an zufälligen Orten, Halluzinationen sowie Schlaflähmungen beim Aufwachen oder Einschlafen umfassen.

Schlafapnoe – eine Krankheit, die meist durch Übergewicht und einen großen Halsumfang verursacht wird. Wenn eine betroffene Person schläft, verlieren die Muskeln ihre Spannung und die Atemwege werden blockiert – die Person atmet weiterhin, aber die Luft kann nicht hindurchströmen. Dies führt zu einem Gefühl des Erstickens/Schnarchens und anschließendem Aufwachen. Diese Situation kann mehrmals pro Stunde(!) auftreten. Der Patient bemerkt diese kleinen Unterbrechungen des Schlafs in der Nacht meist nicht, und das einzige klinische Symptom ist übermäßige Schläfrigkeit am Tag.

Wenn die Krankheit nicht behandelt wird, kann sie zu arterieller Hypertonie oder neurologischen und Herzproblemen führen. 💔

Depression und andere schwere psychiatrische Erkrankungen – übermäßige Schläfrigkeit kann ein direktes Zeichen für eine bestehende psychiatrische Erkrankung sein. Bis zu 80 % der Menschen mit Depressionen haben Schlaflosigkeit und einen gestörten Tag-Nacht-Rhythmus.

Restless-Legs-Syndrom – seltsame, schmerzhafte Empfindungen in den Beinen, die durch Bewegung verschwinden. Die Patienten bleiben nachts wach, weil sie nicht still bleiben können.

Diabetes

Morbus Parkinson, Multiple Sklerose oder andere neurologische Störungen.

Asthma – Anzeichen und Symptome von Asthma treten oft in der Nacht auf, beim Einschlafen oder Aufwachen.
"""
      },
      {
        "title": "Fatiguebewertung",
        "url": "assets/fatigue.jpg",
        "page": const Fatigueassesment(),
        "descritpion": """
Was ist die Bewertung der Fatigue Severity Scale (FSS)?
Fangen wir von vorne an – was sind die Symptome von Müdigkeit? Die Symptome von Müdigkeit umfassen:

Chronische Gefühle von Erschöpfung und Müdigkeit;
Mangel an Motivation;
Angst und Reizbarkeit;
Schwindel;
Schlafstörungen;
Kognitive Beeinträchtigungen, wie Gedächtnisprobleme, mangelnde Konzentration und Aufmerksamkeit;
Beeinträchtigte Entscheidungsfindung;
Muskelschwäche und Schmerzen;
Verlangsamte Reflexe.
Erkrankungen wie Multiple Sklerose, systemischer Lupus erythematodes, Arthritis, Schlaganfall und Fibromyalgie gehen oft mit Müdigkeit einher. Müdigkeit umfasst viele physische, mentale und emotionale Symptome, die die Lebensqualität erheblich beeinträchtigen können. Daher kann die Bewertung ihrer Schwere entscheidend sein, um den geeigneten Behandlungsplan zu bestimmen.

"""
      },
      {
        "title": "Bewertung der Therapietreue",
        "url": "assets/hivassesment.jpg",
        "page": const HIVASESForm(),
        "descritpion": """
    Über die Bewertung
    Die HIV-Adhärenz-Selbsteffizienzmessung (HIV-ASES) wurde entwickelt, um das Vertrauen einer Person in die Einhaltung von HIV-Behandlungsplänen zu messen. Die Bewertung umfasst 12 Fragen, die die Fähigkeit einer Person bewerten, die Behandlung in ihren Alltag zu integrieren und Herausforderungen wie Nebenwirkungen, Lebensstiländerungen und soziale Stigmatisierung zu bewältigen. Jede Frage wird auf einer Skala von 0 bis 10 bewertet, wobei höhere Werte auf ein höheres Vertrauen in die Adhärenz hinweisen.
    Die Bewertung liefert drei Hauptwerte: den Gesamtwert, der die allgemeine Selbstwirksamkeit in Bezug auf die Adhärenz misst, den Integrationswert, der zeigt, wie gut eine Person die Behandlung in ihr tägliches Leben integriert, und den Durchhaltewert, der die Fähigkeit misst, trotz Schwierigkeiten am Behandlungsplan festzuhalten. Diese Werte helfen Gesundheitsdienstleistern und Einzelpersonen, Bereiche zu identifizieren, in denen zusätzliche Unterstützung erforderlich sein könnte, um die Therapietreue und die allgemeinen Gesundheitsresultate zu verbessern. Der HIV-ASES ist ein wertvolles Instrument in der klinischen und wissenschaftlichen Praxis zur Überwachung des Adhärenzverhaltens und zur Steuerung von Interventionen.
    """
      }
    ];
  } else if (loc.locale == const Locale("ar")) {
    return [
      {
        "title": "تقييم مقياس النوم",
        "url": "assets/sleepscale.png",
        "page": const Sleepassesment(),
        "descritpion": """
يتم استخدام مقياس إيبورث لتقييم مشكلات النعاس بشكل عام؛ ومع ذلك، يجب علينا إجراء عملية تشخيصية تقودنا إلى سبب المشكلة. تذكر - قد يكون النعاس المفرط علامة على مشاكل صحية خطيرة!

الأمراض والاضطرابات التي يمكن أن تسبب النعاس المفرط خلال النهار:

النعاس – اضطراب عصبي تتضمن أعراضه فقدان مفاجئ للسيطرة على العضلات، النعاس المفرط، والنوم في أماكن غير متوقعة، والهلاوس، وكذلك شلل النوم عند الاستيقاظ أو النوم.

انقطاع النفس أثناء النوم – مرض عادة ما يكون نتيجة لزيادة الوزن وحجم الرقبة الكبير. عند النوم، تفقد العضلات توترها ويتم حظر المسالك التنفسية - الشخص يواصل التنفس ولكن الهواء لا يمكنه المرور. يؤدي ذلك إلى شعور بالاختناق/الشخير والاستيقاظ لاحقًا. قد يحدث هذا عدة مرات في الساعة (!) المريض لا يلاحظ هذه الانقطاعات الصغيرة في النوم غالبًا، والأعراض السريرية الوحيدة هي النعاس المفرط أثناء النهار.

إذا لم يتم علاج المرض، فقد يؤدي إلى ارتفاع ضغط الدم أو مشاكل عصبية وقلبية. 💔

الاكتئاب وغيره من الأمراض النفسية الشديدة – قد يكون النعاس المفرط علامة مباشرة على وجود مرض نفسي قائم. حتى 80% من الأشخاص المصابين بالاكتئاب يعانون من الأرق واضطراب في نمط النوم واليقظة.

متلازمة الساقين القلقة – إحساس غريب ومؤلم في الساقين يختفي مع الحركة. يبقى المرضى مستيقظين في الليل لأنهم لا يستطيعون البقاء ساكنين.

داء السكري

مرض باركنسون، التصلب المتعدد أو الاضطرابات العصبية الأخرى.

الربو – تظهر علامات وأعراض الربو غالبًا في الليل، عند النوم أو الاستيقاظ.
"""
      },
      {
        "title": "تقييم التعب",
        "url": "assets/fatigue.jpg",
        "page": const Fatigueassesment(),
        "descritpion": """
ما هو تقييم مقياس شدة التعب (FSS)؟
لنبدأ من البداية – ما هي أعراض التعب؟ تشمل أعراض التعب:

مشاعر مزمنة من الإرهاق والتعب;
نقص في الدافع;
القلق والعصبية;
الدوار;
اضطرابات النوم;
ضعف في الإدراك، مثل مشاكل في الذاكرة، نقص التركيز والانتباه;
تأثير على اتخاذ القرارات;
ضعف العضلات والألم;
بطء ردود الفعل.
الأمراض مثل التصلب المتعدد، الذئبة الحمراء المجموعية، التهاب المفاصل، السكتة الدماغية، والألم العضلي الليفي غالبًا ما ترتبط بالتعب. يشمل التعب العديد من الأعراض الجسدية والعقلية والعاطفية التي قد تؤثر بشكل كبير على جودة الحياة. لذلك، يمكن أن يكون تقييم شدتها أمرًا حاسمًا لتحديد خطة العلاج المناسبة.
"""
      },
      {
        "title": "تقييم الالتزام",
        "url": "assets/hivassesment.jpg",
        "page": const HIVASESForm(),
        "descritpion": """
    حول التقييم
    مقياس الكفاءة الذاتية للالتزام بفيروس نقص المناعة البشرية (HIV-ASES) مصمم لقياس ثقة الفرد في الالتزام بأنظمة علاج فيروس نقص المناعة البشرية. يتكون التقييم من 12 عنصرًا تقيم قدرة الشخص على دمج العلاج في روتينه اليومي والتغلب على التحديات مثل الآثار الجانبية، وتغيير نمط الحياة، والوصمة الاجتماعية. يتم تصنيف كل عنصر على مقياس من 0 إلى 10، حيث تشير الدرجات الأعلى إلى ثقة أكبر في الالتزام بالعلاج.
    يوفر التقييم ثلاثة درجات رئيسية: الدرجة الإجمالية، التي تمثل الكفاءة الذاتية العامة للالتزام، ودرجة الاندماج، التي تقيس مدى دمج الفرد للعلاج في حياته اليومية، ودرجة المثابرة، التي تقيم قدرته على الالتزام بالعلاج رغم الصعوبات. تساعد هذه الدرجات مقدمي الرعاية الصحية والأفراد في تحديد المجالات التي قد تحتاج إلى دعم إضافي لتحسين الالتزام بالعلاج وتحقيق نتائج صحية أفضل. يعد مقياس HIV-ASES أداة قيمة في البيئات السريرية والبحثية لمراقبة سلوك الالتزام وتوجيه التدخلات.
    """
      }
    ];
  } else if (loc.locale == const Locale("it")) {
    return [
      {
        "title": "Valutazione della Scala del Sonno",
        "url": "assets/sleepscale.png",
        "page": const Sleepassesment(),
        "descritpion": """
La Scala di Epworth viene utilizzata per una valutazione generale dei problemi di sonnolenza; tuttavia, dobbiamo eseguire il processo diagnostico che dovrebbe portarci alla causa del problema. Ricorda – la sonnolenza eccessiva può essere un segno di gravi problemi di salute!

Malattie e disturbi che possono causare sonnolenza eccessiva durante il giorno:

Narcolessia – un disturbo neurologico i cui sintomi includono cataplessia (perdita improvvisa del controllo muscolare), sonnolenza eccessiva, addormentarsi in luoghi casuali, allucinazioni e paralisi del sonno al risveglio o durante il sonno.

Apnea notturna – una malattia che di solito è causata da sovrappeso e grande circonferenza del collo. Quando una persona affetta dorme, i muscoli perdono il loro tono e le vie aeree vengono bloccate – la persona continua a respirare, ma l'aria non riesce a passare. Questo porta a una sensazione di soffocamento/russamento e successivo risveglio. Questa situazione può verificarsi più volte all'ora (!) Il paziente di solito non nota queste piccole interruzioni del sonno durante la notte e l'unico sintomo clinico è la sonnolenza eccessiva durante il giorno.

Se la malattia non viene trattata, può portare a ipertensione arteriosa o problemi neurologici e cardiaci. 💔

Depressione e altri disturbi psichiatrici gravi – la sonnolenza eccessiva può essere un segno diretto di un disturbo psichiatrico esistente. Fino all'80% delle persone con depressione soffre di insonnia e di un ciclo sonno-veglia alterato.

Sindrome delle gambe senza riposo – sensazioni strane e dolorose nelle gambe che scompaiono con il movimento. I pazienti rimangono svegli di notte perché non riescono a stare fermi.

Diabete

Morbo di Parkinson, sclerosi multipla o altri disturbi neurologici.

Asma – i segni e i sintomi dell'asma si manifestano spesso di notte, durante il sonno o al risveglio.
"""
      },
      {
        "title": "Valutazione della Fatigue",
        "url": "assets/fatigue.jpg",
        "page": const Fatigueassesment(),
        "descritpion": """
Cos'è la valutazione della Fatigue Severity Scale (FSS)?
Cominciamo da capo – quali sono i sintomi della stanchezza? I sintomi della stanchezza includono:

Sensazioni croniche di esaurimento e stanchezza;
Mancanza di motivazione;
Ansia e irritabilità;
Vertigini;
Disturbi del sonno;
Compromissione cognitiva, come problemi di memoria, difficoltà di concentrazione e attenzione;
Difficoltà nella presa di decisioni;
Debolezza muscolare e dolore;
Riflessi rallentati.
Malattie come la sclerosi multipla, il lupus eritematoso sistemico, l'artrite, l'ictus e la fibromialgia sono spesso accompagnate dalla stanchezza. La stanchezza include molti sintomi fisici, mentali ed emotivi che possono influire notevolmente sulla qualità della vita. Pertanto, la valutazione della sua gravità può essere decisiva per determinare il piano di trattamento appropriato.
"""
      },
      {
        "title": "Valutazione dell'aderenza",
        "url": "assets/hivassesment.jpg",
        "page": const HIVASESForm(),
        "descritpion": """
    Informazioni sulla valutazione
    La Scala di Autoefficacia per l'Aderenza all'HIV (HIV-ASES) è progettata per misurare la fiducia di un individuo nel seguire i regimi di trattamento dell'HIV. La valutazione è composta da 12 elementi che valutano la capacità di una persona di integrare il trattamento nella routine quotidiana e di affrontare sfide come effetti collaterali, cambiamenti nello stile di vita e stigma sociale. Ogni elemento è valutato su una scala da 0 a 10, dove punteggi più alti indicano una maggiore fiducia nell'aderenza.
    La valutazione fornisce tre punteggi chiave: il Punteggio Totale, che rappresenta l'autoefficacia complessiva nell'aderenza, il Punteggio di Integrazione, che misura come un individuo incorpora il trattamento nella propria vita quotidiana, e il Punteggio di Perseveranza, che valuta la capacità di rimanere fedele al trattamento nonostante le difficoltà. Questi punteggi aiutano gli operatori sanitari e i pazienti a identificare le aree in cui potrebbe essere necessario un ulteriore supporto per migliorare l'aderenza al trattamento e i risultati di salute. L'HIV-ASES è uno strumento prezioso sia in ambito clinico che di ricerca per monitorare il comportamento di aderenza e guidare le strategie di intervento.
    """
      }
    ];
  } else if (loc.locale == const Locale("uk")) {
    return [
      {
        "title": "Оцінка шкали сну",
        "url": "assets/sleepscale.png",
        "page": const Sleepassesment(),
        "descritpion": """
Шкала Епворта використовується для загальної оцінки проблем зі сном, однак необхідно провести діагностичний процес, щоб визначити основну причину проблеми. Пам’ятайте — надмірна сонливість може бути ознакою серйозних проблем зі здоров’ям!  

Захворювання та розлади, які можуть спричиняти надмірну сонливість протягом дня:  

- **Нарколепсія** — неврологічний розлад, симптомами якого є катаплексія (раптовий параліч м’язів), надмірна сонливість, засинання у випадкових місцях, галюцинації та параліч сну під час пробудження або засинання.  

- **Синдром обструктивного апное сну** — захворювання, яке зазвичай спричинене надмірною вагою та великим обхватом шиї. Під час сну м’язи розслаблюються, і дихальні шляхи перекриваються. Людина продовжує дихати, але повітря не може проходити, що спричиняє відчуття задухи/хропіння, а потім пробудження. Це може повторюватися кілька разів за годину(!). Пацієнт зазвичай не усвідомлює цих переривань під час сну, а єдиний клінічний симптом — надмірна денна сонливість.  

Якщо це захворювання не лікувати, воно може призвести до підвищеного артеріального тиску, неврологічних або серцевих проблем. 💔  

- **Депресія та інші серйозні психічні захворювання** — надмірна сонливість може бути прямою ознакою психічного розладу. До 80% людей із депресією страждають на безсоння та порушення циклу сну.  

- **Синдром неспокійних ніг** — неприємні та болючі відчуття в ногах, які зникають під час руху. Через це пацієнти не можуть заснути.  

- **Діабет**  

- **Хвороба Паркінсона, розсіяний склероз або інші неврологічні розлади**.  

- **Астма** — симптоми астми часто з’являються вночі, під час засинання або пробудження.  
"""
      },
      {
        "title": "Оцінка втоми",
        "url": "assets/fatigue.jpg",
        "page": const Fatigueassesment(),
        "descritpion": """
Що таке оцінка шкали тяжкості втоми (FSS)?  
Почнемо з початку — які симптоми втоми? Симптоми втоми включають:  

- Хронічне відчуття виснаження та втоми;  
- Відсутність мотивації;  
- Тривожність і дратівливість;  
- Запаморочення;  
- Порушення сну;  
- Когнітивні порушення, такі як проблеми з пам’яттю, відсутність концентрації та уваги;  
- Погіршення прийняття рішень;  
- М’язова слабкість і біль;  
- Сповільнені рефлекси.  

Такі стани, як розсіяний склероз, системний червоний вовчак, артрит, інсульт і фіброміалгія, часто супроводжуються втомою. Втома охоплює багато фізичних, психічних і емоційних симптомів, які можуть суттєво впливати на якість життя. Тому оцінка тяжкості втоми може бути важливою для визначення відповідного плану лікування.  
"""
      },
      {
        "title": "Оцінка дотримання лікування",
        "url": "assets/hivassesment.jpg",
        "page": const HIVASESForm(),
        "descritpion": """
    Про оцінку
    Шкала самоефективності дотримання лікування ВІЛ (HIV-ASES) розроблена для оцінки впевненості людини у дотриманні схем лікування ВІЛ...
    """
      }
    ];
  } else {
    return [
      {
        "title": "Avaliação da Escala do Sono",
        "url": "assets/sleepscale.png",
        "page": const Sleepassesment(),
        "descritpion": """
A escala de Epworth é usada para uma avaliação geral dos problemas de sonolência; no entanto, ainda precisamos realizar o processo diagnóstico para identificar a causa raiz do problema. Lembre-se — sonolência excessiva pode ser um sinal de problemas graves de saúde!

Doenças e distúrbios que podem causar sonolência excessiva durante o dia:
Narcolepsia — um distúrbio neurológico cujos sintomas incluem cataplexia (perda súbita do controle muscular), sonolência excessiva e adormecer em locais aleatórios, além de alucinações e paralisia do sono ao acordar ou adormecer.

Apneia do sono — uma doença geralmente causada por excesso de peso e grande circunferência do pescoço. Quando a pessoa afetada dorme, seus músculos perdem a tensão e as vias aéreas ficam obstruídas — a pessoa continua respirando, mas o ar não consegue passar, resultando em uma sensação de sufocamento/ronco e despertares frequentes. Essa situação pode ocorrer várias vezes por hora(!). O paciente geralmente não percebe essas pequenas interrupções no sono noturno, e o único sintoma clínico pode ser a sonolência excessiva durante o dia.

Se não for tratada, a doença pode levar à hipertensão arterial, além de problemas neurológicos e cardíacos. 💔

Depressão e outras doenças psiquiátricas graves — a sonolência excessiva pode ser um sinal direto de um transtorno psiquiátrico em andamento. Até 80% das pessoas com depressão apresentam insônia e um ciclo dia-noite alterado.

Síndrome das pernas inquietas — sensação estranha e dolorosa nas pernas que desaparece com o movimento. Os pacientes ficam acordados durante a noite porque não conseguem ficar parados.

Diabetes

Doença de Parkinson, esclerose múltipla ou outros distúrbios neurológicos.

Asma — os sinais e sintomas da asma geralmente aparecem à noite, ao adormecer e ao acordar.
"""
      },
      {
        "title": "Avaliação da Fadiga",
        "url": "assets/fatigue.jpg",
        "page": const Fatigueassesment(),
        "descritpion": """
O que é a Avaliação da Escala de Gravidade da Fadiga (FSS)?
Vamos começar do início — quais são os sintomas da fadiga?

Os sintomas da fadiga incluem:

Sensação crônica de exaustão e cansaço;
Falta de motivação;
Ansiedade e irritabilidade;
Tontura;
Distúrbios do sono;
Dificuldades cognitivas, como problemas de memória, falta de foco e concentração;
Dificuldade na tomada de decisões;
Fraqueza muscular e dores;
Reflexos lentos.
Condições como esclerose múltipla, lúpus eritematoso sistêmico, artrite, acidente vascular cerebral (AVC) e fibromialgia frequentemente estão associadas à fadiga.
A fadiga envolve diversos sintomas físicos, mentais e emocionais que podem impactar significativamente a qualidade de vida. Por isso, avaliar a gravidade da fadiga é essencial para determinar um plano de tratamento adequado.
"""
      },
      {
        "title": "Avaliação da Adesão",
        "url": "assets/hivassesment.jpg",
        "page": const HIVASESForm(),
        "descritpion": """
    Sobre a Avaliação
    A Escala de Autoeficácia para Adesão ao HIV (HIV-ASES) foi desenvolvida para medir a confiança de um indivíduo em seguir os regimes de tratamento do HIV. A avaliação consiste em 12 itens que avaliam a capacidade de uma pessoa de integrar o tratamento na sua rotina diária e superar desafios como efeitos colaterais, mudanças no estilo de vida e estigma social. Cada item é avaliado em uma escala de 0 a 10, onde pontuações mais altas indicam maior confiança na adesão.
    A avaliação fornece três pontuações principais: a Pontuação Total, que representa a autoeficácia geral na adesão, a Pontuação de Integração, que mede o quão bem o indivíduo incorpora o tratamento na sua vida diária, e a Pontuação de Perseverança, que avalia a capacidade de manter o tratamento apesar das dificuldades. Essas pontuações ajudam os profissionais de saúde e os pacientes a identificar áreas que podem precisar de suporte adicional para melhorar a adesão ao tratamento e os resultados gerais de saúde. O HIV-ASES é uma ferramenta valiosa tanto em contextos clínicos quanto de pesquisa para monitorar o comportamento de adesão e orientar intervenções.
    """
      }
    ];
  }
}

fetchscantext(context, val) {
  var data = {
    "Did you sleep 7-9 hours last night? Consistent sleep supports energy and focus.":
        fetchlocale(context).scantext1,
    "Is your bedroom dark and cool? A calm environment improves sleep quality.":
        fetchlocale(context).scantext2,
    "Do you avoid screens before bed? Less screen time helps you fall asleep faster.":
        fetchlocale(context).scantext3,
    "Are you winding down before bed? A relaxing pre-sleep routine signals it’s time to rest.":
        fetchlocale(context).scantext4,
    "Have you had 8 glasses of water today? Staying hydrated keeps your body energized.":
        fetchlocale(context).scantext5,
    "Drinking water after waking up? Starting your day with water aids digestion.":
        fetchlocale(context).scantext6,
    "Do you hydrate before and after exercise? Proper hydration supports endurance and recovery.":
        fetchlocale(context).scantext7,
    "Drinking too many sugary drinks? Water is best for hydration without extra calories.":
        fetchlocale(context).scantext8,
    "Are you including fruits and veggies daily? A colorful plate means a nutrient-rich diet.":
        fetchlocale(context).scantext9,
    "Have you had enough protein today? Protein helps repair muscles and keeps you full.":
        fetchlocale(context).scantext10,
    "Do you eat whole grains? Whole grains provide fiber and longer-lasting energy.":
        fetchlocale(context).scantext11,
    "Are you mindful of portion sizes? Balanced portions prevent overeating and support digestion.":
        fetchlocale(context).scantext12,
    "Are you limiting sugary snacks? Reducing sugar can improve energy levels and focus.":
        fetchlocale(context).scantext13,
    "Did you move for at least 30 minutes today? Regular movement boosts mood and health.":
        fetchlocale(context).scantext14,
    "Are you stretching during the day? Stretching can reduce muscle tension and improve flexibility.":
        fetchlocale(context).scantext15,
    "Taking breaks to move around? Small movements prevent stiffness and increase energy.":
        fetchlocale(context).scantext16,
    "Are you tracking your steps? Setting daily step goals keeps you active and motivated.":
        fetchlocale(context).scantext17,
    "Did you do strength exercises this week? Strength training supports muscle and bone health.":
        fetchlocale(context).scantext18,
    "Did you take a moment for self-care today? Self-care reduces stress and boosts well-being.":
        fetchlocale(context).scantext19,
    "Do you practice deep breathing? Deep breaths calm your mind and reduce anxiety.":
        fetchlocale(context).scantext20,
    "Had a positive thought today? Positive thinking can improve your mood and resilience.":
        fetchlocale(context).scantext21,
    "Did you disconnect from screens for a while? A break from screens refreshes your focus.":
        fetchlocale(context).scantext22,
    "Are you setting aside time to relax? Intentional relaxation improves mental clarity.":
        fetchlocale(context).scantext23,
    "Have you taken a break to unwind? Regular breaks prevent burnout and reduce stress.":
        fetchlocale(context).scantext24,
    "Did you spend time outdoors? Fresh air and sunlight can improve mood and energy.":
        fetchlocale(context).scantext25,
    "Are you prioritizing tasks? Organization helps manage stress and boosts productivity.":
        fetchlocale(context).scantext26,
    "Took a moment to breathe deeply today? Slow breathing calms your mind and body.":
        fetchlocale(context).scantext27,
    "Practicing gratitude? Reflecting on positives can shift your mindset and reduce stress.":
        fetchlocale(context).scantext28,
  };
  return data[val] ?? "-";
}
