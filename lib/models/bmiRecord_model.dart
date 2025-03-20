import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BMIRecordModel {




  @HiveField(0)
  final double bmi;

  @HiveField(1)
  final DateTime date;

  BMIRecordModel({

    required this.bmi,
    required this.date,
  });
}
