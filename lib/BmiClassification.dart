
// دالة لحساب فئة مؤشر كتلة الجسم
String BmiClassification(double bmi) {
  if (bmi < 18.5) return "Underweight";
  if (bmi < 24.9) return "Normal";
  if (bmi < 29.9) return "Overweight";
  return "Obese";
}
