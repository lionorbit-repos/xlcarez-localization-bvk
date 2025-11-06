// ignore_for_file: prefer_typing_uninitialized_variables

import '../env/appexports.dart';

class Vitaldetailcard extends StatelessWidget {
  final label;
  final Widget image;
  final level;
  final score;
  final levecol;
  final confedence;
  const Vitaldetailcard({
    super.key,
    required this.image,
    this.label,
    this.confedence,
    this.level,
    this.levecol,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    //print(level.toString());
    return MyThemeGradient(
      child: Scaffold(
          appBar: Themeappbar(
            title: fethvitalsdata(context, label),
            leading: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: genratemediaquery(context).size.height / 8),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                    height: genratemediaquery(context).size.height,
                    width: genratemediaquery(context).size.width,
                    padding: EdgeInsets.fromLTRB(
                        15, genratemediaquery(context).size.height / 12, 15, 0),
                    decoration: const BoxDecoration(
                        color: scaffoldbgcol,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Apptextwidget(
                                "${fethvitalsdata(context, label)} ${fetchlocale(context).informationee}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              appspace(w: 10),
                              Visibility(
                                visible: level != null,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: levecol ??
                                          primary.withValues(alpha: 0.3),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: bgClr1)),
                                  child: Apptextwidget(
                                    fetchlevels(context, level),
                                    style: TxtStls.wstl13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          appspace(h: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                    visible: confedence != null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 5),
                                      child: Apptextwidget(
                                        "${fetchlevels(context, confedence) ?? ""} ${fetchlocale(context).confidence}"
                                            .toString()
                                            .capitalize(),
                                        style: colstyelses(
                                            confedence.toString().capitalize()),
                                      ),
                                    )),
                                Apptextwidget(
                                  fetchinfoloc(context, label),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    height: 1.8, // Aligns text with the lines
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: -120,
                    child: SizedBox(
                      height: 160,
                      width: 160,
                      child: ScoreIndicator(
                          score: score,
                          maxScore: 100,
                          progressValue: vitlvlueparse(score),
                          label: fethvitalsdata(context, label),
                          show: false,
                          image: image,
                          level: level ?? "-"),
                    )),
              ],
            ),
          )),
    );
  }
}

