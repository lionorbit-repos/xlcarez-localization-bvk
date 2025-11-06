// ignore_for_file: file_names

import 'package:XLcarez/env/appexports.dart';

class RiskScoreDetailsView extends StatelessWidget {
  final String image;
  final String header;
  final String title;
  final dynamic indictor;
  final dynamic score;
  final dynamic col;
  final dynamic val;
  const RiskScoreDetailsView(
      {super.key,
      required this.header,
      required this.image,
      required this.title,
      this.val,
      this.indictor,
      this.score,
      this.col});

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
          appBar: Themeappbar(
            title: header,
            leading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  myyellowcard(
                      child: title != "Anemia Grading"
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Apptextwidget(
                                  header,
                                  style: TxtStls.stl16,
                                ),
                                appspace(h: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        indictor ?? const SizedBox.shrink(),
                                        appspace(h: 10),
                                        Apptextwidget(
                                          val ?? "$score",
                                          style: TxtStls.stl20,
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: CircularProgressIndicator(
                                            value: (title == "Stress Level"
                                                    ? double.parse(
                                                        val.toString())
                                                    : double.parse(
                                                        score.toString())) /
                                                checklabel(title),
                                            strokeWidth: 10,
                                            backgroundColor:
                                                const Color(0xFFE7ECFF),
                                            valueColor:
                                                AlwaysStoppedAnimation(col),
                                          ),
                                        ),
                                        mydashcard(image)
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          // ? Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Column(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Apptextwidget(
                          //             header,
                          //             style: TxtStls.stl16,
                          //           ),
                          //           appspace(h: 10),
                          //           indictor ?? const SizedBox.shrink(),
                          //           appspace(h: 10),
                          //           Apptextwidget(
                          //             "$score",
                          //             style: TxtStls.stl20,
                          //           ),
                          //         ],
                          //       ),
                          //       Stack(
                          //         alignment: Alignment.center,
                          //         children: [
                          //           SizedBox(
                          //             height: 100,
                          //             width: 100,
                          //             child: CircularProgressIndicator(
                          //               value: score / checklabel(title),
                          //               strokeWidth: 10,
                          //               backgroundColor:
                          //                   const Color(0xFFE7ECFF),
                          //               valueColor: AlwaysStoppedAnimation(col),
                          //             ),
                          //           ),
                          //           mydashcard(image)
                          //         ],
                          //       )
                          //     ],
                          //   )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    mydashcard(image),
                                    appspace(w: 10),
                                    Apptextwidget(
                                      header,
                                      style: TxtStls.stl16,
                                    ),
                                  ],
                                ),
                                appspace(h: 10),
                                Apptextwidget(
                                  "$score",
                                  style: TxtStls.stl16,
                                ),
                              ],
                            )),
                  appspace(h: 10),
                  myyellowcard(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Apptextwidget(
                        genrateriskinfoloc(context, title),
                        style: TxtStls.stl13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

String genrateriskinfoloc(context, key) {
  final loc =
      Provider.of<Localizationcontroller>(context, listen: false).locale;
  if (loc == const Locale("en")) {
    var riskinfo = {
      "Stress Level": """
Stress level refers to the intensity of psychological, emotional, or physical strain caused by external or internal factors. It can range from mild to severe and varies from person to person. Stress can result from work pressures, personal challenges, or health concerns, and it often triggers reactions like anxiety, irritability, or fatigue.

Stress is commonly categorized as:

Acute Stress: Short-term stress caused by a specific event or situation, like a tight deadline or a disagreement.
Chronic Stress: Long-term stress that persists over time due to ongoing issues like financial problems or unresolved relationships.
High stress levels can lead to negative effects on both mental and physical health, such as sleep disturbances, headaches, and increased risk for conditions like heart disease. However, manageable stress can sometimes boost motivation and performance.

To maintain healthy stress levels, relaxation techniques, exercise, and healthy coping strategies are often recommended.
""",
      "Diabetes Risk Score": """
The Diabetes Risk Score is a tool used to estimate an individual's risk of developing diabetes, particularly Type 2 diabetes, based on various factors such as lifestyle, age, family history, and health status. The score helps identify people who may benefit from preventive measures to lower their risk.

The scoring system typically considers factors such as:

Age: Older age increases the risk of developing diabetes.
Body Mass Index (BMI): Higher BMI, indicating overweight or obesity, is a significant risk factor.
Family History: Having a close family member with diabetes raises the risk.
Physical Activity: A sedentary lifestyle increases the risk.
Diet: A diet high in sugar, processed foods, and low in fiber can contribute to higher risk.
Blood Pressure: High blood pressure is often linked to an increased risk of diabetes.
Ethnicity: Some ethnic groups, such as African-American, Hispanic, and Asian, have a higher risk.
Gestational Diabetes: Women who have had gestational diabetes are at greater risk of developing Type 2 diabetes later in life.
The score typically results in a number, which is then used to classify individuals as low, moderate, or high risk. If someone has a high score, they may be advised to take preventive actions such as improving their diet, increasing physical activity, or getting regular health check-ups to monitor blood sugar levels.
""",
      "Cardio Vascular Risk": """
Cardiovascular risk refers to the likelihood of developing heart disease or having a stroke, based on various lifestyle and health factors. It’s often assessed using a Cardiovascular Risk Score, which considers a range of factors that contribute to the development of cardiovascular diseases (CVD), including coronary artery disease, heart attack, and stroke.

The key factors typically assessed in calculating cardiovascular risk include:

Age: The risk increases as you age, especially after 45 for men and 55 for women.
Gender: Men generally have a higher risk at a younger age, but the risk for women increases after menopause.
Blood Pressure: High blood pressure (hypertension) is one of the leading risk factors for CVD.
Cholesterol Levels: Elevated levels of total cholesterol, LDL (bad cholesterol), or low levels of HDL (good cholesterol) increase the risk.
Smoking: Smoking damages blood vessels and increases the likelihood of plaque buildup in arteries.
Diabetes: Having diabetes or prediabetes increases the risk of developing heart disease.
Family History: A family history of heart disease or stroke can increase the risk.
Diet: Diets high in saturated fats, trans fats, sodium, and low in fiber are linked to higher risk.
Physical Activity: A lack of regular exercise contributes to obesity, high blood pressure, and poor cholesterol levels, all of which increase cardiovascular risk.
Obesity: Being overweight or obese increases the strain on the heart and raises blood pressure and cholesterol levels.
Stress: Chronic stress can increase blood pressure and contribute to unhealthy behaviors like smoking or overeating.
The Framingham Risk Score is one commonly used tool to calculate the risk of cardiovascular events, particularly heart disease, in the next 10 years. The score helps healthcare providers identify individuals at higher risk and recommend lifestyle changes, medications, or further testing to manage their cardiovascular health.

Reducing cardiovascular risk typically involves lifestyle changes such as adopting a healthy diet, exercising regularly, quitting smoking, managing stress, and possibly taking medications to control cholesterol, blood pressure, or diabetes.
""",
      "Obesity Grading - BMI": """
Obesity grading based on BMI (Body Mass Index) is used to categorize the severity of obesity, helping to assess an individual’s risk for associated health conditions such as heart disease, diabetes, and high blood pressure. The higher the BMI, the greater the risk of these health issues. Here’s how obesity is graded:

BMI Categories for Risk Score Details
Underweight: BMI < 18.5
Potential risks: Nutrient deficiencies, weakened immune system, osteoporosis.
Normal weight: BMI 18.5 - 24.9
Healthy range with lower risk of chronic diseases.
Overweight: BMI 25 - 29.9
Increased risk of hypertension, diabetes, and heart disease.
Obesity (Class 1, 2, 3): BMI ≥ 30:

Class 1 (Moderate Obesity):

BMI: 30.0 to 34.9
Individuals in this category are considered moderately obese. There may be an increased risk for health problems, but with lifestyle changes, risk factors can often be managed.
Class 2 (Severe Obesity):

BMI: 35.0 to 39.9
This level of obesity increases the risk of chronic diseases significantly. Individuals may need medical intervention to manage weight and associated risks, such as diabetes and heart disease.
Class 3 (Very Severe or Morbid Obesity):

BMI: 40.0 or greater
This is considered a high-risk category for life-threatening health conditions, and individuals may require more intensive interventions like bariatric surgery or medical weight management. It significantly increases the risk of diabetes, heart disease, stroke, and other serious conditions.
In addition to BMI, waist circumference and waist-to-hip ratio are also commonly used to assess obesity, especially abdominal fat, which can be a significant risk factor for cardiovascular disease.

It's important to note that BMI is a general guideline and doesn’t account for factors like muscle mass, bone density, or fat distribution. Therefore, it should be used in combination with other health assessments to determine overall health risks.
""",
      "Depression Score": """
The Depression Score is a measure used to assess the severity of depressive symptoms in an individual. It helps healthcare providers evaluate whether someone might be experiencing depression and how intense the symptoms are. Various tools and questionnaires are used to determine this score, with the Patient Health Questionnaire-9 (PHQ-9) being one of the most commonly used.

Here’s a breakdown of the PHQ-9, which is widely used for screening depression:

PHQ-9 Depression Score
The PHQ-9 consists of 9 questions, each related to the symptoms of depression. The individual rates how often they’ve experienced each symptom over the past two weeks on a scale of 0 to 3:

0 = Not at all
1 = Several days
2 = More than half the days
3 = Nearly every day
The questions focus on symptoms such as:

Little interest or pleasure in doing things
Feeling down, depressed, or hopeless
Trouble falling asleep, staying asleep, or sleeping too much
Feeling tired or having little energy
Poor appetite or overeating
Feeling bad about yourself — or that you are a failure or have let yourself or your family down
Trouble concentrating on things, such as reading the newspaper or watching television
Moving or speaking so slowly that other people could have noticed, or being so fidgety or restless that you’ve been moving around a lot more than usual
Thoughts that you would be better off dead or of hurting yourself in some way
Scoring Interpretation
0-4: Minimal or no depression
5-9: Mild depression
10-14: Moderate depression
15-19: Moderately severe depression
20-27: Severe depression
Other Depression Scoring Tools
There are several other depression assessments used depending on the context, such as:

Beck Depression Inventory (BDI): A 21-question tool for measuring the severity of depression.
Hamilton Depression Rating Scale (HDRS): A clinician-administered scale often used in research settings to assess the severity of depression.
Why It's Used
The depression score provides an initial indication of how an individual is feeling and whether they may need professional help. A higher score typically indicates more severe depression, and individuals scoring higher are often encouraged to seek counseling, therapy, or other medical treatment.

However, it's important to note that a depression score is just one tool used in diagnosing depression. A full clinical evaluation by a healthcare professional is necessary for a proper diagnosis and treatment plan.
""",
      "Anemia Grading": """
Anemia grading refers to the classification of the severity of anemia based on hemoglobin (Hb) levels in the blood. Anemia occurs when there aren’t enough red blood cells or hemoglobin to carry adequate oxygen to the body’s tissues, leading to symptoms like fatigue, weakness, dizziness, and pale skin. The grading helps determine how severe the anemia is and guides treatment.

The World Health Organization (WHO) defines anemia grading based on hemoglobin levels for different genders and age groups.

Anemia Grading by Hemoglobin Levels
Mild Anemia:

Hemoglobin:
Men: 10.0 – 12.9 g/dL
Women: 10.0 – 11.9 g/dL
Symptoms: Often mild or absent, but may include fatigue or slight weakness.
Moderate Anemia:

Hemoglobin:
Men: 7.0 – 9.9 g/dL
Women: 7.0 – 9.9 g/dL
Symptoms: Fatigue, dizziness, and shortness of breath may become more noticeable. Activity tolerance may be reduced.
Severe Anemia:

Hemoglobin:
Men: 4.0 – 6.9 g/dL
Women: 4.0 – 6.9 g/dL
Symptoms: Significant fatigue, chest pain, dizziness, and difficulty breathing. Severe cases may require immediate medical attention.
Very Severe or Life-Threatening Anemia:

Hemoglobin: Less than 4.0 g/dL
Symptoms: This is an emergency situation. Symptoms include severe fatigue, dizziness, confusion, fainting, and in some cases, organ failure.
Additional Considerations
Severity can vary based on the individual's age, gender, and overall health. For example, children and pregnant women might experience symptoms at higher hemoglobin levels compared to healthy adults.
Anemia can be caused by various factors such as iron deficiency, vitamin B12 or folic acid deficiency, chronic diseases, blood loss, or genetic conditions like sickle cell disease.
Management:
Treatment depends on the cause and severity of anemia:

For mild anemia, dietary changes and iron supplements might be sufficient.
Moderate to severe anemia may require medical intervention, such as blood transfusions, vitamin or iron supplements, or treatment of underlying conditions.
A complete evaluation, including blood tests and possibly additional tests, is crucial to determine the exact cause of anemia and the best treatment approach.
"""
    };
    return riskinfo[key] ?? "";
  } 
  else if (loc == const Locale("es")) {
    var riskinfo = {
      "Stress Level": """
El nivel de estrés se refiere a la intensidad de la tensión psicológica, emocional o física causada por factores externos o internos. Puede variar desde leve hasta severo y cambia de una persona a otra. El estrés puede ser resultado de presiones laborales, desafíos personales o problemas de salud, y a menudo desencadena reacciones como ansiedad, irritabilidad o fatiga.

El estrés se clasifica comúnmente en:

Estrés agudo: Estrés a corto plazo provocado por un evento o situación específica, como una fecha límite ajustada o una discusión.

Estrés crónico: Estrés a largo plazo que persiste debido a problemas continuos, como dificultades financieras o relaciones no resueltas.

Niveles altos de estrés pueden causar efectos negativos tanto en la salud mental como física, como trastornos del sueño, dolores de cabeza y mayor riesgo de enfermedades cardíacas. Sin embargo, el estrés manejable a veces puede aumentar la motivación y el rendimiento.

Para mantener niveles saludables de estrés, se recomiendan técnicas de relajación, ejercicio y estrategias saludables para afrontarlo.
""",
      "Diabetes Risk Score": """
El Puntaje de Riesgo de Diabetes es una herramienta utilizada para estimar el riesgo que tiene una persona de desarrollar diabetes, especialmente diabetes tipo 2, basándose en varios factores como el estilo de vida, la edad, los antecedentes familiares y el estado de salud. Este puntaje ayuda a identificar a las personas que podrían beneficiarse de medidas preventivas para reducir su riesgo.

El sistema de puntuación generalmente considera factores como:

Edad: A mayor edad, mayor es el riesgo de desarrollar diabetes.

Índice de Masa Corporal (IMC): Un IMC alto, que indica sobrepeso u obesidad, es un factor de riesgo importante.

Antecedentes familiares: Tener un familiar cercano con diabetes aumenta el riesgo.

Actividad física: Un estilo de vida sedentario incrementa el riesgo.

Dieta: Una alimentación alta en azúcares, alimentos procesados y baja en fibra puede aumentar el riesgo.

Presión arterial: La hipertensión está frecuentemente relacionada con un mayor riesgo de diabetes.

Etnicidad: Algunos grupos étnicos, como afroamericanos, hispanos y asiáticos, tienen un riesgo más alto.

Diabetes gestacional: Las mujeres que han tenido diabetes gestacional tienen mayor riesgo de desarrollar diabetes tipo 2 en el futuro.

El puntaje suele resultar en un número que clasifica a las personas en riesgo bajo, moderado o alto. Si alguien obtiene un puntaje alto, se le puede recomendar tomar acciones preventivas como mejorar su dieta, aumentar la actividad física o realizar chequeos médicos regulares para monitorear sus niveles de azúcar en sangre.
""",
      "Cardio Vascular Risk": """
El riesgo cardiovascular se refiere a la probabilidad de desarrollar enfermedades del corazón o sufrir un accidente cerebrovascular, basado en diversos factores relacionados con el estilo de vida y la salud. Generalmente se evalúa mediante un Puntaje de Riesgo Cardiovascular, que considera una serie de factores que contribuyen al desarrollo de enfermedades cardiovasculares (ECV), como la enfermedad de las arterias coronarias, infarto de miocardio y accidentes cerebrovasculares.

Los factores clave que se evalúan para calcular el riesgo cardiovascular incluyen:

Edad: El riesgo aumenta con la edad, especialmente después de los 45 años en hombres y los 55 en mujeres.

Género: Los hombres suelen tener un riesgo más alto a una edad más temprana, pero en mujeres el riesgo aumenta después de la menopausia.

Presión arterial: La hipertensión es uno de los principales factores de riesgo para las ECV.

Niveles de colesterol: Niveles elevados de colesterol total, LDL (colesterol “malo”) o niveles bajos de HDL (colesterol “bueno”) aumentan el riesgo.

Tabaquismo: Fumar daña los vasos sanguíneos y aumenta la probabilidad de acumulación de placas en las arterias.

Diabetes: Tener diabetes o prediabetes incrementa el riesgo de enfermedades cardíacas.

Antecedentes familiares: Tener familiares con enfermedades del corazón o accidentes cerebrovasculares aumenta el riesgo.

Dieta: Dietas altas en grasas saturadas, grasas trans, sodio y bajas en fibra se asocian a un mayor riesgo.

Actividad física: La falta de ejercicio regular contribuye a la obesidad, hipertensión y malos niveles de colesterol, todos factores que aumentan el riesgo cardiovascular.

Obesidad: El sobrepeso u obesidad aumenta la carga sobre el corazón y eleva la presión arterial y los niveles de colesterol.

Estrés: El estrés crónico puede aumentar la presión arterial y fomentar comportamientos poco saludables como fumar o comer en exceso.

El Puntaje de Riesgo de Framingham es una herramienta comúnmente usada para calcular el riesgo de eventos cardiovasculares, especialmente enfermedades del corazón, en los próximos 10 años. Este puntaje ayuda a los profesionales de la salud a identificar personas con mayor riesgo y recomendar cambios en el estilo de vida, medicamentos o pruebas adicionales para manejar su salud cardiovascular.

Reducir el riesgo cardiovascular generalmente implica cambios en el estilo de vida como adoptar una dieta saludable, hacer ejercicio regularmente, dejar de fumar, manejar el estrés y, en algunos casos, tomar medicamentos para controlar el colesterol, la presión arterial o la diabetes.
""",
      "Obesity Grading - BMI": """
La clasificación de la obesidad basada en el IMC (Índice de Masa Corporal) se utiliza para categorizar la gravedad de la obesidad y ayudar a evaluar el riesgo de una persona frente a enfermedades asociadas como enfermedades cardíacas, diabetes e hipertensión. A mayor IMC, mayor es el riesgo de presentar estos problemas de salud. Así se gradúa la obesidad:

Categorías de IMC y Detalles del Puntaje de Riesgo

Bajo peso: IMC < 18.5
Riesgos potenciales: deficiencias nutricionales, sistema inmunológico debilitado, osteoporosis.

Peso normal: IMC 18.5 - 24.9
Rango saludable con menor riesgo de enfermedades crónicas.

Sobrepeso: IMC 25 - 29.9
Mayor riesgo de hipertensión, diabetes y enfermedades cardíacas.

Obesidad (Clases 1, 2 y 3): IMC ≥ 30

Clase 1 (Obesidad moderada):
IMC: 30.0 a 34.9
Las personas en esta categoría se consideran moderadamente obesas. Puede haber un riesgo aumentado de problemas de salud, pero con cambios en el estilo de vida, los factores de riesgo suelen poder controlarse.

Clase 2 (Obesidad severa):
IMC: 35.0 a 39.9
Este nivel de obesidad aumenta significativamente el riesgo de enfermedades crónicas. Las personas pueden necesitar intervención médica para controlar el peso y los riesgos asociados, como la diabetes y las enfermedades cardíacas.

Clase 3 (Obesidad muy severa o mórbida):
IMC: 40.0 o más
Esta categoría es de alto riesgo para condiciones de salud que pueden poner en peligro la vida, y las personas pueden requerir intervenciones más intensivas, como cirugía bariátrica o manejo médico del peso. Aumenta significativamente el riesgo de diabetes, enfermedades cardíacas, accidente cerebrovascular y otras condiciones graves.

Además del IMC, la circunferencia de la cintura y la relación cintura-cadera también se usan comúnmente para evaluar la obesidad, especialmente la grasa abdominal, que puede ser un factor de riesgo importante para enfermedades cardiovasculares.

Es importante notar que el IMC es una guía general y no toma en cuenta factores como la masa muscular, la densidad ósea o la distribución de la grasa. Por lo tanto, debe usarse en combinación con otras evaluaciones de salud para determinar los riesgos globales.
""",
      "Depression Score": """
La Puntuación de Depresión es una medida utilizada para evaluar la severidad de los síntomas depresivos en una persona. Ayuda a los profesionales de la salud a determinar si alguien podría estar experimentando depresión y qué tan intensos son los síntomas. Se usan diversas herramientas y cuestionarios para obtener esta puntuación, siendo el Cuestionario de Salud del Paciente-9 (PHQ-9) uno de los más comunes.

Aquí tienes un resumen del PHQ-9, ampliamente utilizado para el tamizaje de la depresión:

Puntuación de Depresión PHQ-9
El PHQ-9 consta de 9 preguntas, cada una relacionada con síntomas de depresión. La persona califica con qué frecuencia ha experimentado cada síntoma en las últimas dos semanas en una escala del 0 al 3:

0 = Nunca

1 = Varios días

2 = Más de la mitad de los días

3 = Casi todos los días

Las preguntas se enfocan en síntomas como:

Poco interés o placer en hacer cosas

Sentirse deprimido, triste o sin esperanza

Problemas para dormir (dormir demasiado o poco)

Sentirse cansado o con poca energía

Poco apetito o comer en exceso

Sentirse mal consigo mismo, como un fracaso o haber decepcionado a la familia

Dificultad para concentrarse en tareas como leer o ver televisión

Movimientos o habla muy lentos o inquietud excesiva

Pensamientos de que sería mejor estar muerto o hacerse daño

Interpretación de la puntuación

0-4: Depresión mínima o ninguna

5-9: Depresión leve

10-14: Depresión moderada

15-19: Depresión moderadamente grave

20-27: Depresión grave

Otras herramientas para medir la depresión
Existen otras evaluaciones que se usan según el contexto, tales como:

Inventario de Depresión de Beck (BDI): cuestionario de 21 preguntas para medir la gravedad de la depresión.

Escala de Evaluación de Depresión de Hamilton (HDRS): escala administrada por clínicos, común en investigación, para evaluar la severidad de la depresión.

Por qué se usa
La puntuación de depresión ofrece una indicación inicial sobre cómo se siente una persona y si podría necesitar ayuda profesional. Una puntuación alta generalmente indica una depresión más severa, y se recomienda que las personas con puntuaciones elevadas busquen consejería, terapia u otro tratamiento médico.

Sin embargo, es importante destacar que esta puntuación es solo una herramienta para ayudar en el diagnóstico. Una evaluación clínica completa por un profesional de la salud es necesaria para un diagnóstico y plan de tratamiento adecuados.
""",
      "Anemia Grading": """
La clasificación de la anemia se refiere a la categorización de la gravedad de la anemia basada en los niveles de hemoglobina (Hb) en la sangre. La anemia ocurre cuando no hay suficientes glóbulos rojos o hemoglobina para transportar adecuadamente el oxígeno a los tejidos del cuerpo, lo que provoca síntomas como fatiga, debilidad, mareos y piel pálida. Esta clasificación ayuda a determinar cuán grave es la anemia y guía el tratamiento.

La Organización Mundial de la Salud (OMS) define la clasificación de la anemia según los niveles de hemoglobina para diferentes géneros y grupos de edad.

Clasificación de la anemia según los niveles de hemoglobina
Anemia leve:

Hemoglobina:
Hombres: 10.0 – 12.9 g/dL
Mujeres: 10.0 – 11.9 g/dL

Síntomas: A menudo leves o ausentes, pero pueden incluir fatiga o debilidad ligera.

Anemia moderada:

Hemoglobina:
Hombres: 7.0 – 9.9 g/dL
Mujeres: 7.0 – 9.9 g/dL

Síntomas: Fatiga, mareos y dificultad para respirar pueden volverse más evidentes. La tolerancia a la actividad puede reducirse.

Anemia severa:

Hemoglobina:
Hombres: 4.0 – 6.9 g/dL
Mujeres: 4.0 – 6.9 g/dL

Síntomas: Fatiga significativa, dolor en el pecho, mareos y dificultad para respirar. Los casos graves pueden requerir atención médica inmediata.

Anemia muy severa o que pone en peligro la vida:

Hemoglobina: menos de 4.0 g/dL

Síntomas: Esta es una situación de emergencia. Los síntomas incluyen fatiga extrema, mareos, confusión, desmayos y, en algunos casos, fallo orgánico.

Consideraciones adicionales
La gravedad puede variar según la edad, género y salud general de la persona. Por ejemplo, los niños y mujeres embarazadas pueden presentar síntomas con niveles de hemoglobina más altos que los adultos sanos.

La anemia puede ser causada por diversos factores, como deficiencia de hierro, deficiencia de vitamina B12 o ácido fólico, enfermedades crónicas, pérdida de sangre o condiciones genéticas como la enfermedad de células falciformes.

Manejo
El tratamiento depende de la causa y la gravedad de la anemia:

Para anemia leve, pueden ser suficientes cambios en la dieta y suplementos de hierro.

La anemia moderada a severa puede requerir intervención médica, como transfusiones de sangre, suplementos vitamínicos o de hierro, o tratamiento de condiciones subyacentes.

Es fundamental una evaluación completa, que incluya análisis de sangre y posiblemente pruebas adicionales, para determinar la causa exacta de la anemia y el mejor tratamiento a seguir.
"""
    };
    return riskinfo[key] ?? "";
  }
  else if (loc == const Locale("fr")) {
    var riskinfo = {
      "Stress Level": """
Le niveau de stress fait référence à l'intensité de la tension psychologique, émotionnelle ou physique causée par des facteurs externes ou internes. Il peut varier de léger à sévère et diffère d'une personne à l'autre. Le stress peut résulter de pressions au travail, de défis personnels ou de préoccupations de santé, et il déclenche souvent des réactions telles que l'anxiété, l'irritabilité ou la fatigue.
Le stress est généralement classé en :
Stress aigu : Stress à court terme causé par un événement ou une situation spécifique, comme une échéance serrée ou un désaccord.
Stress chronique : Stress à long terme qui persiste en raison de problèmes continus, tels que des difficultés financières ou des relations non résolues.
Un niveau de stress élevé peut avoir des effets négatifs sur la santé mentale et physique, tels que des troubles du sommeil, des maux de tête et un risque accru de maladies cardiaques. Cependant, un stress bien géré peut parfois améliorer la motivation et les performances.
Pour maintenir un niveau de stress sain, il est souvent recommandé d'utiliser des techniques de relaxation, de l'exercice physique et des stratégies d'adaptation positives.
""",
      "Diabetes Risk Score":
          """L'Indice de Risque de Diabète est un outil utilisé pour estimer le risque qu’une personne développe un diabète, en particulier le diabète de type 2, en fonction de divers facteurs tels que le mode de vie, l'âge, les antécédents familiaux et l'état de santé. Ce score aide à identifier les personnes qui pourraient bénéficier de mesures préventives pour réduire leur risque.
Le système de score prend généralement en compte les facteurs suivants :
Âge : Un âge avancé augmente le risque de développer un diabète.
Indice de Masse Corporelle (IMC) : Un IMC élevé, indiquant un surpoids ou une obésité, est un facteur de risque important.
Antécédents familiaux : Avoir un proche atteint de diabète augmente le risque.
Activité physique : Un mode de vie sédentaire accroît le risque.
Alimentation : Une alimentation riche en sucre et en aliments transformés, et pauvre en fibres, peut augmenter le risque.
Pression artérielle : Une hypertension est souvent liée à un risque accru de diabète.
Origine ethnique : Certains groupes ethniques, comme les Afro-Américains, les Hispaniques et les Asiatiques, présentent un risque plus élevé.
Diabète gestationnel : Les femmes ayant eu un diabète gestationnel ont un risque accru de développer un diabète de type 2 plus tard dans leur vie.
Le score donne généralement un chiffre qui classe les individus en faible, modéré ou haut risque. En cas de score élevé, il est conseillé de prendre des mesures préventives, comme améliorer son alimentation, augmenter son activité physique ou effectuer des bilans de santé réguliers pour surveiller la glycémie.""",
      "Cardio Vascular Risk":
          """Le risque cardiovasculaire désigne la probabilité de développer une maladie cardiaque ou de subir un accident vasculaire cérébral (AVC), en fonction de divers facteurs liés au mode de vie et à la santé. Il est souvent évalué à l'aide d'un score de risque cardiovasculaire, qui prend en compte plusieurs éléments contribuant aux maladies cardiovasculaires (MCV), notamment la maladie coronarienne, la crise cardiaque et l'AVC.
Les principaux facteurs évalués pour calculer le risque cardiovasculaire incluent :
Âge : Le risque augmente avec l'âge, en particulier après 45 ans pour les hommes et 55 ans pour les femmes.
Sexe : Les hommes présentent un risque plus élevé à un plus jeune âge, mais le risque des femmes augmente après la ménopause.
Pression artérielle : L’hypertension est l'un des principaux facteurs de risque des maladies cardiovasculaires.
Taux de cholestérol : Des niveaux élevés de cholestérol total, LDL (mauvais cholestérol) ou de faibles niveaux de HDL (bon cholestérol) augmentent le risque.
Tabagisme : Fumer endommage les vaisseaux sanguins et favorise l’accumulation de plaques dans les artères.
Diabète : Avoir un diabète ou un prédiabète augmente le risque de maladies cardiaques.
Antécédents familiaux : Un historique familial de maladies cardiaques ou d’AVC peut accroître le risque.
Alimentation : Un régime riche en graisses saturées, trans, en sodium et pauvre en fibres est lié à un risque accru.
Activité physique : Le manque d'exercice favorise l'obésité, l'hypertension et un mauvais taux de cholestérol, augmentant ainsi le risque cardiovasculaire.
Obésité : Le surpoids impose une pression supplémentaire sur le cœur et élève la tension artérielle ainsi que le cholestérol.
Stress : Le stress chronique peut augmenter la pression artérielle et entraîner des comportements à risque comme le tabagisme ou une mauvaise alimentation.
Le Score de Risque de Framingham est l'un des outils les plus couramment utilisés pour évaluer le risque d’événements cardiovasculaires, en particulier les maladies cardiaques, sur une période de 10 ans. Il aide les professionnels de santé à identifier les individus à haut risque et à recommander des changements de mode de vie, des médicaments ou des examens complémentaires.

Réduire le risque cardiovasculaire implique souvent d’adopter une alimentation saine, de faire de l'exercice régulièrement, d’arrêter de fumer, de gérer le stress, et dans certains cas, de prendre des médicaments pour contrôler le cholestérol, la tension artérielle ou le diabète.""",
      "Obesity Grading - BMI":
          """La classification de l'obésité basée sur l'IMC (Indice de Masse Corporelle) est utilisée pour évaluer la gravité de l’obésité et le risque associé à certaines maladies comme les maladies cardiovasculaires, le diabète et l’hypertension. Plus l’IMC est élevé, plus le risque de complications de santé augmente. Voici les différents niveaux d’obésité :
          Insuffisance pondérale : BMI < 18,5
Risques potentiels : Carences nutritionnelles, système immunitaire affaibli, ostéoporose.

Poids normal : BMI 18,5 - 24,9
Plage saine avec un risque réduit de maladies chroniques.

Surpoids : BMI 25 - 29,9
Risque accru d'hypertension, de diabète et de maladies cardiaques.

Obésité (Classe 1, 2, 3) : BMI ≥ 30:
Classe 1 (Obésité modérée)
IMC : 30,0 à 34,9
Les personnes dans cette catégorie sont considérées comme modérément obèses. Elles présentent un risque accru de développer des problèmes de santé, mais des changements de mode de vie peuvent souvent aider à réduire ces risques.
Classe 2 (Obésité sévère)
IMC : 35,0 à 39,9
À ce stade, le risque de maladies chroniques (comme le diabète et les maladies cardiaques) augmente de manière significative. Une prise en charge médicale peut être nécessaire pour contrôler le poids et les complications associées.
Classe 3 (Obésité très sévère ou morbide)
IMC : 40,0 ou plus
Cette catégorie présente un risque élevé de maladies graves et peut nécessiter des interventions plus intensives, telles que la chirurgie bariatrique ou un suivi médical strict. Le risque de diabète, maladies cardiovasculaires, AVC et autres complications graves est considérablement accru.
En complément de l'IMC, d'autres mesures comme le tour de taille et le rapport taille-hanche sont souvent utilisées pour évaluer la répartition des graisses abdominales, un facteur de risque majeur pour les maladies cardiovasculaires.
Il est important de noter que l’IMC est une indication générale qui ne prend pas en compte des facteurs comme la masse musculaire, la densité osseuse ou la répartition des graisses. Il doit donc être utilisé en association avec d'autres évaluations médicales pour mieux déterminer les risques pour la santé.""",
      "Depression Score":
          """Le score de dépression est une mesure utilisée pour évaluer la gravité des symptômes dépressifs chez un individu. Il aide les professionnels de santé à déterminer si une personne souffre de dépression et à quel point les symptômes sont intenses. Divers outils et questionnaires sont utilisés pour établir ce score, le plus courant étant le Patient Health Questionnaire-9 (PHQ-9).
PHQ-9 : Évaluation de la dépression
Le PHQ-9 comprend 9 questions, chacune portant sur des symptômes de la dépression. L’individu évalue la fréquence de ces symptômes au cours des deux dernières semaines sur une échelle de 0 à 3 :
0 = Pas du tout
1 = Plusieurs jours
2 = Plus de la moitié des jours
3 = Presque tous les jours
Les questions portent sur des aspects tels que :
Perte d’intérêt ou de plaisir dans les activités
Se sentir triste, déprimé ou sans espoir
Troubles du sommeil (difficulté à s’endormir, sommeil excessif)
Fatigue ou manque d’énergie
Perte ou augmentation de l’appétit
Se sentir inutile ou coupable
Difficulté à se concentrer
Agitation ou ralentissement des mouvements
Pensées suicidaires ou d’automutilation
Interprétation du score
0-4 : Dépression minimale ou inexistante
5-9 : Dépression légère
10-14 : Dépression modérée
15-19 : Dépression modérément sévère
20-27 : Dépression sévère
Autres outils d’évaluation de la dépression
D’autres outils peuvent être utilisés, notamment :
Beck Depression Inventory (BDI) : Un questionnaire de 21 questions évaluant la sévérité de la dépression.
Hamilton Depression Rating Scale (HDRS) : Une échelle administrée par un professionnel de santé, souvent utilisée en recherche.
Pourquoi utiliser cette évaluation ?
Le score de dépression donne une première indication de l’état émotionnel d’une personne et permet d’identifier celles qui pourraient bénéficier d’une aide professionnelle. Un score élevé indique une dépression plus sévère, et il est souvent recommandé de consulter un spécialiste (psychologue, psychiatre) pour un suivi approprié.
Il est important de noter que le score de dépression est un outil de dépistage et ne remplace pas un diagnostic clinique. Un professionnel de santé doit réaliser une évaluation complète pour poser un diagnostic et établir un plan de traitement adapté.""",
      "Anemia Grading":
          """La classification de l’anémie est une évaluation de la gravité de l’anémie en fonction des niveaux d’hémoglobine (Hb) dans le sang. L’anémie survient lorsqu’il n’y a pas assez de globules rouges ou d’hémoglobine pour transporter suffisamment d’oxygène vers les tissus du corps, entraînant des symptômes tels que fatigue, faiblesse, vertiges et pâleur. Cette classification aide à déterminer la sévérité de l’anémie et à guider le traitement.

L’Organisation mondiale de la santé (OMS) définit les degrés d’anémie en fonction des taux d’hémoglobine selon le sexe et l’âge.

Classification de l’anémie selon les niveaux d’hémoglobine
🔹 Anémie légère

Hémoglobine :
Hommes : 10,0 – 12,9 g/dL
Femmes : 10,0 – 11,9 g/dL
Symptômes : Souvent légers ou absents, mais une fatigue ou une faiblesse légère peuvent être ressenties.
🔹 Anémie modérée

Hémoglobine :
Hommes : 7,0 – 9,9 g/dL
Femmes : 7,0 – 9,9 g/dL
Symptômes : Fatigue, vertiges et essoufflement plus marqués. Réduction de la tolérance à l’effort.
🔹 Anémie sévère

Hémoglobine :
Hommes : 4,0 – 6,9 g/dL
Femmes : 4,0 – 6,9 g/dL
Symptômes : Fatigue extrême, douleurs thoraciques, vertiges et difficultés respiratoires. Une prise en charge médicale urgente peut être nécessaire.
🔹 Anémie très sévère ou menaçant le pronostic vital

Hémoglobine : Inférieure à 4,0 g/dL
Symptômes : État d’urgence. Fatigue sévère, vertiges, confusion, évanouissement, et dans certains cas, défaillance d’organe.
Autres considérations
L’impact de l’anémie varie en fonction de l’âge, du sexe et de l’état de santé général. Les enfants et les femmes enceintes peuvent ressentir des symptômes à des niveaux plus élevés d’hémoglobine.
Les causes de l’anémie incluent des carences en fer, en vitamine B12 ou en acide folique, des maladies chroniques, des pertes sanguines ou des maladies génétiques comme la drépanocytose.
Prise en charge
Le traitement dépend de la cause et de la gravité de l’anémie :
✅ Anémie légère : Amélioration de l’alimentation et suppléments en fer.
✅ Anémie modérée à sévère : Traitements médicaux, transfusions sanguines, ou suppléments de vitamines et de fer.
✅ Bilan médical complet : Des analyses de sang et d’autres tests sont essentiels pour identifier la cause exacte et proposer le traitement le plus adapté."""
    };
    return riskinfo[key] ?? "";
  } else if (loc == const Locale("de")) {
    var riskinfo = {
      "Stress Level": """
Das Stressniveau bezieht sich auf die Intensität der psychischen, emotionalen oder körperlichen Belastung, die durch äußere oder innere Faktoren verursacht wird. Es kann von mild bis schwer variieren und ist von Person zu Person unterschiedlich. Stress kann durch Arbeitsdruck, persönliche Herausforderungen oder gesundheitliche Probleme entstehen und führt oft zu Reaktionen wie Angst, Reizbarkeit oder Müdigkeit.
Stress wird üblicherweise in folgende Kategorien eingeteilt:
Akuter Stress: Kurzfristiger Stress, der durch ein bestimmtes Ereignis oder eine Situation verursacht wird, wie eine enge Frist oder eine Meinungsverschiedenheit.
Chronischer Stress: Langfristiger Stress, der über einen längeren Zeitraum aufgrund anhaltender Probleme wie finanzielle Schwierigkeiten oder ungelöste Beziehungen anhält.
Ein hohes Stressniveau kann negative Auswirkungen auf die psychische und physische Gesundheit haben, wie Schlafstörungen, Kopfschmerzen und ein erhöhtes Risiko für Herzkrankheiten. Ein kontrolliertes Stressniveau kann jedoch manchmal die Motivation und Leistung steigern.
Um ein gesundes Stressniveau aufrechtzuerhalten, werden oft Entspannungstechniken, körperliche Bewegung und gesunde Bewältigungsstrategien empfohlen.
""",
      "Diabetes Risk Score":
          """Der Diabetes-Risiko-Score ist ein Werkzeug zur Einschätzung des individuellen Risikos, an Diabetes – insbesondere Typ-2-Diabetes – zu erkranken. Dabei werden verschiedene Faktoren wie Lebensstil, Alter, familiäre Vorgeschichte und Gesundheitszustand berücksichtigt. Der Score hilft, Personen zu identifizieren, die von präventiven Maßnahmen profitieren könnten, um ihr Risiko zu senken.
Das Bewertungssystem berücksichtigt typischerweise folgende Faktoren:
Alter: Ein höheres Alter erhöht das Risiko, Diabetes zu entwickeln.
Body-Mass-Index (BMI): Ein hoher BMI, der auf Übergewicht oder Fettleibigkeit hinweist, ist ein bedeutender Risikofaktor.
Familiäre Vorgeschichte: Wenn enge Familienmitglieder an Diabetes erkrankt sind, steigt das Risiko.
Körperliche Aktivität: Ein sitzender Lebensstil erhöht das Risiko.
Ernährung: Eine Ernährung mit viel Zucker, verarbeiteten Lebensmitteln und wenig Ballaststoffen kann das Risiko erhöhen.
Blutdruck: Hoher Blutdruck wird oft mit einem erhöhten Diabetes-Risiko in Verbindung gebracht.
Ethnische Herkunft: Bestimmte ethnische Gruppen, wie Afroamerikaner, Hispanoamerikaner und Asiaten, haben ein höheres Risiko.
Schwangerschaftsdiabetes: Frauen, die Schwangerschaftsdiabetes hatten, haben ein höheres Risiko, später an Typ-2-Diabetes zu erkranken.
Der Score ergibt normalerweise eine Zahl, anhand derer Personen als geringes, mittleres oder hohes Risiko eingestuft werden. Bei einem hohen Score wird empfohlen, präventive Maßnahmen wie eine gesündere Ernährung, mehr Bewegung oder regelmäßige Gesundheitschecks zur Blutzuckerkontrolle zu ergreifen.""",
      "Cardio Vascular Risk":
          """Das kardiovaskuläre Risiko beschreibt die Wahrscheinlichkeit, eine Herzerkrankung zu entwickeln oder einen Schlaganfall zu erleiden. Dieses Risiko wird anhand verschiedener Lebensstil- und Gesundheitsfaktoren bewertet. Häufig erfolgt die Einschätzung mit einem kardiovaskulären Risikoscore, der Faktoren berücksichtigt, die zur Entstehung von Herz-Kreislauf-Erkrankungen (CVD) wie koronare Herzkrankheit, Herzinfarkt oder Schlaganfall beitragen.
Zu den wichtigsten Faktoren, die bei der Berechnung des kardiovaskulären Risikos berücksichtigt werden, gehören:
Alter: Das Risiko steigt mit zunehmendem Alter, insbesondere ab 45 Jahren bei Männern und 55 Jahren bei Frauen.
Geschlecht: Männer haben in jüngeren Jahren ein höheres Risiko, aber nach der Menopause steigt das Risiko für Frauen.
Blutdruck: Bluthochdruck (Hypertonie) ist einer der Hauptfaktoren für Herz-Kreislauf-Erkrankungen.
Cholesterinwerte: Erhöhte Werte von Gesamtcholesterin, LDL (schlechtes Cholesterin) oder niedrige HDL-Werte (gutes Cholesterin) erhöhen das Risiko.
Rauchen: Rauchen schädigt die Blutgefäße und begünstigt die Plaquebildung in den Arterien.
Diabetes: Menschen mit Diabetes oder Prädiabetes haben ein erhöhtes Risiko für Herzerkrankungen.
Familiäre Vorbelastung: Eine familiäre Vorgeschichte von Herzerkrankungen oder Schlaganfällen kann das Risiko erhöhen.
Ernährung: Eine Ernährung mit hohem Gehalt an gesättigten Fetten, Transfetten und Natrium sowie wenig Ballaststoffen erhöht das Risiko.
Körperliche Aktivität: Mangelnde Bewegung trägt zu Übergewicht, Bluthochdruck und schlechten Cholesterinwerten bei, was das kardiovaskuläre Risiko erhöht.
Fettleibigkeit: Übergewicht und Adipositas belasten das Herz zusätzlich und erhöhen Blutdruck und Cholesterinwerte.
Stress: Chronischer Stress kann den Blutdruck erhöhen und ungesunde Verhaltensweisen wie Rauchen oder übermäßiges Essen begünstigen.
Der Framingham-Risiko-Score ist ein häufig verwendetes Tool zur Berechnung des kardiovaskulären Risikos über die nächsten 10 Jahre. Er hilft Ärzten, Personen mit erhöhtem Risiko zu identifizieren und Lebensstiländerungen, Medikamente oder weitere Untersuchungen zu empfehlen.

Zur Reduzierung des kardiovaskulären Risikos gehören in der Regel eine gesunde Ernährung, regelmäßige Bewegung, Rauchstopp, Stressmanagement und gegebenenfalls die Einnahme von Medikamenten zur Kontrolle von Cholesterin, Blutdruck oder Diabetes.""",
      "Obesity Grading - BMI":
          """Die Einstufung von Fettleibigkeit anhand des BMI (Body-Mass-Index) dient dazu, das Ausmaß der Adipositas zu bestimmen und das Risiko für damit verbundene Krankheiten wie Herzkrankheiten, Diabetes und Bluthochdruck einzuschätzen. Ein höherer BMI bedeutet ein erhöhtes Risiko für diese Gesundheitsprobleme. Hier sind die Adipositas-Klassen:
Untergewicht: BMI < 18,5
Mögliche Risiken: Nährstoffmangel, geschwächtes Immunsystem, Osteoporose.

Normalgewicht: BMI 18,5 - 24,9
Gesunder Bereich mit geringem Risiko für chronische Krankheiten.

Übergewicht: BMI 25 - 29,9
Erhöhtes Risiko für Bluthochdruck, Diabetes und Herzerkrankungen.

Adipositas (Klasse 1, 2, 3): BMI ≥ 30:          
Klasse 1 (Mäßige Adipositas)
BMI: 30,0 bis 34,9
Personen in dieser Kategorie gelten als mäßig fettleibig. Es besteht ein erhöhtes Risiko für Gesundheitsprobleme, das jedoch durch Lebensstiländerungen häufig kontrolliert werden kann.
Klasse 2 (Schwere Adipositas)
BMI: 35,0 bis 39,9
In dieser Stufe ist das Risiko für chronische Krankheiten wie Diabetes und Herzerkrankungen deutlich erhöht. Medizinische Interventionen können erforderlich sein, um das Gewicht und die damit verbundenen Risiken zu kontrollieren.
Klasse 3 (Sehr schwere oder morbide Adipositas)
BMI: 40,0 oder mehr
Diese Kategorie stellt ein hohes Risiko für lebensbedrohliche Erkrankungen dar. Betroffene benötigen möglicherweise intensivere Maßnahmen, wie eine bariatrische Operation oder ein medizinisches Gewichtsmanagement. Das Risiko für Diabetes, Herzerkrankungen, Schlaganfälle und andere schwere Krankheiten ist stark erhöht.
Neben dem BMI werden häufig auch Taillenumfang und das Taille-Hüft-Verhältnis zur Bewertung der Bauchfettverteilung verwendet, da diese ein bedeutender Risikofaktor für Herz-Kreislauf-Erkrankungen sind.
Es ist wichtig zu beachten, dass der BMI ein allgemeiner Richtwert ist und Faktoren wie Muskelmasse, Knochendichte oder Fettverteilung nicht berücksichtigt. Daher sollte er in Kombination mit weiteren medizinischen Untersuchungen verwendet werden, um ein genaueres Bild der individuellen Gesundheitsrisiken zu erhalten.""",
      "Depression Score":
          """Der Depressionsscore ist ein Instrument zur Bewertung der Schwere depressiver Symptome bei einer Person. Er hilft Gesundheitsfachkräften, festzustellen, ob jemand an Depressionen leidet und wie intensiv die Symptome sind. Einer der am häufigsten verwendeten Tests ist der Patient Health Questionnaire-9 (PHQ-9).
PHQ-9: Bewertung der Depression
Der PHQ-9 besteht aus 9 Fragen, die verschiedene depressive Symptome abdecken. Die Person bewertet, wie oft sie jedes Symptom in den letzten zwei Wochen erlebt hat, auf einer Skala von 0 bis 3:
0 = Überhaupt nicht
1 = An mehreren Tagen
2 = An mehr als der Hälfte der Tage
3 = Fast jeden Tag
Die Fragen beziehen sich auf Symptome wie:
Wenig Interesse oder Freude an Aktivitäten
Sich traurig, niedergeschlagen oder hoffnungslos fühlen
Schlafprobleme (Schwierigkeiten beim Einschlafen oder übermäßiges Schlafen)
Müdigkeit oder Energiemangel
Appetitveränderungen (vermindert oder erhöht)
Geringes Selbstwertgefühl oder Schuldgefühle
Konzentrationsprobleme
Bewegungs- oder Sprachverlangsamung bzw. Unruhe
Gedanken über den Tod oder Selbstverletzung
Interpretation der Punktzahl
0-4 : Keine oder minimale Depression
5-9 : Leichte Depression
10-14 : Mäßige Depression
15-19 : Mäßig schwere Depression
20-27 : Schwere Depression
Andere Depressionsbewertungsinstrumente
Je nach Kontext werden auch andere Skalen verwendet, z. B.:
Beck Depression Inventory (BDI) : Ein Fragebogen mit 21 Fragen zur Einschätzung der Depressionsschwere.
Hamilton Depression Rating Scale (HDRS) : Eine von Ärzten vergebene Skala, die häufig in der Forschung verwendet wird.
Warum wird dieser Test verwendet?
Der Depressionsscore gibt eine erste Einschätzung darüber, wie sich eine Person fühlt, und hilft dabei, Menschen zu identifizieren, die möglicherweise professionelle Unterstützung benötigen. Ein hoher Wert weist auf eine schwerere Depression hin, und es wird empfohlen, einen Psychologen oder Psychiater aufzusuchen.
Es ist wichtig zu beachten, dass der Depressionsscore nur ein Screening-Tool ist. Eine vollständige klinische Untersuchung durch eine Fachkraft im Gesundheitswesen ist erforderlich, um eine genaue Diagnose zu stellen und eine angemessene Behandlung zu planen.""",
      "Anemia Grading":
          """Die Einteilung der Anämie basiert auf den Hämoglobinwerten (Hb) im Blut. Eine Anämie tritt auf, wenn es nicht genügend rote Blutkörperchen oder Hämoglobin gibt, um den Körper mit ausreichend Sauerstoff zu versorgen. Dies führt zu Symptomen wie Müdigkeit, Schwäche, Schwindel und blasser Haut. Die Einteilung der Anämie hilft bei der Bestimmung der Schwere und der Behandlungsstrategie.

Die Weltgesundheitsorganisation (WHO) definiert die Schweregrade der Anämie je nach Geschlecht und Alter.

Einteilung der Anämie nach Hämoglobinwerten
🔹 Leichte Anämie

Hämoglobinwerte:
Männer: 10,0 – 12,9 g/dL
Frauen: 10,0 – 11,9 g/dL
Symptome: Oft keine oder nur leichte Beschwerden wie Müdigkeit oder geringe Schwäche.
🔹 Mäßige Anämie

Hämoglobinwerte:
Männer: 7,0 – 9,9 g/dL
Frauen: 7,0 – 9,9 g/dL
Symptome: Müdigkeit, Schwindel und Atemnot werden stärker. Belastbarkeit ist verringert.
🔹 Schwere Anämie

Hämoglobinwerte:
Männer: 4,0 – 6,9 g/dL
Frauen: 4,0 – 6,9 g/dL
Symptome: Extreme Müdigkeit, Brustschmerzen, Schwindel und Atemnot. Sofortige medizinische Behandlung erforderlich.
🔹 Sehr schwere oder lebensbedrohliche Anämie

Hämoglobinwerte: Unter 4,0 g/dL
Symptome: Notfall! Starke Müdigkeit, Schwindel, Verwirrung, Ohnmacht und in einigen Fällen Organversagen.
Weitere Überlegungen
Die Schwere der Anämie hängt vom Alter, Geschlecht und Gesundheitszustand ab. Kinder und Schwangere können Symptome bereits bei höheren Hämoglobinwerten entwickeln.
Ursachen der Anämie sind Eisen-, Vitamin B12- oder Folsäuremangel, chronische Krankheiten, Blutverlust oder genetische Erkrankungen wie Sichelzellenanämie.
Behandlung
Die Therapie richtet sich nach der Ursache und Schwere der Anämie:
✅ Leichte Anämie: Ernährungsumstellung und Eisenpräparate.
✅ Mäßige bis schwere Anämie: Medizinische Behandlung, Bluttransfusionen oder Vitamin- und Eisenpräparate.
✅ Umfassende medizinische Untersuchung: Bluttests sind wichtig, um die genaue Ursache zu finden und die beste Therapie festzulegen."""
    };
    return riskinfo[key] ?? "";
  } else if (loc == const Locale("ar")) {
    var riskinfo = {
      "Stress Level":
          "مستوى التوتر يشير إلى شدة الإجهاد النفسي أو العاطفي أو الجسدي الناتج عن عوامل خارجية أو داخلية. يمكن أن يتراوح من خفيف إلى شديد ويختلف من شخص لآخر. قد ينتج التوتر عن ضغوط العمل، التحديات الشخصية، أو المشاكل الصحية، وغالبًا ما يؤدي إلى ردود فعل مثل القلق أو التهيج أو التعب.\n\nيتم تصنيف التوتر عادةً إلى:\n\nالتوتر الحاد: توتر قصير المدى ناتج عن حدث أو موقف معين، مثل موعد نهائي ضيق أو خلاف.\nالتوتر المزمن: توتر طويل الأمد يستمر بسبب مشكلات مستمرة مثل المشكلات المالية أو العلاقات غير المحلولة.\nيمكن أن تؤدي مستويات التوتر العالية إلى آثار سلبية على الصحة العقلية والجسدية، مثل اضطرابات النوم والصداع وزيادة خطر الإصابة بأمراض مثل أمراض القلب. ومع ذلك، يمكن أن يكون التوتر القابل للتحكم مفيدًا في بعض الأحيان لتعزيز التحفيز والأداء.\n\nللحفاظ على مستويات توتر صحية، يُنصح بممارسة تقنيات الاسترخاء، والتمارين الرياضية، وتبني استراتيجيات التكيف الصحية.",
      "Diabetes Risk Score":
          "درجة خطر السكري هي أداة تُستخدم لتقدير خطر إصابة الشخص بمرض السكري، وخاصة السكري من النوع 2، بناءً على عدة عوامل مثل نمط الحياة، العمر، التاريخ العائلي، والحالة الصحية. تساعد هذه الدرجة في تحديد الأشخاص الذين قد يستفيدون من التدابير الوقائية لتقليل المخاطر.\n\nيأخذ نظام التقييم في الاعتبار العوامل التالية:\n\nالعمر: يزداد خطر الإصابة بالسكري مع التقدم في العمر.\nمؤشر كتلة الجسم (BMI): ارتفاع مؤشر كتلة الجسم، الذي يشير إلى زيادة الوزن أو السمنة، هو عامل خطر رئيسي.\nالتاريخ العائلي: وجود أحد أفراد العائلة المقربين مصابًا بالسكري يزيد من الخطر.\nالنشاط البدني: نمط الحياة غير النشط يزيد من خطر الإصابة.\nالنظام الغذائي: الأنظمة الغذائية الغنية بالسكر والأطعمة المصنعة والمنخفضة الألياف تزيد من المخاطر.\nضغط الدم: ارتفاع ضغط الدم غالبًا ما يرتبط بزيادة خطر الإصابة بالسكري.\nالعرق: بعض المجموعات العرقية، مثل الأفارقة الأمريكيين واللاتينيين والآسيويين، لديهم مخاطر أعلى.\nسكري الحمل: النساء اللواتي عانين من سكري الحمل أكثر عرضة للإصابة بالسكري من النوع 2 لاحقًا.\nتُحدد النتيجة برقم يُستخدم لتصنيف الأفراد على أنهم منخفضو أو متوسطو أو عالي الخطورة. إذا حصل الشخص على درجة عالية، فقد يُنصح باتخاذ تدابير وقائية مثل تحسين النظام الغذائي، وزيادة النشاط البدني، وإجراء فحوصات دورية لمراقبة مستويات السكر في الدم.",
      "Cardio Vascular Risk":
          "يشير خطر الإصابة بأمراض القلب والأوعية الدموية إلى احتمالية تطور أمراض القلب أو حدوث سكتة دماغية، بناءً على عوامل صحية ونمط الحياة. يتم تقييمه غالبًا باستخدام درجة خطر القلب والأوعية الدموية، التي تأخذ في الاعتبار مجموعة من العوامل التي تساهم في تطور أمراض القلب، مثل مرض الشريان التاجي والنوبات القلبية والسكتات الدماغية.\n\nتشمل العوامل الرئيسية في حساب خطر القلب والأوعية الدموية:\n\nالعمر: يزداد الخطر مع التقدم في العمر، خاصة بعد سن 45 للرجال و55 للنساء.\nالجنس: الرجال لديهم خطر أعلى في سن مبكرة، لكن خطر النساء يزداد بعد انقطاع الطمث.\nضغط الدم: ارتفاع ضغط الدم هو أحد العوامل الرئيسية المؤدية إلى أمراض القلب.\nمستويات الكوليسترول: ارتفاع مستويات الكوليسترول الكلي أو LDL (الكوليسترول الضار) أو انخفاض HDL (الكوليسترول الجيد) يزيد من الخطر.\nالتدخين: يضر التدخين بالأوعية الدموية ويزيد من احتمال تراكم الترسبات في الشرايين.\nالسكري: يزيد مرض السكري أو مقدمات السكري من خطر الإصابة بأمراض القلب.\nالتاريخ العائلي: يزيد وجود تاريخ عائلي لأمراض القلب أو السكتات الدماغية من الخطر.\nالنظام الغذائي: الأنظمة الغذائية الغنية بالدهون المشبعة، والدهون المتحولة، والصوديوم، وقليلة الألياف تزيد من المخاطر.\nالنشاط البدني: قلة ممارسة الرياضة تسهم في السمنة وارتفاع ضغط الدم ومستويات الكوليسترول غير الصحية، مما يزيد من خطر القلب.\nالسمنة: زيادة الوزن أو السمنة تزيد العبء على القلب وترفع ضغط الدم ومستويات الكوليسترول.\nالتوتر: التوتر المزمن يمكن أن يرفع ضغط الدم ويؤدي إلى سلوكيات غير صحية مثل التدخين أو الإفراط في تناول الطعام.\nيُستخدم مقياس فرامنغهام لحساب خطر حدوث أمراض القلب خلال العشر سنوات القادمة. يساعد هذا التقييم مقدمي الرعاية الصحية في تحديد الأشخاص المعرضين للخطر وتقديم توصيات تتعلق بتغيير نمط الحياة أو الأدوية أو الفحوصات الإضافية للحفاظ على صحة القلب والأوعية الدموية.",
      "Obesity Grading - BMI":
          """يُستخدم تصنيف السمنة بناءً على مؤشر كتلة الجسم (BMI) لتحديد مدى شدة السمنة وتقييم المخاطر الصحية المرتبطة بها، مثل أمراض القلب والسكري وارتفاع ضغط الدم. كلما زاد مؤشر كتلة الجسم، زادت المخاطر الصحية المحتملة. إليك تصنيف السمنة:18.5
المخاطر المحتملة: نقص التغذية، ضعف جهاز المناعة، هشاشة العظام.

الوزن الطبيعي: مؤشر كتلة الجسم 18.5 - 24.9
نطاق صحي مع انخفاض خطر الأمراض المزمنة.

زيادة الوزن: مؤشر كتلة الجسم 25 - 29.9
زيادة خطر ارتفاع ضغط الدم، السكري، وأمراض القلب.

السمنة :(الفئة 1، 2، 3): مؤشر كتلة الجسم ≥ 30  \n\nالفئة 1 (سمنة معتدلة):\n\nBMI: من 30.0 إلى 34.9\nيعتبر الأفراد في هذه الفئة معرضين لخطر متزايد من المشكلات الصحية، ولكن يمكن التحكم في عوامل الخطر من خلال تغييرات في نمط الحياة.\n\nالفئة 2 (سمنة شديدة):\n\nBMI: من 35.0 إلى 39.9\nيزيد هذا المستوى من السمنة من خطر الإصابة بالأمراض المزمنة بشكل كبير، وقد يحتاج الأفراد إلى تدخل طبي لإدارة الوزن والمخاطر المرتبطة مثل السكري وأمراض القلب.\n\nالفئة 3 (سمنة مفرطة أو مرضية):\n\nBMI: 40.0 أو أكثر\nتعتبر هذه الفئة عالية الخطورة للإصابة بأمراض تهدد الحياة، وقد يحتاج الأفراد إلى تدخلات مكثفة مثل جراحة السمنة أو إدارة طبية متخصصة. يزيد هذا المستوى من السمنة من خطر الإصابة بالسكري وأمراض القلب والسكتة الدماغية وغيرها من الحالات الخطيرة.\n\nإلى جانب مؤشر كتلة الجسم، يتم استخدام محيط الخصر ونسبة الخصر إلى الورك لتقييم السمنة، خاصة الدهون المتراكمة في منطقة البطن التي تشكل خطرًا كبيرًا على صحة القلب والأوعية الدموية.\n\nمن المهم ملاحظة أن مؤشر كتلة الجسم هو إرشاد عام ولا يأخذ في الاعتبار العوامل الأخرى مثل الكتلة العضلية أو كثافة العظام أو توزيع الدهون، لذا يُفضل استخدامه مع تقييمات صحية أخرى لتحديد المخاطر الصحية الشاملة.""",
      "Depression Score":
          "درجة الاكتئاب هي مقياس يُستخدم لتقييم شدة أعراض الاكتئاب لدى الأفراد. يساعد هذا التقييم مقدمي الرعاية الصحية في تحديد ما إذا كان الشخص يعاني من الاكتئاب ومدى شدته. تُستخدم العديد من الأدوات والاستبيانات لهذا الغرض، وأشهرها استبيان الصحة النفسية PHQ-9.\n\nيحتوي استبيان PHQ-9 على 9 أسئلة، حيث يقوم الشخص بتقييم مدى تكرار كل عرض من الأعراض خلال الأسبوعين الماضيين بمقياس من 0 إلى 3:\n\n0 = مطلقًا\n1 = عدة أيام\n2 = أكثر من نصف الأيام\n3 = كل يوم تقريبًا\n\nتشمل الأعراض التي يتم قياسها:\n\nفقدان الاهتمام أو المتعة في الأنشطة اليومية\nالشعور بالحزن أو الاكتئاب أو اليأس\nاضطرابات النوم (الأرق أو النوم المفرط)\nالشعور بالتعب أو نقص الطاقة\nتغيرات في الشهية (نقص أو زيادة الأكل)\nالشعور بانعدام القيمة أو الذنب\nصعوبة التركيز\nالتململ أو البطء في الحركة\nالتفكير في إيذاء النفس أو الانتحار\n\nيتم تصنيف النتائج وفقًا لشدة الاكتئاب، مما يساعد الأطباء في اتخاذ قرارات بشأن العلاج مثل العلاج النفسي أو الأدوية.",
      "Anemia Grading": """
تصنيف فقر الدم يشير إلى تصنيف شدة فقر الدم بناءً على مستويات الهيموغلوبين (Hb) في الدم. يحدث فقر الدم عندما لا توجد خلايا دم حمراء أو هيموغلوبين كافٍ لحمل الأوكسجين بشكل مناسب إلى أنسجة الجسم، مما يؤدي إلى أعراض مثل التعب، الضعف، الدوار، وشحوب الجلد. يساعد التصنيف في تحديد مدى شدة فقر الدم ويوجه العلاج.

تعرف منظمة الصحة العالمية (WHO) تصنيف فقر الدم بناءً على مستويات الهيموغلوبين لجنسيات ومجموعات عمرية مختلفة.

تصنيف فقر الدم بناءً على مستويات الهيموغلوبين
فقر الدم المعتدل:

الهيموغلوبين:
الرجال: 10.0 – 12.9 جرام/ديسيلتر
النساء: 10.0 – 11.9 جرام/ديسيلتر
الأعراض: غالبًا ما تكون الأعراض خفيفة أو غائبة، ولكن قد تشمل التعب أو ضعف طفيف.
فقر الدم المتوسط:

الهيموغلوبين:
الرجال: 7.0 – 9.9 جرام/ديسيلتر
النساء: 7.0 – 9.9 جرام/ديسيلتر
الأعراض: قد يصبح التعب، الدوار، وضيق التنفس أكثر وضوحًا. قد تنخفض قدرة التحمل على الأنشطة.
فقر الدم الشديد:

الهيموغلوبين:
الرجال: 4.0 – 6.9 جرام/ديسيلتر
النساء: 4.0 – 6.9 جرام/ديسيلتر
الأعراض: تعب شديد، ألم في الصدر، دوار، وصعوبة في التنفس. الحالات الشديدة قد تتطلب عناية طبية فورية.
فقر الدم الشديد أو المهدد للحياة:

الهيموغلوبين: أقل من 4.0 جرام/ديسيلتر
الأعراض: هذه حالة طارئة. تشمل الأعراض تعب شديد، دوار، ارتباك، إغماء، وفي بعض الحالات، فشل الأعضاء.
اعتبارات إضافية
قد تختلف الشدة بناءً على عمر الفرد وجنسه وصحته العامة. على سبيل المثال، قد يعاني الأطفال والنساء الحوامل من أعراض عند مستويات هيموغلوبين أعلى مقارنةً بالبالغين الأصحاء.
يمكن أن يكون فقر الدم ناتجًا عن عوامل مختلفة مثل نقص الحديد، نقص فيتامين ب12 أو حمض الفوليك، الأمراض المزمنة، فقدان الدم، أو الحالات الوراثية مثل مرض فقر الدم المنجلي.
إدارة:
يعتمد العلاج على سبب وشدة فقر الدم:

لفقر الدم المعتدل، قد تكون التغيرات الغذائية والمكملات الحديدية كافية.
قد يتطلب فقر الدم المتوسط إلى الشديد تدخلًا طبيًا، مثل نقل الدم، المكملات الغذائية أو الحديد، أو علاج الحالات الأساسية.
التقييم الكامل، بما في ذلك اختبارات الدم وربما اختبارات إضافية، أمر بالغ الأهمية لتحديد السبب الدقيق لفقر الدم وأفضل طريقة للعلاج.
"""
    };

    return riskinfo[key] ?? "";
  } else if (loc == const Locale("it")) {
    var riskinfo = {
      "Stress Level":
          "Il livello di stress si riferisce all'intensità dello stress psicologico, emotivo o fisico causato da fattori esterni o interni. Può variare da lieve a grave e differire da persona a persona. Lo stress può derivare da pressioni lavorative, sfide personali o problemi di salute, e spesso porta a reazioni come ansia, irritabilità o affaticamento.\n\nLo stress è solitamente classificato in:\n\nStress acuto: Stress a breve termine causato da un evento o una situazione specifica, come una scadenza ravvicinata o una discussione.\nStress cronico: Stress a lungo termine che persiste a causa di problemi continuativi come difficoltà finanziarie o relazioni irrisolte.\nAlti livelli di stress possono portare a effetti negativi sulla salute mentale e fisica, come disturbi del sonno, mal di testa e un aumento del rischio di malattie come le malattie cardiache. Tuttavia, lo stress controllabile può essere utile a volte per migliorare la motivazione e le prestazioni.\n\nPer mantenere livelli di stress sani, si consiglia di praticare tecniche di rilassamento, fare esercizio fisico e adottare strategie di adattamento sane.",
      "Diabetes Risk Score":
          "Il punteggio del rischio di diabete è uno strumento utilizzato per stimare il rischio che una persona sviluppi il diabete, in particolare il diabete di tipo 2, sulla base di diversi fattori come lo stile di vita, l'età, la storia familiare e lo stato di salute. Questo punteggio aiuta a identificare le persone che potrebbero beneficiare di misure preventive per ridurre il rischio.\n\nIl sistema di valutazione considera i seguenti fattori:\n\nEtà: Il rischio di diabete aumenta con l'età.\nIndice di massa corporea (BMI): Un alto BMI, che indica sovrappeso o obesità, è un fattore di rischio principale.\nStoria familiare: La presenza di un parente stretto con diabete aumenta il rischio.\nAttività fisica: Uno stile di vita sedentario aumenta il rischio.\nDieta: Le diete ricche di zuccheri, cibi processati e povere di fibre aumentano il rischio.\nPressione sanguigna: L'ipertensione è spesso associata a un aumento del rischio di diabete.\nEtnia: Alcuni gruppi etnici, come afroamericani, latini e asiatici, hanno un rischio più elevato.\nDiabete gestazionale: Le donne che hanno avuto il diabete gestazionale sono più predisposte a sviluppare il diabete di tipo 2 in seguito.\nIl punteggio viene determinato da un numero che viene utilizzato per classificare gli individui come a basso, medio o alto rischio. Se una persona ottiene un punteggio elevato, potrebbe essere consigliato di adottare misure preventive come migliorare la dieta, aumentare l'attività fisica e fare controlli regolari per monitorare i livelli di zucchero nel sangue.",
      "Cardio Vascular Risk":
          "Il rischio cardiovascolare si riferisce alla probabilità di sviluppare malattie cardiache o ictus, basato su fattori di salute e stile di vita. Viene spesso valutato utilizzando una scala di rischio cardiovascolare, che prende in considerazione una serie di fattori che contribuiscono allo sviluppo di malattie cardiache, come malattia coronarica, infarti e ictus.\n\nI principali fattori nel calcolo del rischio cardiovascolare includono:\n\nEtà: Il rischio aumenta con l'età, soprattutto dopo i 45 anni per gli uomini e i 55 anni per le donne.\nGenere: Gli uomini hanno un rischio più elevato in giovane età, ma il rischio nelle donne aumenta dopo la menopausa.\nPressione sanguigna: L'ipertensione è uno dei principali fattori che portano a malattie cardiache.\nLivelli di colesterolo: L'alto colesterolo totale o LDL (colesterolo cattivo) o il basso HDL (colesterolo buono) aumentano il rischio.\nFumo: Il fumo danneggia i vasi sanguigni e aumenta la probabilità di accumulo di placche nelle arterie.\nDiabete: Il diabete o la prediabete aumentano il rischio di malattie cardiache.\nStoria familiare: Avere una storia familiare di malattie cardiache o ictus aumenta il rischio.\nDieta: Le diete ricche di grassi saturi, grassi trans, sodio e povere di fibre aumentano il rischio.\nAttività fisica: La mancanza di esercizio contribuisce all'obesità, all'ipertensione e ai livelli di colesterolo non salutari, aumentando il rischio cardiovascolare.\nObesità: Sovrappeso o obesità aumenta il carico sul cuore, alza la pressione sanguigna e i livelli di colesterolo.\nStress: Lo stress cronico può alzare la pressione sanguigna e portare a comportamenti malsani come il fumo o il mangiare eccessivamente.\nLa scala di Framingham viene utilizzata per calcolare il rischio di malattie cardiache nei prossimi dieci anni. Questa valutazione aiuta i professionisti sanitari a identificare le persone a rischio e a fornire raccomandazioni relative a cambiamenti nello stile di vita, farmaci o controlli aggiuntivi per mantenere la salute cardiovascolare.",
      "Obesity Grading - BMI":
          """La classificazione dell'obesità basata sull'indice di massa corporea (BMI) viene utilizzata per determinare la gravità dell'obesità e valutare i rischi per la salute ad essa associati, come le malattie cardiache, il diabete e l'ipertensione. Maggiore è il BMI, maggiore è il rischio di problemi di salute. Ecco la classificazione dell'obesità:Sottopeso: BMI < 18,5
Rischi potenziali: Carenze nutrizionali, sistema immunitario indebolito, osteoporosi.

Peso normale: BMI 18,5 - 24,9
Intervallo sano con minore rischio di malattie croniche.

Sovrappeso: BMI 25 - 29,9
Aumento del rischio di ipertensione, diabete e malattie cardiache.

Obesità (Classe 1, 2, 3): BMI ≥ 30: \n\nCategoria 1 (Obesità moderata):\n\nBMI: da 30.0 a 34.9\nLe persone in questa categoria sono a rischio maggiore di problemi di salute, ma i fattori di rischio possono essere gestiti con cambiamenti nello stile di vita.\n\nCategoria 2 (Obesità grave):\n\nBMI: da 35.0 a 39.9\nQuesto livello di obesità aumenta significativamente il rischio di malattie croniche e le persone potrebbero aver bisogno di un intervento medico per gestire il peso e i rischi associati come il diabete e le malattie cardiache.\n\nCategoria 3 (Obesità grave o patologica):\n\nBMI: 40.0 o superiore\nQuesta categoria è ad alto rischio di malattie che minacciano la vita e le persone potrebbero necessitare di interventi intensivi come la chirurgia per l'obesità o una gestione medica specializzata. Questo livello di obesità aumenta il rischio di diabete, malattie cardiache, ictus e altre condizioni gravi.\n\nOltre al BMI, vengono utilizzati la circonferenza della vita e il rapporto vita-fianchi per valutare l'obesità, specialmente il grasso accumulato nell'area addominale che rappresenta un rischio significativo per la salute cardiovascolare.\n\nÈ importante notare che il BMI è una guida generale e non tiene conto di fattori come la massa muscolare, la densità ossea o la distribuzione del grasso, quindi è preferibile usarlo insieme ad altre valutazioni della salute per determinare i rischi complessivi per la salute.""",
      "Depression Score":
          "Il punteggio della depressione è una misura utilizzata per valutare la gravità dei sintomi depressivi negli individui. Questa valutazione aiuta i professionisti sanitari a determinare se una persona soffre di depressione e la sua intensità. Vengono utilizzati vari strumenti e questionari per questo scopo, il più noto dei quali è il questionario sulla salute mentale PHQ-9.\n\nIl questionario PHQ-9 contiene 9 domande, in cui la persona valuta quanto spesso ogni sintomo si è verificato nelle ultime due settimane, utilizzando una scala da 0 a 3:\n\n0 = Mai\n1 = Alcuni giorni\n2 = Più della metà dei giorni\n3 = Ogni giorno\n\nI sintomi misurati includono:\n\nPerdita di interesse o piacere nelle attività quotidiane\nSensazione di tristezza, depressione o disperazione\nDisturbi del sonno (insonnia o sonno eccessivo)\nSensazione di stanchezza o mancanza di energia\nCambiamenti nell'appetito (diminuzione o aumento dell'assunzione di cibo)\nSensazione di inutilità o colpa\nDifficoltà di concentrazione\nAgitazione o lentezza nei movimenti\nPensieri di autolesionismo o suicidio\n\nI risultati vengono classificati in base alla gravità della depressione, aiutando i medici a prendere decisioni relative al trattamento come la psicoterapia o i farmaci.",
      "Anemia Grading": """
La classificazione dell'anemia si riferisce alla valutazione della gravità dell'anemia in base ai livelli di emoglobina (Hb) nel sangue. L'anemia si verifica quando non ci sono abbastanza globuli rossi o emoglobina per trasportare correttamente l'ossigeno ai tessuti del corpo, causando sintomi come affaticamento, debolezza, vertigini e pallore. La classificazione aiuta a determinare la gravità dell'anemia e guida il trattamento.

L'Organizzazione Mondiale della Sanità (OMS) definisce la classificazione dell'anemia in base ai livelli di emoglobina per diverse nazionalità e gruppi di età.

Classificazione dell'anemia in base ai livelli di emoglobina:
Anemia lieve:

Emoglobina:
Uomini: 10,0 – 12,9 g/dL
Donne: 10,0 – 11,9 g/dL
Sintomi: I sintomi sono spesso lievi o assenti, ma possono includere affaticamento o debolezza leggera.
Anemia moderata:

Emoglobina:
Uomini: 7,0 – 9,9 g/dL
Donne: 7,0 – 9,9 g/dL
Sintomi: L'affaticamento, le vertigini e la difficoltà a respirare possono diventare più evidenti. La capacità di tollerare l'attività fisica può diminuire.
Anemia grave:

Emoglobina:
Uomini: 4,0 – 6,9 g/dL
Donne: 4,0 – 6,9 g/dL
Sintomi: Affaticamento estremo, dolore toracico, vertigini e difficoltà a respirare. I casi gravi possono richiedere un trattamento medico immediato.
Anemia grave o pericolosa per la vita:

Emoglobina: Inferiore a 4,0 g/dL
Sintomi: Questa è una situazione di emergenza. I sintomi includono affaticamento estremo, vertigini, confusione, svenimento e, in alcuni casi, insufficienza d'organo.
Considerazioni aggiuntive:
La gravità può variare in base all'età, al sesso e alla salute generale dell'individuo. Ad esempio, i bambini e le donne in gravidanza potrebbero presentare sintomi a livelli di emoglobina più alti rispetto agli adulti sani.
L'anemia può essere causata da vari fattori, come la carenza di ferro, la carenza di vitamina B12 o acido folico, malattie croniche, perdita di sangue o condizioni genetiche come l'anemia falciforme.
Gestione:
Il trattamento dipende dalla causa e dalla gravità dell'anemia:

Per l'anemia lieve, le modifiche nella dieta e gli integratori di ferro possono essere sufficienti.
L'anemia moderata o grave può richiedere interventi medici, come trasfusioni di sangue, integratori alimentari o di ferro, o il trattamento delle condizioni di base.
Una valutazione completa, inclusi esami del sangue e forse test aggiuntivi, è fondamentale per determinare la causa esatta dell'anemia e il miglior trattamento possibile.
"""
    };

    return riskinfo[key] ?? "";
  } else if (loc == const Locale("uk")) {
    var riskinfo = {
      "Stress Level":
          """Рівень стресу визначає інтенсивність психологічного, емоційного чи фізичного напруження, спричиненого зовнішніми або внутрішніми факторами. Він може варіюватися від легкого до сильного та відрізнятися у різних людей. Стрес може виникати через робочі навантаження, особисті труднощі чи проблеми зі здоров’ям, викликаючи такі реакції, як тривожність, дратівливість або втома.

Стрес зазвичай поділяють на такі види:

Гострий стрес – короткотривалий стрес, спричинений конкретною подією або ситуацією, наприклад, жорстким дедлайном чи суперечкою.
Хронічний стрес – довготривалий стрес, який триває через постійні проблеми, такі як фінансові труднощі або невирішені стосунки.
Високий рівень стресу може негативно впливати як на психічне, так і на фізичне здоров’я, спричиняючи порушення сну, головний біль і підвищений ризик серцевих захворювань. Однак контрольований стрес іноді може підвищувати мотивацію та продуктивність.

Для підтримки здорового рівня стресу рекомендується використовувати техніки релаксації, займатися фізичною активністю та застосовувати ефективні стратегії подолання стресу.
""",
      "Diabetes Risk Score": """
Оцінка ризику діабету – це інструмент, який використовується для визначення ймовірності розвитку діабету, зокрема діабету 2-го типу, на основі різних факторів, таких як спосіб життя, вік, спадковість і стан здоров’я. Цей показник допомагає виявити людей, яким варто вжити профілактичних заходів для зниження ризику.

Система оцінювання зазвичай враховує такі фактори:

Вік: Зі збільшенням віку ризик розвитку діабету зростає.
Індекс маси тіла (ІМТ): Високий ІМТ, що свідчить про надмірну вагу або ожиріння, є важливим фактором ризику.
Спадковість: Наявність близьких родичів із діабетом підвищує ризик.
Фізична активність: Малорухливий спосіб життя збільшує ймовірність захворювання.
Харчування: Дієта з високим вмістом цукру, оброблених продуктів і низьким вмістом клітковини сприяє підвищенню ризику.
Кров’яний тиск: Високий артеріальний тиск часто пов’язаний із підвищеним ризиком діабету.
Етнічна приналежність: Деякі етнічні групи, такі як афроамериканці, латиноамериканці та азіати, мають вищий ризик розвитку діабету.
Гестаційний діабет: Жінки, які мали гестаційний діабет під час вагітності, мають підвищений ризик розвитку діабету 2-го типу в майбутньому.
Оцінка ризику зазвичай виражається числом, яке допомагає класифікувати людей у групи низького, середнього або високого ризику. Якщо у людини високий ризик, їй можуть рекомендувати профілактичні заходи, такі як покращення харчування, збільшення фізичної активності або регулярні медичні огляди для контролю рівня цукру в крові.
""",
      "Cardio Vascular Risk":
          """
Серцево-судинний ризик визначає ймовірність розвитку серцевих захворювань або виникнення інсульту на основі різних факторів способу життя та стану здоров’я. Він часто оцінюється за допомогою індексу серцево-судинного ризику, який враховує фактори, що сприяють розвитку серцево-судинних захворювань (ССЗ), зокрема ішемічної хвороби серця, інфаркту та інсульту.

Основні фактори, які враховуються при розрахунку серцево-судинного ризику:

Вік: Ризик зростає з віком, особливо після 45 років у чоловіків та 55 років у жінок.
Стать: Чоловіки мають вищий ризик у молодому віці, але після менопаузи ризик у жінок значно зростає.
Кров’яний тиск: Високий артеріальний тиск (гіпертонія) є одним із провідних факторів ризику ССЗ.
Рівень холестерину: Високий рівень загального холестерину, підвищений LDL ("поганий" холестерин) або низький HDL ("хороший" холестерин) збільшують ризик.
Куріння: Пошкоджує судини та сприяє накопиченню бляшок в артеріях.
Діабет: Наявність діабету або переддіабету значно підвищує ризик серцевих захворювань.
Спадковість: Якщо у родичів були серцеві захворювання або інсульт, ризик підвищується.
Харчування: Дієта з високим вмістом насичених жирів, трансжирів, солі та низьким вмістом клітковини збільшує ризик.
Фізична активність: Недостатня рухливість сприяє ожирінню, підвищенню артеріального тиску та порушенню рівня холестерину.
Ожиріння: Надмірна вага збільшує навантаження на серце, підвищує тиск і рівень холестерину.
Стрес: Хронічний стрес може підвищувати тиск і провокувати нездорові звички, такі як куріння чи переїдання.
Одним із найпоширеніших методів оцінки ризику є Framingham Risk Score, який прогнозує ймовірність серцево-судинних подій, особливо серцевого нападу, протягом наступних 10 років. Він допомагає лікарям визначити людей із високим ризиком і рекомендувати зміни в способі життя, медикаментозне лікування або додаткові обстеження для підтримки здоров’я серця.

Зниження серцево-судинного ризику зазвичай включає здоровий спосіб життя, зокрема правильне харчування, регулярну фізичну активність, відмову від куріння, контроль рівня стресу та, за необхідності, прийом ліків для регулювання холестерину, тиску або діабету.
""",
      "Obesity Grading - BMI":
          """
Градація ожиріння на основі Індексу маси тіла (ІМТ) використовується для визначення ступеня ожиріння та оцінки ризику розвитку супутніх захворювань, таких як серцево-судинні хвороби, діабет і гіпертонія. Чим вищий ІМТ, тим більший ризик цих проблем.

Категорії ІМТ та відповідні ризики:
Недостатня вага (ІМТ < 18,5)
Можливі ризики: дефіцит поживних речовин, ослаблена імунна система, остеопороз.

Норма (ІМТ 18,5 – 24,9)
Здоровий діапазон із низьким ризиком хронічних захворювань.

Надмірна вага (ІМТ 25 – 29,9)
Підвищений ризик: гіпертонії, діабету, серцево-судинних хвороб.

Ожиріння (ІМТ ≥ 30):
Поділяється на три класи за рівнем ризику:

Клас 1 (Помірне ожиріння) – ІМТ 30,0 – 34,9
Люди з цим рівнем ожиріння мають підвищений ризик для здоров’я, але за допомогою змін у способі життя можна зменшити негативні наслідки.

Клас 2 (Важке ожиріння) – ІМТ 35,0 – 39,9
Значно підвищений ризик хронічних захворювань, таких як діабет і серцеві хвороби. Часто потрібна медична допомога для контролю ваги.

Клас 3 (Дуже важке або морбідне ожиріння) – ІМТ ≥ 40,0
Високий ризик небезпечних для життя захворювань. Часто необхідні інтенсивні методи лікування, такі як баріатрична хірургія або спеціалізовані медичні програми з контролю ваги.

Додаткові показники для оцінки ожиріння:
Окрім ІМТ, для оцінки розподілу жирової тканини використовуються:

Окружність талії – допомагає оцінити абдомінальне (черевне) ожиріння.
Співвідношення талія-стегна – важливий показник ризику серцево-судинних захворювань.
Обмеження ІМТ:
ІМТ є загальним орієнтиром і не враховує фактори, такі як м’язова маса, щільність кісток і розподіл жиру. Тому його рекомендується використовувати разом з іншими методами оцінки здоров’я.
""",
      "Depression Score":
      """Оцінка депресії – це метод, який використовується для визначення вираженості симптомів депресії у людини. Він допомагає медичним працівникам оцінити, чи може особа страждати на депресію і наскільки сильні її симптоми. Для оцінки депресії застосовуються різні опитувальники та шкали, з яких найпоширенішою є Шкала PHQ-9 (Patient Health Questionnaire-9).

Шкала PHQ-9 для оцінки депресії
PHQ-9 складається з 9 питань, кожне з яких стосується основних симптомів депресії. Людина оцінює, як часто вона відчувала кожен симптом протягом останніх двох тижнів за такою шкалою:

0 = Зовсім не турбувало
1 = Декілька днів
2 = Більше половини днів
3 = Майже кожен день
Основні симптоми, що оцінюються:

Втрата інтересу або задоволення від діяльності
Почуття пригніченості, смутку або безнадії
Проблеми зі сном (безсоння або надмірний сон)
Відчуття втоми або нестачі енергії
Погіршення апетиту або переїдання
Відчуття власної нікчемності, провини чи невдачі
Проблеми з концентрацією уваги
Сповільненість рухів або, навпаки, підвищена збудженість
Думки про смерть або самопошкодження
Інтерпретація оцінки PHQ-9
0-4: Мінімальна або відсутня депресія
5-9: Легка депресія
10-14: Помірна депресія
15-19: Помірно виражена депресія
20-27: Важка депресія
Інші методи оцінки депресії
Окрім PHQ-9, використовуються й інші тести:

Шкала депресії Бека (BDI) – 21 питання для оцінки тяжкості депресії.
Гамільтонова шкала депресії (HDRS) – використовується лікарями, особливо в дослідницьких цілях.
Навіщо використовується оцінка депресії?
Депресивний бал допомагає виявити людей, які можуть потребувати професійної допомоги. Вищий бал зазвичай свідчить про важчу депресію, і таким людям рекомендується звернутися до психолога, психотерапевта або лікаря.

Важливо: Результати тесту PHQ-9 не є офіційним діагнозом. Для точної діагностики та визначення плану лікування необхідна консультація з медичним спеціалістом.
""",
         "Anemia Grading": """
Градація анемії – це класифікація тяжкості анемії на основі рівня гемоглобіну (Hb) у крові. Анемія виникає, коли кількість еритроцитів або гемоглобіну недостатня для забезпечення тканин організму киснем. Це може призводити до таких симптомів, як втома, слабкість, запаморочення та блідість шкіри.

Всесвітня організація охорони здоров’я (ВООЗ) визначає рівні анемії залежно від концентрації гемоглобіну у різних вікових і статевих групах.

Класифікація анемії за рівнем гемоглобіну
Легка анемія
Гемоглобін:
Чоловіки: 10,0 – 12,9 г/дл
Жінки: 10,0 – 11,9 г/дл
Симптоми:
Зазвичай відсутні або незначні, можливі легка втома та слабкість.
Помірна анемія
Гемоглобін:
Чоловіки: 7,0 – 9,9 г/дл
Жінки: 7,0 – 9,9 г/дл
Симптоми:
Виражена втома, запаморочення, задишка, зниження витривалості при фізичних навантаженнях.
Важка анемія
Гемоглобін:
Чоловіки: 4,0 – 6,9 г/дл
Жінки: 4,0 – 6,9 г/дл
Симптоми:
Сильна втома, біль у грудях, запаморочення, утруднене дихання. У важких випадках потрібна термінова медична допомога.
Дуже важка або загрозлива для життя анемія
Гемоглобін: менше 4,0 г/дл
Симптоми:
Критичний стан, сильна слабкість, сплутаність свідомості, непритомність, ризик відмови органів. Потребує негайної госпіталізації.
Додаткові фактори
Вираженість симптомів залежить від віку, статі та загального стану здоров’я людини. Наприклад, у дітей та вагітних жінок симптоми можуть проявлятися при вищих рівнях гемоглобіну.
Причини анемії можуть включати дефіцит заліза, вітаміну B12 або фолієвої кислоти, хронічні захворювання, крововтрату або спадкові патології (наприклад, серповидноклітинна анемія).
Лікування анемії
Легка анемія: корекція харчування, прийом заліза або вітамінних добавок.
Помірна та важка анемія: може знадобитися медикаментозне лікування, переливання крові або терапія основного захворювання.
Дуже важка анемія: потребує термінової медичної допомоги, часто з проведенням переливання крові.
Для визначення точної причини анемії необхідне повне медичне обстеження, включно з аналізами крові та додатковими тестами.
"""
    };

    return riskinfo[key] ?? "";
  } else {
    var riskinfo = {
      "Stress Level": """
O nível de estresse refere-se à intensidade da tensão psicológica, emocional ou física causada por fatores internos ou externos. Ele pode variar de leve a grave e difere de pessoa para pessoa. O estresse pode resultar de pressões no trabalho, desafios pessoais ou preocupações com a saúde, frequentemente desencadeando reações como ansiedade, irritabilidade ou fadiga.
O estresse é comumente categorizado como:
Estresse agudo: Estresse de curto prazo causado por um evento ou situação específica, como um prazo apertado ou um desentendimento.
Estresse crônico: Estresse de longo prazo que persiste devido a problemas contínuos, como dificuldades financeiras ou relacionamentos não resolvidos.
Níveis elevados de estresse podem ter efeitos negativos na saúde mental e física, levando a distúrbios do sono, dores de cabeça e um maior risco de doenças cardíacas. No entanto, um nível controlado de estresse pode, às vezes, aumentar a motivação e o desempenho.
Para manter um nível saudável de estresse, recomenda-se frequentemente técnicas de relaxamento, exercícios físicos e estratégias saudáveis de enfrentamento.
""",
      "Diabetes Risk Score":
          """O Escore de Risco de Diabetes é uma ferramenta usada para estimar o risco de uma pessoa desenvolver diabetes, especialmente o diabetes tipo 2, com base em vários fatores, como estilo de vida, idade, histórico familiar e estado de saúde. Esse escore ajuda a identificar pessoas que podem se beneficiar de medidas preventivas para reduzir seu risco.
O sistema de pontuação geralmente considera os seguintes fatores:
Idade: O risco de desenvolver diabetes aumenta com o avanço da idade.
Índice de Massa Corporal (IMC): Um IMC elevado, indicando sobrepeso ou obesidade, é um fator de risco significativo.
Histórico familiar: Ter um parente próximo com diabetes aumenta o risco.
Atividade física: Um estilo de vida sedentário aumenta o risco.
Alimentação: Uma dieta rica em açúcar e alimentos processados, e pobre em fibras, pode contribuir para um risco maior.
Pressão arterial: A hipertensão arterial está frequentemente associada a um risco aumentado de diabetes.
Etnia: Alguns grupos étnicos, como afro-americanos, hispânicos e asiáticos, apresentam maior risco.
Diabetes gestacional: Mulheres que tiveram diabetes gestacional têm maior risco de desenvolver diabetes tipo 2 no futuro.
O escore geralmente resulta em um número que classifica os indivíduos como baixo, moderado ou alto risco. Caso o escore seja alto, recomenda-se adotar medidas preventivas, como melhorar a alimentação, aumentar a atividade física e realizar exames de saúde regulares para monitorar os níveis de açúcar no sangue.""",
      "Cardio Vascular Risk":
          """O risco cardiovascular refere-se à probabilidade de desenvolver uma doença cardíaca ou sofrer um acidente vascular cerebral (AVC), com base em vários fatores de saúde e estilo de vida. Esse risco é frequentemente avaliado por meio de um Escore de Risco Cardiovascular, que leva em consideração diversos fatores que contribuem para o desenvolvimento de doenças cardiovasculares (DCV), como doença arterial coronariana, infarto do miocárdio e AVC.
Os principais fatores avaliados no cálculo do risco cardiovascular incluem:
Idade: O risco aumenta com a idade, especialmente após 45 anos para homens e 55 anos para mulheres.
Gênero: Os homens tendem a ter um risco mais alto em idades mais jovens, mas o risco das mulheres aumenta após a menopausa.
Pressão arterial: A hipertensão é um dos principais fatores de risco para doenças cardiovasculares.
Níveis de colesterol: Níveis elevados de colesterol total, LDL (mau colesterol) ou baixos níveis de HDL (bom colesterol) aumentam o risco.
Tabagismo: Fumar danifica os vasos sanguíneos e aumenta a formação de placas nas artérias.
Diabetes: Ter diabetes ou pré-diabetes aumenta significativamente o risco de doenças cardíacas.
Histórico familiar: Antecedentes familiares de doenças cardíacas ou AVC podem aumentar o risco.
Alimentação: Dietas ricas em gorduras saturadas, trans, sódio e pobres em fibras estão associadas a um maior risco.
Atividade física: A falta de exercício contribui para obesidade, hipertensão e colesterol ruim, aumentando o risco cardiovascular.
Obesidade: Estar acima do peso sobrecarrega o coração, elevando a pressão arterial e os níveis de colesterol.
Estresse: O estresse crônico pode aumentar a pressão arterial e levar a hábitos prejudiciais, como tabagismo ou alimentação desregulada.
O Escore de Risco de Framingham é uma ferramenta amplamente utilizada para avaliar o risco de eventos cardiovasculares, especialmente doenças cardíacas, nos próximos 10 anos. Ele auxilia os profissionais de saúde a identificar indivíduos de alto risco e recomendar mudanças no estilo de vida, medicamentos ou exames adicionais.

Para reduzir o risco cardiovascular, recomenda-se adotar uma alimentação saudável, praticar exercícios regularmente, parar de fumar, controlar o estresse e, se necessário, tomar medicamentos para controlar o colesterol, a pressão arterial ou o diabetes.""",
      "Obesity Grading - BMI":
          """A classificação da obesidade com base no IMC (Índice de Massa Corporal) é utilizada para determinar a gravidade da obesidade e avaliar o risco de doenças associadas, como doenças cardíacas, diabetes e hipertensão. Quanto maior o IMC, maior o risco de complicações. A obesidade é classificada da seguinte forma:
          Baixo peso: IMC < 18,5
Riscos potenciais: Deficiências nutricionais, sistema imunológico enfraquecido, osteoporose.

Peso normal: IMC 18,5 - 24,9
Faixa saudável com menor risco de doenças crônicas.

Sobrepeso: IMC 25 - 29,9
Aumento do risco de hipertensão, diabetes e doenças cardíacas.

Obesidade (Classe 1, 2, 3): IMC ≥ 30:
Classe 1 (Obesidade moderada)
IMC: 30,0 a 34,9
Pessoas nesta categoria são consideradas moderadamente obesas. Existe um risco aumentado de desenvolver problemas de saúde, mas com mudanças no estilo de vida, esses riscos podem ser controlados.
Classe 2 (Obesidade severa)
IMC: 35,0 a 39,9
Nesta fase, o risco de doenças crônicas, como diabetes e doenças cardíacas, aumenta significativamente. Pode ser necessário um acompanhamento médico para controle do peso e das condições associadas.
Classe 3 (Obesidade muito severa ou mórbida)
IMC: 40,0 ou superior
Essa categoria representa um alto risco de condições de saúde graves, exigindo intervenções mais intensivas, como cirurgia bariátrica ou gerenciamento médico do peso. O risco de diabetes, doenças cardíacas, AVC e outras complicações graves é extremamente elevado.
Além do IMC, outras medições, como circunferência da cintura e a relação cintura-quadril, também são frequentemente utilizadas para avaliar a distribuição da gordura abdominal, que pode ser um fator de risco significativo para doenças cardiovasculares.

É importante destacar que o IMC é apenas um indicador geral, que não leva em consideração fatores como massa muscular, densidade óssea ou distribuição de gordura. Por isso, ele deve ser utilizado em conjunto com outras avaliações médicas para obter um diagnóstico mais preciso sobre os riscos à saúde.""",
      "Depression Score":
          """O escore de depressão é uma medida utilizada para avaliar a gravidade dos sintomas depressivos em um indivíduo. Ele ajuda os profissionais de saúde a identificar se uma pessoa pode estar com depressão e qual a intensidade dos sintomas. O questionário mais utilizado para essa avaliação é o Patient Health Questionnaire-9 (PHQ-9).
PHQ-9: Avaliação da Depressão
O PHQ-9 contém 9 perguntas, cada uma relacionada a sintomas de depressão. O indivíduo avalia com que frequência experimentou cada sintoma nas últimas duas semanas, em uma escala de 0 a 3:
0 = Nenhuma vez
1 = Alguns dias
2 = Mais da metade dos dias
3 = Quase todos os dias
As perguntas avaliam sintomas como:
Pouco interesse ou prazer nas atividades
Sentir-se triste, deprimido ou sem esperança
Dificuldade para dormir ou sono excessivo
Cansaço ou falta de energia
Alteração no apetite (comer demais ou pouco)
Sentir-se inútil ou culpado
Dificuldade de concentração
Movimentos ou fala mais lentos ou agitação incomum
Pensamentos de morte ou automutilação
Interpretação do Escore
0-4 : Nenhuma ou mínima depressão
5-9 : Depressão leve
10-14 : Depressão moderada
15-19 : Depressão moderadamente grave
20-27 : Depressão grave
Outras Ferramentas para Avaliação da Depressão
Além do PHQ-9, outros instrumentos podem ser usados, como:
Beck Depression Inventory (BDI) : Questionário com 21 perguntas para medir a severidade da depressão.
Hamilton Depression Rating Scale (HDRS) : Uma escala aplicada por profissionais de saúde, frequentemente usada em pesquisas.
Por que esse teste é utilizado?
O escore de depressão fornece um primeiro indicativo do estado emocional de uma pessoa e ajuda a identificar quem pode precisar de ajuda profissional. Um escore elevado indica depressão mais grave, e nesses casos, recomenda-se procurar um psicólogo ou psiquiatra.
É importante lembrar que o escore de depressão é apenas uma ferramenta de triagem e não substitui um diagnóstico clínico. Somente um profissional de saúde pode fazer uma avaliação completa e definir o tratamento adequado.""",
      "Anemia Grading":
          """A classificação da anemia é baseada nos níveis de hemoglobina (Hb) no sangue. A anemia ocorre quando há falta de glóbulos vermelhos ou hemoglobina, reduzindo o transporte de oxigênio para os tecidos do corpo. Isso causa fadiga, fraqueza, tontura e palidez. A classificação ajuda a determinar a gravidade da anemia e a orientar o tratamento.

A Organização Mundial da Saúde (OMS) define os graus de anemia com base nos níveis de hemoglobina, gênero e idade.

Classificação da anemia por níveis de hemoglobina
🔹 Anemia leve

Hemoglobina:
Homens: 10,0 – 12,9 g/dL
Mulheres: 10,0 – 11,9 g/dL
Sintomas: Normalmente leves ou ausentes, mas pode haver fadiga ou fraqueza leve.
🔹 Anemia moderada

Hemoglobina:
Homens: 7,0 – 9,9 g/dL
Mulheres: 7,0 – 9,9 g/dL
Sintomas: Cansaço, tontura e falta de ar podem se tornar mais evidentes.
🔹 Anemia grave

Hemoglobina:
Homens: 4,0 – 6,9 g/dL
Mulheres: 4,0 – 6,9 g/dL
Sintomas: Fadiga extrema, dor no peito, tontura e dificuldade respiratória. Pode ser necessário tratamento urgente.
🔹 Anemia muito grave ou fatal

Hemoglobina: Menos de 4,0 g/dL
Sintomas: Emergência médica! Tontura, confusão, desmaios e possível falência de órgãos."""
    };
    return riskinfo[key] ?? "";
  }
}

String genrateriskinfo(key) {
  var riskinfo = {
    "Stress Level": """
Stress level refers to the intensity of psychological, emotional, or physical strain caused by external or internal factors. It can range from mild to severe and varies from person to person. Stress can result from work pressures, personal challenges, or health concerns, and it often triggers reactions like anxiety, irritability, or fatigue.

Stress is commonly categorized as:

Acute Stress: Short-term stress caused by a specific event or situation, like a tight deadline or a disagreement.
Chronic Stress: Long-term stress that persists over time due to ongoing issues like financial problems or unresolved relationships.
High stress levels can lead to negative effects on both mental and physical health, such as sleep disturbances, headaches, and increased risk for conditions like heart disease. However, manageable stress can sometimes boost motivation and performance.

To maintain healthy stress levels, relaxation techniques, exercise, and healthy coping strategies are often recommended.
""",
    "Diabetes Risk Score": """
The Diabetes Risk Score is a tool used to estimate an individual's risk of developing diabetes, particularly Type 2 diabetes, based on various factors such as lifestyle, age, family history, and health status. The score helps identify people who may benefit from preventive measures to lower their risk.

The scoring system typically considers factors such as:

Age: Older age increases the risk of developing diabetes.
Body Mass Index (BMI): Higher BMI, indicating overweight or obesity, is a significant risk factor.
Family History: Having a close family member with diabetes raises the risk.
Physical Activity: A sedentary lifestyle increases the risk.
Diet: A diet high in sugar, processed foods, and low in fiber can contribute to higher risk.
Blood Pressure: High blood pressure is often linked to an increased risk of diabetes.
Ethnicity: Some ethnic groups, such as African-American, Hispanic, and Asian, have a higher risk.
Gestational Diabetes: Women who have had gestational diabetes are at greater risk of developing Type 2 diabetes later in life.
The score typically results in a number, which is then used to classify individuals as low, moderate, or high risk. If someone has a high score, they may be advised to take preventive actions such as improving their diet, increasing physical activity, or getting regular health check-ups to monitor blood sugar levels.
""",
    "Cardio Vascular Risk": """
Cardiovascular risk refers to the likelihood of developing heart disease or having a stroke, based on various lifestyle and health factors. It’s often assessed using a Cardiovascular Risk Score, which considers a range of factors that contribute to the development of cardiovascular diseases (CVD), including coronary artery disease, heart attack, and stroke.

The key factors typically assessed in calculating cardiovascular risk include:

Age: The risk increases as you age, especially after 45 for men and 55 for women.
Gender: Men generally have a higher risk at a younger age, but the risk for women increases after menopause.
Blood Pressure: High blood pressure (hypertension) is one of the leading risk factors for CVD.
Cholesterol Levels: Elevated levels of total cholesterol, LDL (bad cholesterol), or low levels of HDL (good cholesterol) increase the risk.
Smoking: Smoking damages blood vessels and increases the likelihood of plaque buildup in arteries.
Diabetes: Having diabetes or prediabetes increases the risk of developing heart disease.
Family History: A family history of heart disease or stroke can increase the risk.
Diet: Diets high in saturated fats, trans fats, sodium, and low in fiber are linked to higher risk.
Physical Activity: A lack of regular exercise contributes to obesity, high blood pressure, and poor cholesterol levels, all of which increase cardiovascular risk.
Obesity: Being overweight or obese increases the strain on the heart and raises blood pressure and cholesterol levels.
Stress: Chronic stress can increase blood pressure and contribute to unhealthy behaviors like smoking or overeating.
The Framingham Risk Score is one commonly used tool to calculate the risk of cardiovascular events, particularly heart disease, in the next 10 years. The score helps healthcare providers identify individuals at higher risk and recommend lifestyle changes, medications, or further testing to manage their cardiovascular health.

Reducing cardiovascular risk typically involves lifestyle changes such as adopting a healthy diet, exercising regularly, quitting smoking, managing stress, and possibly taking medications to control cholesterol, blood pressure, or diabetes.
""",
    "Obesity Grading - BMI": """
Obesity grading based on BMI (Body Mass Index) is used to categorize the severity of obesity, helping to assess an individual’s risk for associated health conditions such as heart disease, diabetes, and high blood pressure. The higher the BMI, the greater the risk of these health issues. Here’s how obesity is graded:

Class 1 (Moderate Obesity):

BMI: 30.0 to 34.9
Individuals in this category are considered moderately obese. There may be an increased risk for health problems, but with lifestyle changes, risk factors can often be managed.
Class 2 (Severe Obesity):

BMI: 35.0 to 39.9
This level of obesity increases the risk of chronic diseases significantly. Individuals may need medical intervention to manage weight and associated risks, such as diabetes and heart disease.
Class 3 (Very Severe or Morbid Obesity):

BMI: 40.0 or greater
This is considered a high-risk category for life-threatening health conditions, and individuals may require more intensive interventions like bariatric surgery or medical weight management. It significantly increases the risk of diabetes, heart disease, stroke, and other serious conditions.
In addition to BMI, waist circumference and waist-to-hip ratio are also commonly used to assess obesity, especially abdominal fat, which can be a significant risk factor for cardiovascular disease.

It's important to note that BMI is a general guideline and doesn’t account for factors like muscle mass, bone density, or fat distribution. Therefore, it should be used in combination with other health assessments to determine overall health risks.
""",
    "Depression Score": """
The Depression Score is a measure used to assess the severity of depressive symptoms in an individual. It helps healthcare providers evaluate whether someone might be experiencing depression and how intense the symptoms are. Various tools and questionnaires are used to determine this score, with the Patient Health Questionnaire-9 (PHQ-9) being one of the most commonly used.

Here’s a breakdown of the PHQ-9, which is widely used for screening depression:

PHQ-9 Depression Score
The PHQ-9 consists of 9 questions, each related to the symptoms of depression. The individual rates how often they’ve experienced each symptom over the past two weeks on a scale of 0 to 3:

0 = Not at all
1 = Several days
2 = More than half the days
3 = Nearly every day
The questions focus on symptoms such as:

Little interest or pleasure in doing things
Feeling down, depressed, or hopeless
Trouble falling asleep, staying asleep, or sleeping too much
Feeling tired or having little energy
Poor appetite or overeating
Feeling bad about yourself — or that you are a failure or have let yourself or your family down
Trouble concentrating on things, such as reading the newspaper or watching television
Moving or speaking so slowly that other people could have noticed, or being so fidgety or restless that you’ve been moving around a lot more than usual
Thoughts that you would be better off dead or of hurting yourself in some way
Scoring Interpretation
0-4: Minimal or no depression
5-9: Mild depression
10-14: Moderate depression
15-19: Moderately severe depression
20-27: Severe depression
Other Depression Scoring Tools
There are several other depression assessments used depending on the context, such as:

Beck Depression Inventory (BDI): A 21-question tool for measuring the severity of depression.
Hamilton Depression Rating Scale (HDRS): A clinician-administered scale often used in research settings to assess the severity of depression.
Why It's Used
The depression score provides an initial indication of how an individual is feeling and whether they may need professional help. A higher score typically indicates more severe depression, and individuals scoring higher are often encouraged to seek counseling, therapy, or other medical treatment.

However, it's important to note that a depression score is just one tool used in diagnosing depression. A full clinical evaluation by a healthcare professional is necessary for a proper diagnosis and treatment plan.
""",
    "Anemia Grading": """
Anemia grading refers to the classification of the severity of anemia based on hemoglobin (Hb) levels in the blood. Anemia occurs when there aren’t enough red blood cells or hemoglobin to carry adequate oxygen to the body’s tissues, leading to symptoms like fatigue, weakness, dizziness, and pale skin. The grading helps determine how severe the anemia is and guides treatment.

The World Health Organization (WHO) defines anemia grading based on hemoglobin levels for different genders and age groups.

Anemia Grading by Hemoglobin Levels
Mild Anemia:

Hemoglobin:
Men: 10.0 – 12.9 g/dL
Women: 10.0 – 11.9 g/dL
Symptoms: Often mild or absent, but may include fatigue or slight weakness.
Moderate Anemia:

Hemoglobin:
Men: 7.0 – 9.9 g/dL
Women: 7.0 – 9.9 g/dL
Symptoms: Fatigue, dizziness, and shortness of breath may become more noticeable. Activity tolerance may be reduced.
Severe Anemia:

Hemoglobin:
Men: 4.0 – 6.9 g/dL
Women: 4.0 – 6.9 g/dL
Symptoms: Significant fatigue, chest pain, dizziness, and difficulty breathing. Severe cases may require immediate medical attention.
Very Severe or Life-Threatening Anemia:

Hemoglobin: Less than 4.0 g/dL
Symptoms: This is an emergency situation. Symptoms include severe fatigue, dizziness, confusion, fainting, and in some cases, organ failure.
Additional Considerations
Severity can vary based on the individual's age, gender, and overall health. For example, children and pregnant women might experience symptoms at higher hemoglobin levels compared to healthy adults.
Anemia can be caused by various factors such as iron deficiency, vitamin B12 or folic acid deficiency, chronic diseases, blood loss, or genetic conditions like sickle cell disease.
Management:
Treatment depends on the cause and severity of anemia:

For mild anemia, dietary changes and iron supplements might be sufficient.
Moderate to severe anemia may require medical intervention, such as blood transfusions, vitamin or iron supplements, or treatment of underlying conditions.
A complete evaluation, including blood tests and possibly additional tests, is crucial to determine the exact cause of anemia and the best treatment approach.
"""
  };
  return riskinfo[key] ?? "";
}

num checklabel(key) {
  var map = {
    "Diabetes Risk Score": 40.0,
    "Obesity Grading - BMI": 40.0,
    "Stress Level": 384
  };
  return map[key] ?? 100.0;
}
