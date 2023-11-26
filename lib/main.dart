import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/model/contact.dart';
import 'package:first_app/widgets/edit.dart';
import 'package:first_app/widgets/bmi.dart';
import 'package:first_app/widgets/list.dart';
import 'package:first_app/widgets/add.dart';
import 'package:first_app/widgets/todo.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
        // secondWidget -> list
        // thirdWidget -> add new contact

        //Map<String, Widget>
        routes: {
          "/": (context) => const ListWidget(),
          "/add": (context) => const AddWidget(),
          "/edit": (context) => EditWidget(
              contact: ModalRoute.of(context)!.settings.arguments as Contact),
          "/bmi": (context) => const BMIWidget(),
          "/todo": (context) => const TodoWidget(),
        }),
  );
}
