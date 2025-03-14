import 'package:bmi/BmiClassification.dart';
import 'package:flutter/material.dart';


class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true;
  double height = 172;
  int weight = 58;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // اختيار الجنس
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMale = true),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isMale ? Colors.white : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isMale ? Colors.pink : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.male, size: 50, color: Colors.orange),
                          Text('Male', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMale = false),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isMale ? Colors.grey[300] : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: !isMale ? Colors.pink : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.female, size: 50, color: Colors.pink),
                          Text('Female', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // الطول
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text('Height (in cm)', style: TextStyle(fontSize: 18)),
                  Slider(
                    value: height,
                    min: 100,
                    max: 200,
                    onChanged: (value) => setState(() => height = value),
                  ),
                  Text(height.toInt().toString(), style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            SizedBox(height: 20),
            // الوزن والعمر
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text('Weight (in kg)', style: TextStyle(fontSize: 18)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => setState(() => weight--),
                            ),
                            Text(weight.toString(), style: TextStyle(fontSize: 24)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => setState(() => weight++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text('Age', style: TextStyle(fontSize: 18)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => setState(() => age--),
                            ),
                            Text(age.toString(), style: TextStyle(fontSize: 24)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => setState(() => age++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // زر الحساب
            ElevatedButton(
  onPressed: () {
    double bmi = weight / ((height / 100) * (height / 100));

    showModalBottomSheet(
    context: context,
    isScrollControlled: true, // يسمح بارتفاع أكبر للمودال
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => Container(
      padding: EdgeInsets.all(20),
      height: 320, // تعديل الارتفاع ليكون مناسبًا
      decoration: BoxDecoration(
        color: Colors.blue, // لون الخلفية أزرق
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your BMI is",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            "${bmi.toStringAsFixed(1)} kg/m²",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            "( ${BmiClassification(bmi)} )",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
          ),
          SizedBox(height: 15),
           Text(
            "A BMI of  ${bmi.toStringAsFixed(1)} indicates that you are at a ${BmiClassification(bmi)} weight for your height. "
            "By maintaining a healthy weight, you lower your risk of developing serious health problems.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          
        ],
      ),
    ),
  );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    textStyle: TextStyle(fontSize: 20),
  ),
  child: Text('Calculate'),
),

          ],
        ),
      ),
    );
  }
}
