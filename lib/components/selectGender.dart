import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
    bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Row(
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
            );
  }
}