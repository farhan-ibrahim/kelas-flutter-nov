import 'package:flutter/material.dart';

class BMIWidget extends StatefulWidget {
  const BMIWidget({super.key});

  @override
  State<BMIWidget> createState() => _BMIWidgetState();
}

class _BMIWidgetState extends State<BMIWidget> {
  double result = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController heightController = TextEditingController(text: "0");
    TextEditingController weightController = TextEditingController(text: "0");

    onPressedCalculate() {
      final height = double.parse(heightController.text);
      final weight = double.parse(weightController.text);
      final bmi = weight / (height * height);
      print(weight);
      print(height);
      print("bmi $bmi");

      setState(() {
        result = bmi;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        backgroundColor: Colors.teal[500],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: heightController,
                decoration: const InputDecoration(
                  label: Text("Height"),
                ),
              ),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(
                  label: Text("Weight"),
                ),
              ),
              ElevatedButton(
                onPressed: onPressedCalculate,
                child: const Text("Calculate"),
              ),
              if (result > 0) ...[
                Container(
                  child: Text("Your BMI is $result"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
