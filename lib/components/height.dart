import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  final double height;
  final Function(double) onHeightChanged;

  const HeightWidget({
    Key? key,
    required this.height,
    required this.onHeightChanged,
  }) : super(key: key);

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
            onChanged: onHeightChanged,
          ),
          Text(height.round().toString(), style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
