import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  const Height({super.key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
    double height = 172;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(height.round().toString(), style: TextStyle(fontSize: 24)),
                ],
              ),
            );
  }
}