String fetchinfoloc(context, label) {
  final ctrl =
      Provider.of<Localizationcontroller>(context, listen: false).locale;
  //print(ctrl.toString());
  if (ctrl == const Locale("en")) {
    var map = {
      "Wellness Index":
          """The Wellness Index is a prediction risk score that helps assess cardiovascular risk for the next 5 to 10 years. It is based on vital signs measured by our technology and is best interpreted under consistent conditions at rest. 
      - **Higher Score**: Indicates lower cardiovascular risk. 
      - **Factors**: The score is influenced by Heart Rate, Heart Rate Variability (HRV), Stress Levels, Oxygen Saturation, and Blood Pressure. 
      - **Example**: A resting heart rate above 65 reduces the score to medium, while levels above 84 result in a low score. High stress levels, low oxygen saturation, or high blood pressure readings can also lower the score. 
      Monitoring the Wellness Index over time helps track overall cardiovascular health. Regular measurements and consultations with your doctor ensure accurate insights and advice.""",
      "Pulse Rate":
          """Your heart rate is the number of beats per minute. A normal resting rate for healthy adults is 60-100 beats per minute, varying with activity, emotions, and health conditions. It reflects how your heart pumps oxygen-rich blood to your body. 
      A fast heart rate at rest may signal conditions like stress, infection, or anemia, while a slower rate is common in active individuals. Monitoring your heart rate helps track fitness, heart health, and medication effectiveness. If your heartbeat feels irregular, consult a doctor promptly.""",
      "Respiration Rate":
          """Your breathing rate is the number of breaths per minute, normally 12-20 for healthy adults. It ensures a balance of oxygen and carbon dioxide in the body. 
      Breathing rates can vary due to exercise, emotions, fever, or medical conditions. While changes in rate may be normal after activity, persistent abnormalities might indicate health issues like dehydration or heart problems. 
      Monitoring your breathing rate can aid in identifying health concerns. If you notice unusual changes or difficulty breathing, consult a doctor promptly.""",
      "Stress Index":
          """Stress is the body's response to challenges or demands. The app measures stress using Baevsky's Stress Index, based on Heart Rate Variability (HRV). Here's how it works: 
      - **Stress Index Calculation**: Derived from HRV measurements, reflecting physiological conditions. 
      - **HRV Analysis**: A globally recognized method for assessing the autonomic nervous system's function. 
      - **Purpose**: The Stress Index helps determine your stress level.""",
      "Oxygen Saturation":
          """SpO2 measures how much oxygen your red blood cells carry. Normal levels range from 95%-100% for healthy lungs, but they may be lower in individuals with chronic conditions. 
      Levels below 90% indicate hypoxemia, caused by conditions like COPD, asthma, heart failure, or high-altitude exposure. Symptoms include shortness of breath, rapid heart rate, and skin discoloration (cyanosis). 
      Athletes can monitor SpO2 to assess performance changes due to altitude. If your SpO2 is low or you notice symptoms, consult a doctor for advice tailored to your condition.""",
      "Blood Pressure":
          """Blood pressure measures the force of blood against artery walls and is recorded with two numbers: 
      - **Systolic pressure (top number)**: Pressure when the heart pumps blood. 
      - **Diastolic pressure (bottom number)**: Pressure when the heart rests between beats. 
      Normal systolic pressure ranges from 100 to 129. Elevated levels (130 or higher) or low levels (below 100) may signal health concerns. High blood pressure (hypertension) often has no symptoms but increases the risk of heart disease and stroke. 
      Blood pressure changes with activities and should be measured at rest. A diagnosis requires multiple readings over time. Managing blood pressure involves lifestyle changes, medication, and regular monitoring. Consult your doctor for accurate assessment and advice.""",
      "Hemoglobin":
          """Hemoglobin is a protein in red blood cells that carries oxygen to the body's organs and tissues and removes carbon dioxide. It is measured in grams per deciliter (g/dL). 
      **Healthy Ranges**: 
      - **Men**: 14 to 18 g/dL 
      - **Women**: 12 to 16 g/dL 
      Understanding your hemoglobin levels helps assess oxygen transport efficiency in your body. Regular monitoring is important for maintaining health.""",
      "Hemoglobin A1C":
          """HbA1c reflects your average blood sugar levels over the past 2 to 3 months and is measured in percentages. 
      **Ranges**: 
      - **Normal**: Less than 5.6% 
      - **Prediabetes Risk**: 5.7% to 6.4% 
      - **Diabetes Risk**: Greater than 6.5% 
      Monitoring HbA1c helps assess long-term blood sugar control and identify risks of diabetes. Regular checks are essential for maintaining optimal health.""",
      "Temperature":
          """Body temperature is the measure of the body's internal heat. The normal body temperature for healthy adults is around 98.6°F (37°C), but it can vary slightly throughout the day. It can be influenced by factors such as time of day, activity level, and even emotional stress.
      - **Fever**: A body temperature above 100.4°F (38°C) typically indicates an infection or illness.
      - **Hypothermia**: A body temperature below 95°F (35°C) is a medical emergency, often due to prolonged exposure to cold environments.
      Monitoring your body temperature regularly can help detect early signs of infection or other health issues. If you experience persistent fever or abnormally low temperature, consult a doctor promptly.""",
      "Sugar":
          """Blood sugar (glucose) is the main source of energy for the body's cells. The body regulates blood sugar levels through insulin, and normal levels vary depending on whether you’ve eaten or not.
      - **Normal Range**:
        - **Fasting**: 70-99 mg/dL
        - **Post-meal**: Less than 140 mg/dL
      High blood sugar (hyperglycemia) can indicate conditions like diabetes, while low blood sugar (hypoglycemia) can cause symptoms like dizziness, sweating, and confusion.
      Regular monitoring is important for managing blood sugar, especially for individuals with diabetes or prediabetes. Consult your doctor for advice if your levels are consistently abnormal.""",
      "Cholesterol":
          """Cholesterol is a fatty substance needed by the body to build cells and produce certain hormones. It is carried through the bloodstream by two types of lipoproteins: low-density lipoprotein (LDL), often referred to as "bad" cholesterol, and high-density lipoprotein (HDL), known as "good" cholesterol.
      - **Normal Levels**:
        - **Total cholesterol**: Less than 200 mg/dL
        - **LDL**: Less than 100 mg/dL (ideally below 70 for those at high risk)
        - **HDL**: 60 mg/dL or higher is optimal
        - **Triglycerides**: Less than 150 mg/dL
      High levels of LDL cholesterol or triglycerides can increase the risk of heart disease and stroke. On the other hand, high HDL cholesterol can protect against heart disease.
      Monitoring cholesterol levels regularly can help identify risks of cardiovascular conditions. If your cholesterol is high or you have concerns, consult a healthcare provider for guidance on managing your cholesterol through lifestyle changes or medication."""
    };
    return map[label] ?? "";
  } else if (ctrl == const Locale("es")) {
    var map = {
      "Wellness Index":
      """El Índice de Bienestar es una puntuación de riesgo predictiva que ayuda a evaluar el riesgo cardiovascular para los próximos 5 a 10 años. Se basa en signos vitales medidos por nuestra tecnología y se interpreta mejor bajo condiciones consistentes en reposo.
      Puntuación más alta: Indica menor riesgo cardiovascular.
     Factores: La puntuación está influenciada por la Frecuencia Cardíaca, la Variabilidad de la Frecuencia Cardíaca (VFC), los Niveles de Estrés, la Saturación de Oxígeno y la Presión Arterial.
     Ejemplo: Una frecuencia cardíaca en reposo por encima de 65 reduce la puntuación a media, mientras que niveles por encima de 84 resultan en una puntuación baja. Niveles altos de estrés, saturación baja de oxígeno o lecturas altas de presión arterial también pueden bajar la puntuación.
     Monitorear el Índice de Bienestar con el tiempo ayuda a seguir la salud cardiovascular general. Mediciones regulares y consultas con su médico aseguran análisis y consejos precisos.""",
      "Pulse Rate":
          """Tu frecuencia cardíaca es el número de latidos por minuto. Una frecuencia en reposo normal para adultos sanos es de 60 a 100 latidos por minuto, y puede variar según la actividad, las emociones y las condiciones de salud. Refleja cómo tu corazón bombea sangre rica en oxígeno a tu cuerpo.
Una frecuencia cardíaca rápida en reposo puede indicar condiciones como estrés, infección o anemia, mientras que una frecuencia más lenta es común en personas activas. Monitorear tu frecuencia cardíaca ayuda a controlar tu estado físico, la salud del corazón y la efectividad de los medicamentos. Si sientes que tu ritmo cardíaco es irregular, consulta a un médico de inmediato.""",
      "Respiration Rate":
          """Tu frecuencia respiratoria es el número de respiraciones por minuto, normalmente entre 12 y 20 en adultos sanos. Esta frecuencia asegura el equilibrio de oxígeno y dióxido de carbono en el cuerpo.
La frecuencia respiratoria puede variar debido al ejercicio, las emociones, la fiebre o condiciones médicas. Aunque los cambios en la frecuencia pueden ser normales después de la actividad, las anomalías persistentes podrían indicar problemas de salud como deshidratación o enfermedades cardíacas.
Monitorear tu frecuencia respiratoria puede ayudar a identificar problemas de salud. Si notas cambios inusuales o dificultad para respirar, consulta a un médico de inmediato.""",
      "Stress Index":
       """El estrés es la respuesta del cuerpo a desafíos o demandas. La aplicación mide el estrés usando el Índice de Estrés de Baevsky, basado en la Variabilidad de la Frecuencia Cardíaca (VFC). Así funciona:
      Cálculo del Índice de Estrés: Se obtiene a partir de las mediciones de la VFC, reflejando las condiciones fisiológicas.
      Análisis de la VFC: Método reconocido mundialmente para evaluar la función del sistema nervioso autónomo.
      Propósito: El Índice de Estrés ayuda a determinar tu nivel de estrés.""",
      "Oxygen Saturation":
          """La SpO2 mide la cantidad de oxígeno que transportan tus glóbulos rojos. Los niveles normales van del 95 % al 100 % para pulmones saludables, pero pueden ser más bajos en personas con condiciones crónicas.
Los niveles por debajo del 90 % indican hipoxemia, causada por condiciones como EPOC, asma, insuficiencia cardíaca o exposición a gran altitud. Los síntomas incluyen dificultad para respirar, ritmo cardíaco rápido y decoloración de la piel (cianosis).
Los atletas pueden monitorear la SpO2 para evaluar cambios en el rendimiento debido a la altitud. Si tu SpO2 es baja o notas síntomas, consulta a un médico para recibir asesoramiento adaptado a tu condición.""",
      "Blood Pressure":
          """La presión arterial mide la fuerza de la sangre contra las paredes de las arterias y se registra con dos números:
Presión sistólica (número superior): Presión cuando el corazón bombea sangre.
Presión diastólica (número inferior): Presión cuando el corazón descansa entre latidos.
La presión sistólica normal varía entre 100 y 129. Niveles elevados (130 o más) o bajos (menos de 100) pueden indicar problemas de salud. La presión arterial alta (hipertensión) a menudo no presenta síntomas, pero aumenta el riesgo de enfermedades cardíacas y accidentes cerebrovasculares.
La presión arterial cambia con las actividades y debe medirse en reposo. El diagnóstico requiere varias mediciones a lo largo del tiempo. El manejo de la presión arterial incluye cambios en el estilo de vida, medicamentos y monitoreo regular. Consulta a tu médico para una evaluación precisa y asesoramiento.""",
      "Hemoglobin":
          """La hemoglobina es una proteína en los glóbulos rojos que transporta oxígeno a los órganos y tejidos del cuerpo y elimina el dióxido de carbono. Se mide en gramos por decilitro (g/dL).
Rangos saludables:
Hombres: 14 a 18 g/dL
Mujeres: 12 a 16 g/dL
Comprender tus niveles de hemoglobina ayuda a evaluar la eficiencia del transporte de oxígeno en tu cuerpo. El monitoreo regular es importante para mantener la salud.""",
      "Hemoglobin A1C":
          """La HbA1c refleja tus niveles promedio de azúcar en sangre durante los últimos 2 a 3 meses y se mide en porcentajes.
Rangos:
Normal: Menos de 5.6 %
Riesgo de prediabetes: 5.7 % a 6.4 %
Riesgo de diabetes: Más de 6.5 %
Monitorear la HbA1c ayuda a evaluar el control a largo plazo del azúcar en sangre e identificar riesgos de diabetes. Los controles regulares son esenciales para mantener una salud óptima.""",
      "Temperature":
          """La temperatura corporal es la medida del calor interno del cuerpo. La temperatura corporal normal en adultos sanos es alrededor de 98.6 °F (37 °C), pero puede variar ligeramente a lo largo del día. Está influenciada por factores como la hora del día, el nivel de actividad e incluso el estrés emocional.
Fiebre: Una temperatura corporal superior a 100.4 °F (38 °C) generalmente indica una infección o enfermedad.
Hipotermia: Una temperatura corporal por debajo de 95 °F (35 °C) es una emergencia médica, frecuentemente causada por exposición prolongada a ambientes fríos.
Monitorear tu temperatura corporal regularmente puede ayudar a detectar signos tempranos de infección u otros problemas de salud. Si experimentas fiebre persistente o una temperatura anormalmente baja, consulta a un médico de inmediato.""",
      "Sugar":
          """El azúcar en sangre (glucosa) es la principal fuente de energía para las células del cuerpo. El cuerpo regula los niveles de azúcar en sangre a través de la insulina, y los niveles normales varían según si has comido o no.
Rango normal:
En ayunas: 70-99 mg/dL
Después de comer: Menos de 140 mg/dL
El nivel alto de azúcar en sangre (hiperglucemia) puede indicar condiciones como la diabetes, mientras que el nivel bajo (hipoglucemia) puede causar síntomas como mareos, sudoración y confusión.
El monitoreo regular es importante para controlar el azúcar en sangre, especialmente en personas con diabetes o prediabetes. Consulta a tu médico si tus niveles son consistentemente anormales.""",
      "Cholesterol":
          """El colesterol es una sustancia grasa que el cuerpo necesita para construir células y producir ciertas hormonas. Se transporta a través del torrente sanguíneo por dos tipos de lipoproteínas: lipoproteína de baja densidad (LDL), comúnmente llamada colesterol "malo", y lipoproteína de alta densidad (HDL), conocida como colesterol "bueno".

Niveles normales:

Colesterol total: Menos de 200 mg/dL

LDL: Menos de 100 mg/dL (idealmente menos de 70 para personas con alto riesgo)

HDL: 60 mg/dL o más es óptimo

Triglicéridos: Menos de 150 mg/dL

Niveles altos de colesterol LDL o triglicéridos pueden aumentar el riesgo de enfermedades cardíacas y accidentes cerebrovasculares. Por otro lado, niveles altos de colesterol HDL pueden proteger contra enfermedades del corazón.

Monitorear los niveles de colesterol regularmente puede ayudar a identificar riesgos cardiovasculares. Si tu colesterol es alto o tienes inquietudes, consulta a un profesional de salud para recibir orientación sobre cómo manejarlo mediante cambios en el estilo de vida o medicamentos."""
    };
    return map[label] ?? "";
  } else if (ctrl == const Locale("fr")) {
    var map = {
      "Wellness Index":
          """L'indice de bien-être est un score de risque prédictif qui aide à évaluer le risque cardiovasculaire sur les 5 à 10 prochaines années. Il est basé sur les signes vitaux mesurés par notre technologie et s'interprète mieux dans des conditions cohérentes au repos.
     Score élevé : Indique un risque cardiovasculaire plus faible.
     Facteurs : Le score est influencé par la fréquence cardiaque, la variabilité de la fréquence cardiaque (HRV), les niveaux de stress, la saturation en oxygène et la pression artérielle.
     Exemple : Une fréquence cardiaque au repos supérieure à 65 réduit le score à moyen, tandis que des niveaux supérieurs à 84 entraînent un score bas. Un stress élevé, une faible saturation en oxygène ou une pression artérielle élevée peuvent également faire baisser le score.
    Suivre l'indice de bien-être au fil du temps aide à surveiller la santé cardiovasculaire globale. Des mesures régulières et des consultations avec votre médecin garantissent des analyses précises et des conseils adaptés.""",
      "Pulse Rate":
          """Votre fréquence cardiaque correspond au nombre de battements par minute. Un rythme cardiaque au repos normal pour un adulte en bonne santé est de 60 à 100 battements par minute, variant en fonction de l'activité, des émotions et des conditions de santé. Il reflète la façon dont votre cœur pompe le sang riche en oxygène dans votre corps.
        Un rythme cardiaque élevé au repos peut indiquer des conditions comme le stress, une infection ou une anémie, tandis qu'un rythme plus lent est courant chez les personnes actives. Surveiller votre fréquence cardiaque permet de suivre votre condition physique, votre santé cardiaque et l’efficacité de vos médicaments. Si votre rythme cardiaque semble irrégulier, consultez rapidement un médecin.""",
      "Respiration Rate":
          """Votre fréquence respiratoire correspond au nombre de respirations par minute, normalement entre 12 et 20 pour un adulte en bonne santé. Elle permet de maintenir un équilibre entre l'oxygène et le dioxyde de carbone dans le corps.
     La fréquence respiratoire peut varier en raison de l'exercice, des émotions, de la fièvre ou de certaines conditions médicales. Bien que des changements temporaires soient normaux après une activité, des anomalies persistantes peuvent indiquer des problèmes de santé comme la déshydratation ou des troubles cardiaques.
    Surveiller votre fréquence respiratoire peut aider à identifier d'éventuels problèmes de santé. Si vous remarquez des changements inhabituels ou des difficultés à respirer, consultez un médecin rapidement.""",
      "Stress Index":
          """Le stress est la réponse du corps aux défis ou aux exigences. L'application mesure le stress à l'aide de l'Indice de Stress de Baevsky, basé sur la Variabilité de la Fréquence Cardiaque (VFC). Voici comment cela fonctionne :
    Calcul de l'Indice de Stress : Dérivé des mesures de la VFC, il reflète les conditions physiologiques.
    Analyse de la VFC : Une méthode mondialement reconnue pour évaluer le fonctionnement du système nerveux autonome.
    Objectif : L'Indice de Stress aide à déterminer votre niveau de stress.""",
      "Oxygen Saturation":
          """La SpO₂ mesure la quantité d'oxygène transportée par vos globules rouges. Les niveaux normaux varient de 95 % à 100 % pour des poumons en bonne santé, mais ils peuvent être plus bas chez les personnes atteintes de maladies chroniques.
    Des niveaux inférieurs à 90 % indiquent une hypoxémie, causée par des affections telles que la BPCO, l'asthme, l'insuffisance cardiaque ou l'exposition à haute altitude. Les symptômes incluent un essoufflement, une fréquence cardiaque rapide et une décoloration de la peau (cyanose).
    Les athlètes peuvent surveiller leur SpO₂ pour évaluer les variations de performance dues à l'altitude. Si votre SpO₂ est faible ou si vous ressentez des symptômes, consultez un médecin pour des conseils adaptés à votre situation.""",
      "Blood Pressure":
          """La pression artérielle mesure la force du sang contre les parois des artères et est enregistrée avec deux chiffres :
    Pression systolique (chiffre du haut) : Pression lorsque le cœur pompe le sang.
    Pression diastolique (chiffre du bas) : Pression lorsque le cœur se repose entre les battements.
    Une pression systolique normale varie entre 100 et 129. Des niveaux élevés (130 ou plus) ou faibles (inférieurs à 100) peuvent indiquer des problèmes de santé. L'hypertension artérielle (pression élevée) est souvent asymptomatique, mais elle augmente le risque de maladies cardiaques et d'accidents vasculaires cérébraux.
    La pression artérielle varie en fonction des activités et doit être mesurée au repos. Un diagnostic nécessite plusieurs mesures sur une période de temps. La gestion de la pression artérielle inclut des changements de mode de vie, des médicaments et un suivi régulier. Consultez votre médecin pour une évaluation précise et des conseils adaptés.""",
      "Hemoglobin":
          """L'hémoglobine est une protéine présente dans les globules rouges qui transporte l'oxygène vers les organes et les tissus du corps et élimine le dioxyde de carbone. Elle est mesurée en grammes par décilitre (g/dL).
    lages normales :
    Hommes : 14 à 18 g/dL
    Femmes : 12 à 16 g/dL
    Comprendre vos niveaux d'hémoglobine permet d'évaluer l'efficacité du transport de l'oxygène dans votre corps. Un suivi régulier est essentiel pour maintenir une bonne santé.""",
      "Hemoglobin A1C":
          """L'HbA1c reflète votre taux moyen de sucre dans le sang au cours des 2 à 3 derniers mois et est mesuré en pourcentage.
    Plages :
    Normal : Moins de 5,6 %
    Risque de prédiabète : 5,7 % à 6,4 %
    Risque de diabète : Plus de 6,5 %
    Le suivi de l'HbA1c aide à évaluer le contrôle du sucre dans le sang à long terme et à identifier les risques de diabète. Des contrôles réguliers sont essentiels pour maintenir une santé optimale.""",
      "Temperature":
          """La température corporelle mesure la chaleur interne du corps. La température normale pour un adulte en bonne santé est d’environ 98,6 °F (37 °C), mais elle peut légèrement varier au cours de la journée. Elle est influencée par des facteurs tels que l’heure de la journée, le niveau d’activité et même le stress émotionnel.
    Fièvre : Une température corporelle supérieure à 100,4 °F (38 °C) indique généralement une infection ou une maladie.
    Hypothermie : Une température corporelle inférieure à 95 °F (35 °C) est une urgence médicale, souvent causée par une exposition prolongée au froid.
    Surveiller régulièrement votre température corporelle peut aider à détecter les premiers signes d’infection ou d’autres problèmes de santé. Si vous avez une fièvre persistante ou une température anormalement basse, consultez un médecin rapidement.""",
      "Sugar":
          """La glycémie (glucose) est la principale source d’énergie des cellules du corps. L’organisme régule les niveaux de sucre dans le sang grâce à l’insuline, et les valeurs normales varient selon que vous avez mangé ou non.
     Plage normale :
     À jeun : 70-99 mg/dL
     Après un repas : Moins de 140 mg/dL
     Une glycémie élevée (hyperglycémie) peut indiquer des conditions comme le diabète, tandis qu’une glycémie basse (hypoglycémie) peut provoquer des symptômes tels que des étourdissements, des sueurs et de la confusion.
     Un suivi régulier est essentiel pour gérer la glycémie, en particulier pour les personnes atteintes de diabète ou de prédiabète. Consultez votre médecin si vos niveaux sont fréquemment anormaux.""",
      "Cholesterol":
          """Le cholestérol est une substance grasse essentielle à l’organisme pour construire les cellules et produire certaines hormones. Il est transporté dans le sang par deux types de lipoprotéines : les lipoprotéines de basse densité (LDL), souvent appelées « mauvais » cholestérol, et les lipoprotéines de haute densité (HDL), connues sous le nom de « bon » cholestérol.
    Niveaux normaux :
    Cholestérol total : Moins de 200 mg/dL
    LDL : Moins de 100 mg/dL (idéalement en dessous de 70 pour les personnes à haut risque)
    HDL : 60 mg/dL ou plus est optimal
    Triglycérides : Moins de 150 mg/dL
    Des niveaux élevés de cholestérol LDL ou de triglycérides augmentent le risque de maladies cardiaques et d’accidents vasculaires cérébraux. À l’inverse, un taux élevé de cholestérol HDL peut protéger contre ces maladies.
    Surveiller régulièrement votre taux de cholestérol permet d’identifier les risques cardiovasculaires. Si votre cholestérol est élevé ou si vous avez des préoccupations, consultez un professionnel de santé pour des conseils sur la gestion du cholestérol grâce à des changements de mode de vie ou à des médicaments."""
    };
    return map[label] ?? "";
  } else if (ctrl == const Locale("de")) {
    var map = {
      "Wellness Index":
          """Der Wellness-Index ist ein vorausschauender Risikowert, der hilft, das kardiovaskuläre Risiko für die nächsten 5 bis 10 Jahre einzuschätzen. Er basiert auf Vitalzeichen, die durch unsere Technologie gemessen werden, und wird am besten unter konstanten Bedingungen in Ruhe interpretiert.
     Höherer Score: Bedeutet ein geringeres kardiovaskuläres Risiko.
     Faktoren: Der Score wird durch Herzfrequenz, Herzfrequenzvariabilität (HRV), Stresslevel, Sauerstoffsättigung und Blutdruck beeinflusst.
     Beispiel: Eine Ruheherzfrequenz über 65 senkt den Score auf mittel, während Werte über 84 zu einem niedrigen Score führen. Hoher Stress, niedrige Sauerstoffsättigung oder hoher Blutdruck können den Score ebenfalls reduzieren.
     Die regelmäßige Überwachung des Wellness-Index hilft, die allgemeine kardiovaskuläre Gesundheit zu verfolgen. Regelmäßige Messungen und Konsultationen mit Ihrem Arzt sorgen für genaue Einblicke und Empfehlungen.""",
      "Pulse Rate":
          """Ihre Herzfrequenz gibt die Anzahl der Schläge pro Minute an. Eine normale Ruheherzfrequenz für gesunde Erwachsene liegt zwischen 60 und 100 Schlägen pro Minute und variiert je nach Aktivität, Emotionen und Gesundheitszustand. Sie zeigt, wie Ihr Herz sauerstoffreiches Blut durch den Körper pumpt.
        Eine erhöhte Herzfrequenz in Ruhe kann auf Stress, Infektionen oder Anämie hinweisen, während eine niedrigere Frequenz bei aktiven Personen häufig vorkommt. Die Überwachung der Herzfrequenz hilft, die Fitness, die Herzgesundheit und die Wirkung von Medikamenten zu verfolgen. Wenn Ihr Herzschlag unregelmäßig erscheint, sollten Sie umgehend einen Arzt konsultieren.""",
      "Respiration Rate":
          """Ihre Atemfrequenz gibt die Anzahl der Atemzüge pro Minute an und liegt bei gesunden Erwachsenen normalerweise zwischen 12 und 20. Sie sorgt für ein Gleichgewicht von Sauerstoff und Kohlendioxid im Körper.
    Die Atemfrequenz kann sich durch Bewegung, Emotionen, Fieber oder medizinische Bedingungen verändern. Während Veränderungen nach körperlicher Aktivität normal sind, können anhaltende Abweichungen auf Gesundheitsprobleme wie Dehydrierung oder Herzkrankheiten hinweisen.
    Das Überwachen Ihrer Atemfrequenz kann helfen, gesundheitliche Probleme frühzeitig zu erkennen. Wenn Sie ungewöhnliche Veränderungen oder Atembeschwerden bemerken, sollten Sie umgehend einen Arzt konsultieren.""",
      "Stress Index":
          """Stress ist die Reaktion des Körpers auf Herausforderungen oder Anforderungen. Die App misst Stress mithilfe des Baevsky-Stressindex, der auf der Herzfrequenzvariabilität (HRV) basiert. So funktioniert es:
     Berechnung des Stressindex: Abgeleitet aus HRV-Messungen, spiegelt physiologische Bedingungen wider.
    HRV-Analyse: Eine weltweit anerkannte Methode zur Beurteilung der Funktion des autonomen Nervensystems.
    Zweck: Der Stressindex hilft, Ihr Stressniveau zu bestimmen.""",
      "Oxygen Saturation":
          """SpO₂ misst, wie viel Sauerstoff Ihre roten Blutkörperchen transportieren. Normale Werte liegen zwischen 95 % und 100 % für gesunde Lungen, können jedoch bei Menschen mit chronischen Erkrankungen niedriger sein.
    Werte unter 90 % weisen auf Hypoxämie hin, die durch Erkrankungen wie COPD, Asthma, Herzinsuffizienz oder Höhenexposition verursacht werden kann. Symptome sind Kurzatmigkeit, eine erhöhte Herzfrequenz und Hautverfärbungen (Zyanose).
    Sportler können ihre SpO₂-Werte überwachen, um Leistungsänderungen durch Höhenunterschiede zu analysieren. Wenn Ihr SpO₂ niedrig ist oder Sie Symptome bemerken, konsultieren Sie einen Arzt für eine individuelle Beratung.""",
      "Blood Pressure":
          """Der Blutdruck misst die Kraft des Blutes gegen die Arterienwände und wird mit zwei Werten angegeben:
    Systolischer Druck (oberer Wert): Druck, wenn das Herz Blut pumpt.
    Diastolischer Druck (unterer Wert): Druck, wenn das Herz zwischen den Schlägen ruht.
    Ein normaler systolischer Druck liegt zwischen 100 und 129. Erhöhte Werte (130 oder mehr) oder niedrige Werte (unter 100) können auf gesundheitliche Probleme hinweisen. Bluthochdruck (Hypertonie) verursacht oft keine Symptome, erhöht jedoch das Risiko für Herzkrankheiten und Schlaganfälle.
    Der Blutdruck schwankt je nach Aktivität und sollte im Ruhezustand gemessen werden. Eine Diagnose erfordert mehrere Messungen über einen längeren Zeitraum. Die Kontrolle des Blutdrucks umfasst Lebensstiländerungen, Medikamente und regelmäßige Überwachung. Konsultieren Sie Ihren Arzt für eine genaue Beurteilung und individuelle Beratung.""",
      "Hemoglobin":
          """Hämoglobin ist ein Protein in den roten Blutkörperchen, das Sauerstoff zu den Organen und Geweben transportiert und Kohlendioxid entfernt. Es wird in Gramm pro Deziliter (g/dL) gemessen.
    Gesunde Werte:
    Männer: 14 bis 18 g/dL
    Frauen: 12 bis 16 g/dL
    Das Verständnis Ihrer Hämoglobinwerte hilft, die Effizienz des Sauerstofftransports in Ihrem Körper zu bewerten. Regelmäßige Überwachung ist wichtig für die Erhaltung der Gesundheit.""",
      "Hemoglobin A1C":
          """HbA1c spiegelt den durchschnittlichen Blutzuckerspiegel der letzten 2 bis 3 Monate wider und wird in Prozent gemessen.
    Wertebereiche:
    Normal: Weniger als 5,6 %
    Prädiabetes-Risiko: 5,7 % bis 6,4 %
    Diabetes-Risiko: Mehr als 6,5 %
    Die Überwachung des HbA1c-Werts hilft, die langfristige Blutzuckerkontrolle zu bewerten und Diabetes-Risiken zu erkennen. Regelmäßige Kontrollen sind entscheidend für die Erhaltung der Gesundheit.""",
      "Temperature":
          """Die Körpertemperatur misst die innere Wärme des Körpers. Die normale Körpertemperatur für gesunde Erwachsene liegt bei etwa 98,6 °F (37 °C), kann aber im Laufe des Tages leicht schwanken. Sie wird durch Faktoren wie Tageszeit, Aktivitätsniveau und sogar emotionalen Stress beeinflusst.
    Fieber: Eine Körpertemperatur über 100,4 °F (38 °C) weist meist auf eine Infektion oder Krankheit hin.
    Unterkühlung (Hypothermie): Eine Körpertemperatur unter 95 °F (35 °C) ist ein medizinischer Notfall, der oft durch längere Kälteeinwirkung verursacht wird.
    Die regelmäßige Überwachung der Körpertemperatur kann helfen, frühe Anzeichen einer Infektion oder anderer gesundheitlicher Probleme zu erkennen. Bei anhaltendem Fieber oder ungewöhnlich niedriger Temperatur sollten Sie umgehend einen Arzt aufsuchen.""",
      "Sugar":
          """Blutzucker (Glukose) ist die Hauptenergiequelle für die Körperzellen. Der Körper reguliert den Blutzuckerspiegel durch Insulin, und die normalen Werte variieren je nach Nahrungsaufnahme.
    Normalbereich:
    Nüchtern: 70-99 mg/dL
    Nach dem Essen: Weniger als 140 mg/dL
    Ein hoher Blutzucker (Hyperglykämie) kann auf Erkrankungen wie Diabetes hinweisen, während ein niedriger Blutzucker (Hypoglykämie) Symptome wie Schwindel, Schwitzen und Verwirrung verursachen kann.
    Regelmäßige Messungen sind wichtig, um den Blutzucker zu kontrollieren, insbesondere für Menschen mit Diabetes oder Prädiabetes. Konsultieren Sie Ihren Arzt, wenn Ihre Werte dauerhaft abnormal sind.""",
      "Cholesterol":
          """Cholesterin ist eine fetthaltige Substanz, die der Körper für den Zellaufbau und die Produktion bestimmter Hormone benötigt. Es wird im Blut durch zwei Arten von Lipoproteinen transportiert: Low-Density-Lipoprotein (LDL), oft als „schlechtes“ Cholesterin bezeichnet, und High-Density-Lipoprotein (HDL), bekannt als „gutes“ Cholesterin.
    Normale Werte:
    Gesamtcholesterin: Weniger als 200mg/dL
    LDL: Weniger als 100 mg/dL (idealerweise unter 70 für Hochrisikopatienten)
    HDL: 60 mg/dL oder mehr ist optimal
    Triglyzeride: Weniger als 150 mg/dL
    Hohe LDL- oder Triglyzeridwerte erhöhen das Risiko für Herzkrankheiten und Schlaganfälle. Andererseits kann ein hoher HDL-Cholesterinspiegel das Herz schützen.
    Die regelmäßige Überwachung der Cholesterinwerte hilft, kardiovaskuläre Risiken frühzeitig zu erkennen. Falls Ihr Cholesterinspiegel erhöht ist oder Sie Bedenken haben, konsultieren Sie einen Arzt, um durch Lebensstiländerungen oder Medikamente geeignete Maßnahmen zu treffen."""
    };
    return map[label] ?? "";
  } else if (ctrl == const Locale("ar")) {
    var map = {
      "Wellness Index":
          "مؤشر العافية هو درجة تنبؤية للمخاطر تساعد في تقييم مخاطر القلب والأوعية الدموية على مدى 5 إلى 10 سنوات القادمة. يعتمد على العلامات الحيوية التي يتم قياسها بواسطة تقنيتنا ويتم تفسيره بشكل أفضل في ظروف ثابتة أثناء الراحة. \n - **درجة أعلى**: تشير إلى انخفاض خطر الإصابة بأمراض القلب والأوعية الدموية. \n - **العوامل المؤثرة**: يتأثر المؤشر بمعدل ضربات القلب، تقلب معدل ضربات القلب (HRV)، مستويات التوتر، تشبع الأكسجين، وضغط الدم. \n - **مثال**: معدل ضربات القلب أثناء الراحة فوق 65 يقلل النتيجة إلى متوسطة، بينما المستويات فوق 84 تؤدي إلى درجة منخفضة. مستويات التوتر العالية، انخفاض تشبع الأكسجين، أو ارتفاع ضغط الدم يمكن أن يقلل أيضًا من النتيجة. \n مراقبة مؤشر العافية بمرور الوقت يساعد في تتبع صحة القلب والأوعية الدموية العامة. القياسات المنتظمة والاستشارات مع طبيبك تضمن رؤى دقيقة ونصائح مفيدة.",
      "Pulse Rate":
          "معدل ضربات القلب هو عدد النبضات في الدقيقة. المعدل الطبيعي للراحة لدى البالغين الأصحاء يتراوح بين 60-100 نبضة في الدقيقة، ويختلف حسب النشاط، العواطف، والحالة الصحية. يعكس مدى كفاءة ضخ القلب للدم الغني بالأكسجين إلى الجسم. \n معدل ضربات القلب السريع أثناء الراحة قد يشير إلى حالات مثل التوتر، العدوى، أو فقر الدم، بينما يكون المعدل البطيء شائعًا لدى الأشخاص النشطين. مراقبة معدل ضربات القلب يساعد في تتبع اللياقة وصحة القلب وفعالية الأدوية. إذا شعرت بعدم انتظام في نبضات القلب، استشر الطبيب فورًا.",
      "Respiration Rate":
          "معدل التنفس هو عدد الأنفاس في الدقيقة، وعادة ما يكون بين 12-20 لدى البالغين الأصحاء. يساعد على الحفاظ على توازن الأكسجين وثاني أكسيد الكربون في الجسم. \n قد يختلف معدل التنفس بسبب التمارين، العواطف، الحمى، أو الحالات الطبية. في حين أن التغيرات في المعدل قد تكون طبيعية بعد النشاط، إلا أن الشذوذ المستمر قد يشير إلى مشكلات صحية مثل الجفاف أو مشاكل القلب. \n مراقبة معدل التنفس يمكن أن يساعد في تحديد المخاوف الصحية. إذا لاحظت تغيرات غير طبيعية أو صعوبة في التنفس، استشر الطبيب فورًا.",
      "Stress Index":
          "الإجهاد هو استجابة الجسم للتحديات أو المتطلبات. يقيس التطبيق مستوى الإجهاد باستخدام مؤشر الإجهاد لبايفسكي، الذي يعتمد على تقلب معدل ضربات القلب (HRV). \n - **حساب مؤشر الإجهاد**: مستمد من قياسات HRV، ويعكس الحالة الفسيولوجية. \n - **تحليل HRV**: طريقة معترف بها عالميًا لتقييم وظيفة الجهاز العصبي اللاإرادي. \n - **الغرض**: يساعد مؤشر الإجهاد في تحديد مستوى الإجهاد لديك.",
      "Oxygen Saturation":
          "يقيس تشبع الأكسجين (SpO2) نسبة الأكسجين التي تحملها خلايا الدم الحمراء. تتراوح المستويات الطبيعية بين 95%-100% للرئتين السليمتين، لكنها قد تكون أقل لدى الأفراد المصابين بأمراض مزمنة. \n المستويات التي تقل عن 90% تشير إلى نقص الأكسجة، والذي قد يكون ناتجًا عن حالات مثل مرض الانسداد الرئوي المزمن (COPD)، الربو، فشل القلب، أو التعرض للمرتفعات العالية. تشمل الأعراض ضيق التنفس، سرعة معدل ضربات القلب، وتغير لون الجلد (الزرقة). \n يمكن للرياضيين مراقبة SpO2 لتقييم التغيرات في الأداء بسبب الارتفاعات. إذا كانت مستويات الأكسجين لديك منخفضة أو لاحظت أعراضًا، استشر الطبيب للحصول على نصائح مناسبة لحالتك.",
      "Blood Pressure":
          "يقيس ضغط الدم قوة تدفق الدم ضد جدران الشرايين، ويتم تسجيله برقمين: \n - **الضغط الانقباضي (الرقم العلوي)**: الضغط عندما يضخ القلب الدم. \n - **الضغط الانبساطي (الرقم السفلي)**: الضغط عندما يستريح القلب بين النبضات. \n يتراوح الضغط الانقباضي الطبيعي بين 100 إلى 129. قد تشير المستويات المرتفعة (130 أو أعلى) أو المنخفضة (أقل من 100) إلى مشكلات صحية. ارتفاع ضغط الدم (فرط الضغط) غالبًا لا يصاحبه أعراض لكنه يزيد من خطر الإصابة بأمراض القلب والسكتة الدماغية. \n يتغير ضغط الدم مع الأنشطة ويجب قياسه أثناء الراحة. يتطلب التشخيص قراءات متعددة على مدى فترة زمنية. يتضمن التحكم في ضغط الدم تغييرات في نمط الحياة، الأدوية، والمراقبة المنتظمة. استشر طبيبك للحصول على تقييم دقيق ونصائح مفيدة.",
      "Hemoglobin":
          "الهيموجلوبين هو بروتين في خلايا الدم الحمراء ينقل الأكسجين إلى أعضاء وأنسجة الجسم ويزيل ثاني أكسيد الكربون. يتم قياسه بالغرام لكل ديسيلتر (g/dL). \n **المستويات الصحية**: \n - **الرجال**: 14 إلى 18 g/dL \n - **النساء**: 12 إلى 16 g/dL \n فهم مستويات الهيموجلوبين يساعد في تقييم كفاءة نقل الأكسجين في جسمك. المراقبة المنتظمة مهمة للحفاظ على الصحة.",
      "Hemoglobin A1C":
          "يعكس HbA1c متوسط مستويات السكر في الدم خلال الأشهر 2-3 الماضية، ويتم قياسه بالنسبة المئوية. \n **النطاقات**: \n - **طبيعي**: أقل من 5.6% \n - **خطر مقدمات السكري**: 5.7% إلى 6.4% \n - **خطر السكري**: أكثر من 6.5% \n مراقبة HbA1c تساعد في تقييم التحكم طويل الأمد في نسبة السكر في الدم وتحديد مخاطر الإصابة بالسكري. الفحوصات المنتظمة ضرورية للحفاظ على الصحة المثالية.",
      "Temperature":
          "درجة حرارة الجسم هي مقياس للحرارة الداخلية للجسم. تتراوح درجة الحرارة الطبيعية للبالغين الأصحاء حول 98.6°F (37°C)، لكنها قد تتغير قليلاً على مدار اليوم. تتأثر بعوامل مثل الوقت من اليوم، مستوى النشاط، وحتى التوتر العاطفي. \n - **الحمى**: درجة حرارة الجسم فوق 100.4°F (38°C) تشير عادةً إلى عدوى أو مرض. \n - **انخفاض الحرارة**: درجة حرارة الجسم أقل من 95°F (35°C) تعد حالة طبية طارئة، غالبًا بسبب التعرض الطويل للبرد. \n مراقبة درجة حرارة الجسم بانتظام يمكن أن تساعد في اكتشاف العلامات المبكرة للعدوى أو مشكلات صحية أخرى. إذا كنت تعاني من حمى مستمرة أو انخفاض غير طبيعي في درجة الحرارة، استشر الطبيب فورًا.",
      "Sugar":
          "سكر الدم (الجلوكوز) هو المصدر الرئيسي للطاقة لخلايا الجسم. ينظم الجسم مستويات السكر في الدم من خلال الأنسولين، وتختلف المستويات الطبيعية حسب تناول الطعام. \n - **النطاق الطبيعي**: \n - **صائم**: 70-99 mg/dL \n - **بعد الوجبة**: أقل من 140 mg/dL \n ارتفاع السكر في الدم (فرط السكر) قد يشير إلى حالات مثل السكري، بينما انخفاض السكر في الدم (نقص السكر) قد يسبب أعراضًا مثل الدوخة، التعرق، والارتباك. \n المراقبة المنتظمة مهمة لإدارة مستويات السكر، خاصة للأفراد المصابين بالسكري أو مقدمات السكري. إذا كانت مستوياتك غير طبيعية باستمرار، استشر طبيبك للحصول على المشورة.",
      "Cholesterol":
          "الكوليسترول هو مادة دهنية يحتاجها الجسم لبناء الخلايا وإنتاج بعض الهرمونات. ينتقل في مجرى الدم بواسطة نوعين من البروتينات الدهنية: البروتين الدهني منخفض الكثافة (LDL) المعروف باسم \"الكوليسترول الضار\"، والبروتين الدهني عالي الكثافة (HDL) المعروف باسم \"الكوليسترول الجيد\". \n - **المستويات الطبيعية**: \n - **الكوليسترول الكلي**: أقل من 200 mg/dL \n - **LDL**: أقل من 100 mg/dL (يفضل أقل من 70 لمن هم عرضة للخطر) \n - **HDL**: 60 mg/dL أو أعلى هو الأفضل \n - **الدهون الثلاثية**: أقل من 150 mg/dL \n المراقبة المنتظمة لمستويات الكوليسترول تساعد في تحديد مخاطر أمراض القلب. إذا كنت قلقًا بشأن مستوياتك، استشر مقدم الرعاية الصحية لإدارة الكوليسترول من خلال تغييرات في نمط الحياة أو الأدوية."
    };

    return map[label] ?? "";
  } else if (ctrl == const Locale("it")) {
    var map = {
      "Wellness Index":
          "L'Indice di Benessere è un punteggio predittivo del rischio che aiuta a valutare il rischio cardiovascolare nei prossimi 5-10 anni. Si basa sui parametri vitali misurati dalla nostra tecnologia ed è meglio interpretato in condizioni stabili a riposo.\n - **Punteggio più alto**: indica un rischio ridotto di malattie cardiovascolari.\n - **Fattori influenti**: l'indice è influenzato dalla frequenza cardiaca, dalla variabilità della frequenza cardiaca (HRV), dai livelli di stress, dalla saturazione di ossigeno e dalla pressione sanguigna.\n - **Esempio**: una frequenza cardiaca a riposo superiore a 65 riduce il punteggio a un livello medio, mentre valori superiori a 84 portano a un punteggio basso. Alti livelli di stress, bassa saturazione di ossigeno o pressione alta possono anche abbassare il punteggio.\n Monitorare l'Indice di Benessere nel tempo aiuta a tracciare la salute cardiovascolare generale. Misurazioni regolari e consultazioni con il medico garantiscono intuizioni precise e consigli utili.",
      "Pulse Rate":
          "La frequenza cardiaca è il numero di battiti al minuto. Il range normale a riposo per un adulto sano è tra 60-100 battiti al minuto e varia in base all'attività, alle emozioni e allo stato di salute. Riflette l'efficienza del cuore nel pompare sangue ricco di ossigeno nel corpo.\n Una frequenza cardiaca elevata a riposo può indicare condizioni come stress, infezioni o anemia, mentre una frequenza più bassa è comune nelle persone attive. Monitorare la frequenza cardiaca aiuta a valutare la forma fisica, la salute del cuore e l'efficacia dei farmaci. Se noti un battito cardiaco irregolare, consulta immediatamente un medico.",
      "Respiration Rate":
          "La frequenza respiratoria è il numero di respiri al minuto e, per un adulto sano, solitamente varia tra 12-20. Aiuta a mantenere l'equilibrio di ossigeno e anidride carbonica nel corpo.\n La frequenza respiratoria può variare a causa di esercizio fisico, emozioni, febbre o condizioni mediche. Sebbene le variazioni possano essere normali dopo l'attività, anomalie persistenti possono indicare problemi di salute come disidratazione o problemi cardiaci.\n Monitorare la frequenza respiratoria può aiutare a individuare preoccupazioni mediche. Se noti cambiamenti anomali o difficoltà respiratorie, consulta immediatamente un medico.",
      "Stress Index":
          "Lo stress è la risposta del corpo alle sfide o alle richieste. L'app misura il livello di stress utilizzando l'Indice di Stress di Baevsky, che si basa sulla variabilità della frequenza cardiaca (HRV).\n - **Calcolo dell'Indice di Stress**: derivato dalle misurazioni HRV, riflette lo stato fisiologico.\n - **Analisi dell'HRV**: un metodo riconosciuto a livello globale per valutare la funzione del sistema nervoso autonomo.\n - **Scopo**: l'Indice di Stress aiuta a identificare il tuo livello di stress.",
      "Oxygen Saturation":
          "La saturazione di ossigeno (SpO2) misura la percentuale di ossigeno trasportata dai globuli rossi. I livelli normali variano tra il 95%-100% nei polmoni sani, ma possono essere inferiori negli individui con malattie croniche.\n Livelli inferiori al 90% indicano ipossiemia, che può derivare da condizioni come BPCO, asma, insufficienza cardiaca o altitudini elevate. I sintomi includono respiro corto, frequenza cardiaca elevata e cambiamento di colore della pelle (cianosi).\n Gli atleti monitorano lo SpO2 per valutare le variazioni delle prestazioni dovute all'altitudine. Se i tuoi livelli di ossigeno sono bassi o noti sintomi, consulta un medico per consigli adeguati.",
      "Blood Pressure":
          "La pressione sanguigna misura la forza con cui il sangue scorre contro le pareti delle arterie ed è registrata con due numeri:\n - **Pressione sistolica (numero superiore)**: la pressione quando il cuore pompa il sangue.\n - **Pressione diastolica (numero inferiore)**: la pressione quando il cuore è a riposo tra i battiti.\n La pressione sistolica normale varia tra 100 e 129. Livelli elevati (130 o più) o bassi (inferiori a 100) possono indicare problemi di salute. L'ipertensione spesso non presenta sintomi ma aumenta il rischio di malattie cardiache e ictus.\n La pressione sanguigna cambia con le attività e dovrebbe essere misurata a riposo. La diagnosi richiede più letture nel tempo. Il controllo della pressione include cambiamenti nello stile di vita, farmaci e monitoraggio regolare. Consulta il medico per una valutazione accurata e consigli utili.",
      "Hemoglobin":
          "L'emoglobina è una proteina nei globuli rossi che trasporta l'ossigeno agli organi e ai tessuti e rimuove l'anidride carbonica. Si misura in grammi per decilitro (g/dL).\n **Livelli sani**:\n - **Uomini**: 14-18 g/dL\n - **Donne**: 12-16 g/dL\n Comprendere i livelli di emoglobina aiuta a valutare l'efficienza del trasporto di ossigeno nel corpo. Il monitoraggio regolare è essenziale per mantenere una buona salute.",
      "Hemoglobin A1C":
          "L'HbA1c riflette la media dei livelli di zucchero nel sangue negli ultimi 2-3 mesi ed è misurato in percentuale.\n **Intervalli**:\n - **Normale**: inferiore a 5.6%\n - **Pre-diabete**: 5.7% - 6.4%\n - **Diabete**: superiore a 6.5%\n Monitorare l'HbA1c aiuta a valutare il controllo a lungo termine della glicemia e il rischio di diabete. Gli esami regolari sono fondamentali per la salute ottimale.",
      "Temperature":
          "La temperatura corporea è una misura del calore interno del corpo. Per un adulto sano, la temperatura normale è circa 98.6°F (37°C), ma può variare leggermente durante la giornata. È influenzata da fattori come ora del giorno, livello di attività e stress emotivo.\n - **Febbre**: una temperatura superiore a 100.4°F (38°C) di solito indica un'infezione o una malattia.\n - **Ipotermia**: una temperatura inferiore a 95°F (35°C) è un'emergenza medica, spesso dovuta a esposizione prolungata al freddo.\n Monitorare regolarmente la temperatura corporea aiuta a rilevare segni precoci di infezione o altri problemi di salute. Se hai febbre persistente o un calo anomalo della temperatura, consulta immediatamente un medico.",
      "Sugar":
          "La glicemia (glucosio) è la principale fonte di energia per le cellule del corpo. Il corpo regola i livelli di zucchero nel sangue tramite l'insulina e i valori normali variano in base all'alimentazione.\n - **Range normale**:\n - **A digiuno**: 70-99 mg/dL\n - **Dopo i pasti**: inferiore a 140 mg/dL\n L'iperglicemia può indicare condizioni come il diabete, mentre l'ipoglicemia può causare sintomi come vertigini, sudorazione e confusione.\n Il monitoraggio regolare è essenziale per gestire i livelli di zucchero, specialmente per chi ha diabete o pre-diabete. Se i tuoi livelli sono frequentemente anormali, consulta il medico per un consiglio.",
      "Cholesterol":
          "Il colesterolo è una sostanza grassa necessaria per costruire le cellule e produrre ormoni. È trasportato nel sangue da due tipi di lipoproteine: LDL (colesterolo cattivo) e HDL (colesterolo buono).\n - **Livelli normali**:\n - **Colesterolo totale**: inferiore a 200 mg/dL\n - **LDL**: inferiore a 100 mg/dL (preferibilmente <70 per soggetti a rischio)\n - **HDL**: 60 mg/dL o superiore è ottimale\n - **Trigliceridi**: inferiori a 150 mg/dL\n Il monitoraggio regolare aiuta a prevenire malattie cardiache. Se sei preoccupato per i tuoi livelli, consulta un medico."
    };

    return map[label] ?? "";
  } else if (ctrl == const Locale("uk")) {
    var map = {
      "Wellness Index":
          """Індекс здоров'я — це прогностичний показник ризику, який допомагає оцінити серцево-судинний ризик на найближчі 5-10 років. Він базується на виміряних життєвих показниках нашою технологією і найкраще інтерпретується в спокійних умовах. 
    - **Вищий показник**: Вказує на нижчий серцево-судинний ризик. 
    - **Фактори**: Оцінка залежить від частоти серцевих скорочень, варіабельності серцевого ритму (HRV), рівня стресу, насичення киснем та артеріального тиску. 
    - **Приклад**: Спокійний пульс вище 65 знижує показник до середнього рівня, а значення понад 84 призводять до низького показника. Високий рівень стресу, низька насиченість киснем або високий тиск також можуть зменшити оцінку. 
    Спостереження за індексом здоров'я з часом допомагає контролювати стан серцево-судинної системи. Регулярні вимірювання та консультації з лікарем забезпечують точний аналіз і корисні рекомендації.",

"Pulse Rate": 
    "Частота пульсу — це кількість серцевих ударів за хвилину. Нормальний показник у стані спокою для дорослих становить 60-100 ударів за хвилину, змінюючись залежно від активності, емоційного стану та здоров'я. Він відображає, як серце перекачує кров, насичену киснем. 
    Швидкий пульс у спокої може свідчити про стрес, інфекцію або анемію, тоді як повільний ритм часто спостерігається у фізично активних людей. Контроль частоти серцевих скорочень допомагає стежити за рівнем фізичної форми, станом серця та ефективністю ліків. Якщо серцевий ритм здається нерегулярним, зверніться до лікаря.",

"Respiration Rate": 
    "Частота дихання — це кількість вдихів за хвилину, зазвичай 12-20 для здорових дорослих. Вона допомагає підтримувати баланс кисню та вуглекислого газу в організмі. 
    Дихання може змінюватися через фізичні навантаження, емоції, гарячку або медичні стани. Хоча короткочасні зміни нормальні, тривалі порушення можуть свідчити про зневоднення або проблеми з серцем. 
    Контроль частоти дихання допомагає виявляти можливі проблеми зі здоров'ям. Якщо у вас з’являються труднощі з диханням або незвичні зміни, зверніться до лікаря.",

"Stress Index": 
    "Стрес — це реакція організму на виклики або вимоги. Додаток вимірює рівень стресу за допомогою Індексу стресу Баєвського, який базується на варіабельності серцевого ритму (HRV). 
    - **Розрахунок індексу стресу**: Визначається на основі вимірювань HRV та відображає фізіологічний стан організму. 
    - **Аналіз HRV**: Глобально визнаний метод оцінки функції автономної нервової системи. 
    - **Мета**: Допомагає визначити рівень вашого стресу.",

"Oxygen Saturation": 
    "SpO2 показує, наскільки ефективно червоні кров'яні тільця переносять кисень. Нормальні рівні складають 95%-100% для здорових легенів, але можуть бути нижчими у людей із хронічними захворюваннями. 
    Значення нижче 90% свідчать про гіпоксемію, яку можуть спричинити ХОЗЛ, астма, серцева недостатність або перебування на великій висоті. Симптоми включають задишку, прискорене серцебиття та синюшність шкіри. 
    Спортсмени можуть контролювати SpO2 для оцінки змін продуктивності через висоту. Якщо рівень SpO2 низький або є симптоми, зверніться до лікаря.",

"Blood Pressure": 
    "Артеріальний тиск — це сила, з якою кров тисне на стінки артерій, і вимірюється двома показниками: 
    - **Систолічний тиск (верхнє значення)**: Тиск у момент скорочення серця. 
    - **Діастолічний тиск (нижнє значення)**: Тиск у момент розслаблення серця. 
    Нормальний систолічний тиск становить 100-129 мм рт. ст. Показники від 130 і вище або нижче 100 можуть сигналізувати про проблеми зі здоров’ям. 
    Високий тиск часто не має симптомів, але збільшує ризик серцевих захворювань і інсульту. Контролювати тиск важливо для підтримки здоров’я. Якщо показники виходять за межі норми, зверніться до лікаря.",

"Hemoglobin": 
    "Гемоглобін — це білок у червоних кров'яних тільцях, який переносить кисень до органів і тканин та виводить вуглекислий газ. Вимірюється в грамах на децилітр (г/дл). 
    **Нормальні рівні**: 
    - **Чоловіки**: 14-18 г/дл 
    - **Жінки**: 12-16 г/дл 
    Контроль рівня гемоглобіну допомагає оцінити ефективність транспорту кисню в організмі.",

"Hemoglobin A1C": 
    "HbA1c відображає середній рівень цукру в крові за останні 2-3 місяці та вимірюється у відсотках. 
    **Діапазони**: 
    - **Норма**: Менше 5,6% 
    - **Предіабет**: 5,7%-6,4% 
    - **Діабет**: Більше 6,5% 
    Контроль HbA1c допомагає оцінити ризики діабету та контролювати рівень глюкози.",

"Temperature": 
    "Температура тіла — це показник внутрішнього тепла організму. Нормальна температура для здорових дорослих становить приблизно 98,6°F (37°C), але може незначно змінюватися. 
    - **Лихоманка**: Температура вище 100,4°F (38°C) може свідчити про інфекцію. 
    - **Гіпотермія**: Температура нижче 95°F (35°C) є небезпечною для життя. 
    Регулярний контроль температури допомагає виявити ранні ознаки хвороб.",

"Sugar": 
    "Рівень цукру в крові — це основне джерело енергії для клітин організму. 
    - **Нормальні значення**: 
      - **Натще**: 70-99 мг/дл 
      - **Після їжі**: Менше 140 мг/дл 
    Високий або низький рівень глюкози може свідчити про проблеми зі здоров’ям. Регулярний контроль важливий для підтримки оптимального стану здоров’я.",

"Cholesterol": 
    "Холестерин — це жирова речовина, необхідна організму. 
    - **Здорові показники**: 
      - **Загальний холестерин**: Менше 200 мг/дл 
      - **LDL (поганий холестерин)**: Менше 100 мг/дл 
      - **HDL (хороший холестерин)**: Вище 60 мг/дл 
    Високий рівень холестерину збільшує ризик серцевих хвороб. Регулярний контроль допомагає запобігти ускладненням."""
    };

    return map[label] ?? "";
  } else {
    var map = {
      "Wellness Index":
          """O Índice de Bem-Estar é um score de risco preditivo que ajuda a avaliar o risco cardiovascular nos próximos 5 a 10 anos. Ele é baseado nos sinais vitais medidos por nossa tecnologia e deve ser interpretado sob condições consistentes e em repouso.
     Score mais alto: Indica um menor risco cardiovascular.
     Fatores: O score é influenciado pela frequência cardíaca, variabilidade da frequência cardíaca (HRV), níveis de estresse, saturação de oxigênio e pressão arterial.
     Exemplo: Uma frequência cardíaca de repouso acima de 65 reduz o score para médio, enquanto valores acima de 84 resultam em um score baixo. Altos níveis de estresse, baixa saturação de oxigênio ou pressão arterial elevada também podem reduzir o score.
     Monitorar o Índice de Bem-Estar ao longo do tempo ajuda a acompanhar a saúde cardiovascular geral. Medições regulares e consultas com o seu médico garantem informações precisas e recomendações adequadas.""",
      "Pulse Rate":
          """A sua frequência cardíaca é o número de batimentos por minuto. Uma frequência cardíaca de repouso normal para adultos saudáveis varia entre 60 e 100 batimentos por minuto, dependendo da atividade, das emoções e das condições de saúde. Ela reflete como o seu coração bombeia sangue rico em oxigênio pelo corpo.
    Uma frequência cardíaca elevada em repouso pode indicar condições como estresse, infecção ou anemia, enquanto uma frequência mais baixa é comum em pessoas ativas. Monitorar sua frequência cardíaca ajuda a acompanhar a aptidão física, a saúde do coração e a eficácia dos medicamentos. Se seu batimento cardíaco parecer irregular, consulte um médico imediatamente.""",
      "Respiration Rate":
          """A sua frequência respiratória é o número de respirações por minuto, normalmente entre 12 e 20 para adultos saudáveis. Ela garante o equilíbrio do oxigênio e do dióxido de carbono no corpo.
    A frequência respiratória pode variar devido ao exercício, emoções, febre ou condições médicas. Embora mudanças temporárias sejam normais após a atividade, anormalidades persistentes podem indicar problemas de saúde, como desidratação ou doenças cardíacas.
    Monitorar sua frequência respiratória pode ajudar a identificar preocupações com a saúde. Se notar alterações incomuns ou dificuldade para respirar, consulte um médico imediatamente.""",
      "Stress Index":
          """O estresse é a resposta do corpo a desafios ou exigências. O aplicativo mede o estresse usando o Índice de Estresse de Baevsky, baseado na Variabilidade da Frequência Cardíaca (VFC). Veja como funciona:
    Cálculo do Índice de Estresse: Derivado das medições da VFC, reflete as condições fisiológicas.
    Análise da VFC: Um método reconhecido globalmente para avaliar a função do sistema nervoso autônomo.
    Propósito: O Índice de Estresse ajuda a determinar seu nível de estresse.""",
      "Oxygen Saturation":
          """A SpO₂ mede a quantidade de oxigênio transportada pelos seus glóbulos vermelhos. Os níveis normais variam de 95% a 100% para pulmões saudáveis, mas podem ser mais baixos em pessoas com condições crônicas.
    Níveis abaixo de 90% indicam hipoxemia, causada por condições como DPOC, asma, insuficiência cardíaca ou exposição a grandes altitudes. Os sintomas incluem falta de ar, frequência cardíaca acelerada e coloração azulada da pele (cianose).
    Atletas podem monitorar a SpO₂ para avaliar mudanças no desempenho devido à altitude. Se sua SpO₂ estiver baixa ou se notar sintomas, consulte um médico para orientações adequadas à sua condição.""",
      "Blood Pressure":
          """A pressão arterial mede a força do sangue contra as paredes das artérias e é registrada com dois números:
    Pressão sistólica (número superior): Pressão quando o coração bombeia sangue.
    Pressão diastólica (número inferior): Pressão quando o coração repousa entre os batimentos.
    A pressão sistólica normal varia entre 100 e 129. Níveis elevados (130 ou mais) ou baixos (abaixo de 100) podem indicar problemas de saúde. A hipertensão arterial (pressão alta) geralmente não apresenta sintomas, mas aumenta o risco de doenças cardíacas e derrames.
    A pressão arterial muda conforme a atividade e deve ser medida em repouso. Um diagnóstico requer várias medições ao longo do tempo. O controle da pressão arterial envolve mudanças no estilo de vida, medicação e monitoramento regular. Consulte seu médico para uma avaliação precisa e orientações adequadas.""",
      "Hemoglobin":
          """A hemoglobina é uma proteína presente nos glóbulos vermelhos que transporta oxigênio para os órgãos e tecidos do corpo e remove o dióxido de carbono. Ela é medida em gramas por decilitro (g/dL).
    Faixas saudáveis:
    Homens: 14 a 18 g/dL
    Mulheres: 12 a 16 g/dL
    Compreender os seus níveis de hemoglobina ajuda a avaliar a eficiência do transporte de oxigênio no corpo. O monitoramento regular é essencial para manter a saúde.""",
      "Hemoglobin A1C":
          """A HbA1c reflete a média dos níveis de açúcar no sangue nos últimos 2 a 3 meses e é medida em porcentagem.
    Faixas:
    Normal: Menos de 5,6%
    Risco de pré-diabetes: 5,7% a 6,4%
    Risco de diabetes: Superior a 6,5%
    O monitoramento da HbA1c ajuda a avaliar o controle do açúcar no sangue a longo prazo e a identificar riscos de diabetes. Exames regulares são essenciais para manter a saúde em equilíbrio.""",
      "Temperature":
          """A temperatura corporal mede o calor interno do corpo. A temperatura normal para adultos saudáveis é de aproximadamente 98,6 °F (37 °C), mas pode variar ligeiramente ao longo do dia. Fatores como horário do dia, nível de atividade e até estresse emocional podem influenciá-la.
    Febre: Uma temperatura corporal acima de 100,4 °F (38 °C) geralmente indica uma infecção ou doença.
    Hipotermia: Uma temperatura corporal abaixo de 95 °F (35 °C) é uma emergência médica, muitas vezes causada por exposição prolongada ao frio.
    Monitorar regularmente a temperatura corporal pode ajudar a identificar sinais precoces de infecção ou outros problemas de saúde. Se apresentar febre persistente ou temperatura anormalmente baixa, consulte um médico imediatamente.""",
      "Sugar":
          """O açúcar no sangue (glicose) é a principal fonte de energia para as células do corpo. O organismo regula os níveis de glicose por meio da insulina, e os valores normais variam dependendo da alimentação.
    Faixa normal:
    Em jejum: 70-99 mg/dL
    Pós-refeição: Menos de 140 mg/dL
    Altos níveis de açúcar no sangue (hiperglicemia) podem indicar condições como diabetes, enquanto baixos níveis (hipoglicemia) podem causar sintomas como tontura, suor e confusão.
    O monitoramento regular é essencial para o controle da glicemia, especialmente para pessoas com diabetes ou pré-diabetes. Consulte seu médico se seus níveis estiverem frequentemente fora do normal.""",
      "Cholesterol":
          """O colesterol é uma substância gordurosa essencial para o corpo, necessária para construir células e produzir certos hormônios. Ele é transportado pelo sangue por dois tipos de lipoproteínas: a lipoproteína de baixa densidade (LDL), conhecida como "colesterol ruim", e a lipoproteína de alta densidade (HDL), chamada de "colesterol bom".
    Níveis normais:
    Colesterol total: Menos de 200 mg/dL
    LDL: Menos de 100 mg/dL (idealmente abaixo de 70 para pessoas de alto risco)
    HDL: 60 mg/dL ou mais é o ideal
    Triglicerídeos: Menos de 150 mg/dL
    Níveis elevados de colesterol LDL ou triglicerídeos aumentam o risco de doenças cardíacas e derrames. Por outro lado, um nível elevado de colesterol HDL pode ajudar a proteger o coração.
    Monitorar regularmente os níveis de colesterol pode ajudar a identificar riscos cardiovasculares. Se o seu colesterol estiver alto ou se tiver dúvidas, consulte um profissional de saúde para orientação sobre como gerenciá-lo por meio de mudanças no estilo de vida ou medicação."""
    };
    return map[label] ?? "";
  }
}

