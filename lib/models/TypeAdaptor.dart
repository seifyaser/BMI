import 'package:bmi/models/bmiRecord_model.dart';
import 'package:hive/hive.dart';

class BMIRecordModelAdapter extends TypeAdapter<BMIRecordModel> {
  @override
  BMIRecordModel read(BinaryReader reader) {
    // TODO: implement read
    return BMIRecordModel(

        bmi: reader.readDouble(),
         date:DateTime.fromMillisecondsSinceEpoch(reader.readInt())
         );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, BMIRecordModel obj) {

    writer.writeDouble(obj.bmi);
    writer.writeInt(obj.date.millisecondsSinceEpoch);
  }

  
}