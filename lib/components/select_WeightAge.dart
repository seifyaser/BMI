import 'package:flutter/material.dart';

class SelectWeightage extends StatefulWidget {
  const SelectWeightage({super.key});

  @override
  State<SelectWeightage> createState() => _SelectWeightageState();
}

class _SelectWeightageState extends State<SelectWeightage> {
    int weight = 58;
      int age = 22;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            );
  }
}