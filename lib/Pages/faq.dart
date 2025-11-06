import 'package:XLcarez/env/appexports.dart';

class Faqview extends StatelessWidget {
  const Faqview({super.key});

  @override
  Widget build(BuildContext context) {
    return MyThemeGradient(
      child: Scaffold(
        appBar: Themeappbar(
          title: "FAQ",
          leading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (_, i) {
                final data = faqslist[i];
                return Theme(
                  data: Theme.of(context).copyWith(
                      dividerColor: transparentcol,
                      splashColor: transparentcol),
                  child: ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: EdgeInsets.zero,
                    iconColor: headerClr,
                    collapsedIconColor: headerClr,
                    tilePadding: EdgeInsets.zero,
                    initiallyExpanded: i == 0,
                    title: Apptextwidget(
                      "${i + 1}. ${data["question"]}",
                      style: TxtStls.stl14,
                    ),
                    children: [
                      Apptextwidget(
                        data["answer"] as String,
                        style: TxtStls.stl12,
                      )
                    ],
                  ),
                );
              },
              itemCount: faqslist.length,
            ),
          ),
        ),
      ),
    );
  }
}

var faqslist = [
  {
    "question": "What are vital signs?",
    "answer": '''
Vital signs are key measurements that indicate your body's basic functions. They include:
• Heart Rate (Pulse) - Number of heartbeats per minute
• Blood Pressure (BP) - The force of blood against artery walls
• Respiratory Rate - Number of breaths per minute
• Body Temperature - The body's heat level
• Oxygen Saturation (SpO₂) - The amount of oxygen in the blood.
'''
  },
  {
    "question": "What is a normal heart rate?",
    "answer": '''
A normal resting heart rate for adults is 60-100 beats per minute (BPM).
Athletes may have lower resting heart rates (40-60 BPM).
'''
  },
  {
    "question": "What is a healthy blood pressure range?",
    "answer": '''
• Normal: Less than 120/80 mmHg
• Elevated: 120-129 / Less than 80 mmHg
• High Blood Pressure (Hypertension): 130/80 mmHg or higher
'''
  },
  {
    "question": "What is a normal respiratory rate?",
    "answer": '''
A normal respiratory rate for adults is 12-20 breaths per minute.
'''
  },
  {
    "question": "What is the normal body temperature?",
    "answer": '''
The average normal temperature is 98.6°F (37°C),
but it can range between 97°F-99°F (36.1°C-37.2°C).
'''
  },
  {
    "question": "What is oxygen saturation (SpO₂), and what is a normal level?",
    "answer": '''
Oxygen saturation measures how much oxygen is in your blood.
A normal SpO₂ level is 95-100%.
If it drops below 90%, it may indicate a problem with oxygen supply.
'''
  },
  {
    "question": "Why do vital signs fluctuate?",
    "answer": '''
Vital signs can change due to:
• Exercise
• Stress
• Illness
• Medications
• Hydration levels
• Sleep quality
Sudden or extreme changes may indicate a health issue.
'''
  },
  {
    "question": "How often should I check my vital signs?",
    "answer": '''
• Healthy individuals: Occasionally or during routine checkups
• People with medical conditions: Regular monitoring is recommended
• Athletes or fitness enthusiasts: May track vitals daily for performance insights
'''
  },
  {
    "question": "How can I measure my heart rate at home?",
    "answer": '''
You can check your heart rate by:
• Using a smartwatch, fitness tracker, or heart rate monitor
• Placing two fingers on your wrist or neck and counting beats for 60 seconds
'''
  },
  {
    "question": "How can I monitor blood pressure at home?",
    "answer": '''
Use a digital blood pressure monitor and:
• Sit comfortably with your arm at heart level
• Avoid caffeine, smoking, or exercise 30 minutes before measuring
• Take multiple readings at the same time daily for accuracy
'''
  },
  {
    "question": "What causes high blood pressure?",
    "answer": '''
Common causes include:
• High salt and fat intake
• Lack of physical activity
• Obesity
• Stress
• Genetics or underlying medical conditions
'''
  },
  {
    "question": "What causes low blood pressure?",
    "answer": '''
Possible reasons include:
• Dehydration
• Blood loss
• Heart conditions
• Nutrient deficiencies (low iron, B12)
'''
  },
  {
    "question": "How do I improve oxygen saturation levels?",
    "answer": '''
• Practice deep breathing exercises
• Engage in regular exercise
• Maintain good posture
• Avoid smoking and pollution
'''
  },
  {
    "question": "What should I do if my vitals are abnormal?",
    "answer": '''
• If slightly off, recheck after a few minutes in a relaxed state
• If consistently abnormal, consult a doctor
• Seek emergency help if you experience chest pain, dizziness, difficulty breathing, or fainting
'''
  },
  {
    "question": "Can stress affect vital signs?",
    "answer": '''
Yes, stress can temporarily increase heart rate and blood pressure.
Managing stress through meditation, breathing exercises, and physical activity can help maintain healthy vitals.
'''
  },
  {
    "question": "What is a balanced diet?",
    "answer": '''
A balanced diet includes a variety of foods that provide essential nutrients:
• Proteins
• Carbohydrates
• Fats
• Vitamins and minerals
These should be consumed in the right proportions to maintain good health.
'''
  },
  {
    "question": "How much water should I drink daily?",
    "answer": '''
On average, adults should drink 8-10 glasses (2-3 liters) of water per day.
This may vary based on climate, activity level, and personal needs.
'''
  },
  {
    "question": "What are the best sources of protein?",
    "answer": '''
Good protein sources include:
• Lean meats
• Fish
• Eggs
• Dairy
• Legumes (beans, lentils)
• Nuts and seeds
• Plant-based options like tofu and quinoa
'''
  },
  {
    "question": "How can I boost my immune system through food?",
    "answer": '''
• Eat a variety of nutrient-rich foods
• Focus on Vitamin C (citrus fruits, bell peppers)
• Get Vitamin D (sunlight, fortified foods)
• Include Zinc (nuts, seeds, meat, shellfish)
• Maintain gut health with probiotics (yogurt, fermented foods)
'''
  },
  {
    "question": "Is eating fat bad for my health?",
    "answer": '''
No, but choose healthy fats from:
• Avocados
• Nuts
• Seeds
• Olive oil
• Fatty fish
Avoid trans fats and limit saturated fats from processed foods.
'''
  },
  {
    "question": "What foods help with digestion?",
    "answer": '''
• Whole grains
• Fruits
• Vegetables
• Fermented foods (yogurt, kimchi, kefir)
These fiber-rich foods support digestion and gut health.
'''
  },
  {
    "question": "How many meals should I eat per day?",
    "answer": '''
General tips:
• Eat whole, nutrient-dense foods
• Reduce sugar and processed foods
• Control portion sizes
• Stay active
• Drink plenty of water
• Get enough sleep and manage stress
'''
  },
  {
    "question": "What are superfoods, and do they work?",
    "answer": '''
Superfoods like blueberries, spinach, salmon, nuts, and turmeric are rich in nutrients and antioxidants.
They are beneficial, but a balanced diet is more important than focusing on specific foods.
'''
  },
  {
    "question": "How does sugar affect my body?",
    "answer": '''
Excess sugar can lead to:
• Weight gain
• Insulin resistance
• Diabetes
• Other health issues
Opt for natural sugars from fruits and limit added sugars in sodas, sweets, and processed foods.
'''
  },
  {
    "question": "Are carbs bad for weight loss?",
    "answer": '''
Not all carbs are bad.
• Whole carbs (fruits, vegetables, whole grains) are healthy
• Refined carbs (white bread, pastries, sugary cereals) can lead to weight gain and blood sugar spikes
'''
  },
  {
    "question": "What foods should I avoid for better health?",
    "answer": '''
• Sugary drinks (soda, energy drinks)
• Processed foods (chips, fast food, instant noodles)
• Trans fats (found in fried and packaged foods)
• Excessive alcohol
'''
  },
  {
    "question": "How can I improve my gut health?",
    "answer": '''
• Eat fiber-rich foods
• Consume probiotics and prebiotics (onions, garlic, bananas)
• Avoid excess sugar, processed foods, and unnecessary antibiotics
'''
  },
  {
    "question": "What's the best diet for heart health?",
    "answer": '''
• Fruits & vegetables
• Whole grains (brown rice, quinoa)
• Healthy fats (olive oil, nuts, fish)
• Lean proteins (chicken, fish, legumes)
• Low sodium and sugar intake
'''
  },
  {
    "question": "Is intermittent fasting good for health?",
    "answer": '''
Intermittent fasting can help with:
• Weight loss
• Insulin sensitivity
• Digestion
However, it may not be suitable for everyone, especially those with certain medical conditions.
'''
  },
];