String fethchinfo(label) {
  var map = {
    "Wellness Index":
        """The Wellness Index is a prediction risk score that helps assess cardiovascular risk for the next 5 to 10 years. It is based on vital signs measured by our technology and is best interpreted under consistent conditions at rest. 
    - **Higher Score**: Indicates lower cardiovascular risk. 
    - **Factors**: The score is influenced by Heart Rate, Heart Rate Variability (HRV), Stress Levels, Oxygen Saturation, and Blood Pressure. 
    - **Example**: A resting heart rate above 65 reduces the score to medium, while levels above 84 result in a low score. High stress levels, low oxygen saturation, or high blood pressure readings can also lower the score. 
    Monitoring the Wellness Index over time helps track overall cardiovascular health. Regular measurements and consultations with your doctor ensure accurate insights and advice.""",
    "Pulse Rate":
        """Your heart rate is the number of beats per minute. A normal resting rate for healthy adults is 60-100 beats per minute, varying with activity, emotions, and health conditions. It reflects how your heart pumps oxygen-rich blood to your body. 
    A fast heart rate at rest may signal conditions like stress, infection, or anemia, while a slower rate is common in active individuals. Monitoring your heart rate helps track fitness, heart health, and medication effectiveness. If your heartbeat feels irregular, consult a doctor promptly.""",
    "Respiration Rate":
        """Your breathing rate is the number of breaths per minute, normally 12-20 for healthy adults. It ensures a balance of oxygen and carbon dioxide in the body. 
    Breathing rates can vary due to exercise, emotions, fever, or medical conditions. While changes in rate may be normal after activity, persistent abnormalities might indicate health issues like dehydration or heart problems. 
    Monitoring your breathing rate can aid in identifying health concerns. If you notice unusual changes or difficulty breathing, consult a doctor promptly.""",
    "Stress Index":
        """Stress is the body's response to challenges or demands. The app measures stress using Baevsky's Stress Index, based on Heart Rate Variability (HRV). Here's how it works: 
    - **Stress Index Calculation**: Derived from HRV measurements, reflecting physiological conditions. 
    - **HRV Analysis**: A globally recognized method for assessing the autonomic nervous system's function. 
    - **Purpose**: The Stress Index helps determine your stress level.""",
    "Oxygen Saturation":
        """SpO2 measures how much oxygen your red blood cells carry. Normal levels range from 95%-100% for healthy lungs, but they may be lower in individuals with chronic conditions. 
    Levels below 90% indicate hypoxemia, caused by conditions like COPD, asthma, heart failure, or high-altitude exposure. Symptoms include shortness of breath, rapid heart rate, and skin discoloration (cyanosis). 
    Athletes can monitor SpO2 to assess performance changes due to altitude. If your SpO2 is low or you notice symptoms, consult a doctor for advice tailored to your condition.""",
    "Blood Pressure":
        """Blood pressure measures the force of blood against artery walls and is recorded with two numbers: 
    - **Systolic pressure (top number)**: Pressure when the heart pumps blood. 
    - **Diastolic pressure (bottom number)**: Pressure when the heart rests between beats. 
    Normal systolic pressure ranges from 100 to 129. Elevated levels (130 or higher) or low levels (below 100) may signal health concerns. High blood pressure (hypertension) often has no symptoms but increases the risk of heart disease and stroke. 
    Blood pressure changes with activities and should be measured at rest. A diagnosis requires multiple readings over time. Managing blood pressure involves lifestyle changes, medication, and regular monitoring. Consult your doctor for accurate assessment and advice.""",
    "Hemoglobin":
        """Hemoglobin is a protein in red blood cells that carries oxygen to the body's organs and tissues and removes carbon dioxide. It is measured in grams per deciliter (g/dL). 
    **Healthy Ranges**: 
    - **Men**: 14 to 18 g/dL 
    - **Women**: 12 to 16 g/dL 
    Understanding your hemoglobin levels helps assess oxygen transport efficiency in your body. Regular monitoring is important for maintaining health.""",
    "Hemoglobin A1C":
        """HbA1c reflects your average blood sugar levels over the past 2 to 3 months and is measured in percentages. 
    **Ranges**: 
    - **Normal**: Less than 5.6% 
    - **Prediabetes Risk**: 5.7% to 6.4% 
    - **Diabetes Risk**: Greater than 6.5% 
    Monitoring HbA1c helps assess long-term blood sugar control and identify risks of diabetes. Regular checks are essential for maintaining optimal health.""",
    "Temperature":
        """Body temperature is the measure of the body's internal heat. The normal body temperature for healthy adults is around 98.6°F (37°C), but it can vary slightly throughout the day. It can be influenced by factors such as time of day, activity level, and even emotional stress.
    - **Fever**: A body temperature above 100.4°F (38°C) typically indicates an infection or illness.
    - **Hypothermia**: A body temperature below 95°F (35°C) is a medical emergency, often due to prolonged exposure to cold environments.
    Monitoring your body temperature regularly can help detect early signs of infection or other health issues. If you experience persistent fever or abnormally low temperature, consult a doctor promptly.""",
    "Sugar":
        """Blood sugar (glucose) is the main source of energy for the body's cells. The body regulates blood sugar levels through insulin, and normal levels vary depending on whether you’ve eaten or not.
    - **Normal Range**:
      - **Fasting**: 70-99 mg/dL
      - **Post-meal**: Less than 140 mg/dL
    High blood sugar (hyperglycemia) can indicate conditions like diabetes, while low blood sugar (hypoglycemia) can cause symptoms like dizziness, sweating, and confusion.
    Regular monitoring is important for managing blood sugar, especially for individuals with diabetes or prediabetes. Consult your doctor for advice if your levels are consistently abnormal.""",
    "Cholesterol":
        """Cholesterol is a fatty substance needed by the body to build cells and produce certain hormones. It is carried through the bloodstream by two types of lipoproteins: low-density lipoprotein (LDL), often referred to as "bad" cholesterol, and high-density lipoprotein (HDL), known as "good" cholesterol.
    - **Normal Levels**:
      - **Total cholesterol**: Less than 200 mg/dL
      - **LDL**: Less than 100 mg/dL (ideally below 70 for those at high risk)
      - **HDL**: 60 mg/dL or higher is optimal
      - **Triglycerides**: Less than 150 mg/dL
    High levels of LDL cholesterol or triglycerides can increase the risk of heart disease and stroke. On the other hand, high HDL cholesterol can protect against heart disease.
    Monitoring cholesterol levels regularly can help identify risks of cardiovascular conditions. If your cholesterol is high or you have concerns, consult a healthcare provider for guidance on managing your cholesterol through lifestyle changes or medication."""
  };
  return map[label] ?? "";
}

class NotepadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1.0;

    const double lineSpacing = 24.0;
    for (double y = lineSpacing; y < size.height; y += lineSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
