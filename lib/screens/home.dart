
import 'package:bmi/components/CalculateButton.dart';
import 'package:bmi/components/height.dart';
import 'package:bmi/components/selectGender.dart';
import 'package:bmi/components/select_WeightAge.dart';
import 'package:bmi/models/bmiRecord_model.dart';
import 'package:bmi/screens/historypage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class BMIScreen extends StatefulWidget {
  final Box<BMIRecordModel> box;

  const BMIScreen({super.key, required this.box});

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
            SelectGender(),
            SizedBox(height: 20),
            // الطول
           HeightWidget(height: height, onHeightChanged: (value) => setState(() => height = value)),
            SizedBox(height: 20),
            // الوزن والعمر
            Row(
              children: [
                WeightAgeWidget(
                  label: 'Weight (in kg)',
                  value: weight,
                  onIncrement: () => setState(() => weight++),
                  onDecrement: () => setState(() => weight--),
                ),
                SizedBox(width: 10),
                 WeightAgeWidget(
                  label: 'Age',
                  value: age,
                  onIncrement: () => setState(() => age++),
                  onDecrement: () => setState(() => age--),
                ),
              ],
            ),
            SizedBox(height: 20),
            // زر الحساب
            Calculatebutton(height: height, weight: weight, box: widget.box), // تمرير الـ box هنا
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen(box: widget.box)),
                );
              },
              child: Text("View History"),
            ),
          ],
        ),
      ),
    );
  }
}
