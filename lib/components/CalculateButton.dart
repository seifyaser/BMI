import 'package:bmi/BmiClassification.dart';
import 'package:bmi/models/bmiRecord_model.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class Calculatebutton extends StatelessWidget {
  final double height;
  final int weight;
  final Box<BMIRecordModel> box;

  const Calculatebutton({super.key, required this.height, required this.weight, required this.box});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        double bmi = weight / ((height / 100) * (height / 100));

        // تخزين معلومات الـ BMI في Hive
        box.add(BMIRecordModel(bmi: bmi, date: DateTime.now()));

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          builder: (context) => Container(
            padding: EdgeInsets.all(20),
            height: 320,
            decoration: BoxDecoration(
              color: Colors.blue,
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
                  "A BMI of ${bmi.toStringAsFixed(1)} indicates that you are at a ${BmiClassification(bmi)} weight for your height. "
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
    );
  }
}

