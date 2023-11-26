import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My First App"),
      ),
      body: Container(
          child: const Center(
        child: Image(
          image: AssetImage("images/flutter_icon.png"),
        ),
      )),
    );
  }
}
