import 'package:bmi/models/TypeAdaptor.dart';
import 'package:bmi/models/bmiRecord_model.dart';
import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BMIRecordModelAdapter());
  var box = await Hive.openBox<BMIRecordModel>('bmi_history'); 
  runApp(MyApp(box: box)); // تمرير الـ box إلى الـ MyApp
}

class MyApp extends StatelessWidget {
  final Box<BMIRecordModel> box;

  const MyApp({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMIScreen(box: box), // تمرير الـ box إلى BMIScreen
    );
  }
}


