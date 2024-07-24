import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/widgets/card_stack.dart';
import 'package:tinycolor2/tinycolor2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          backgroundColor:
              Colors.grey.toTinyColor().brighten(70).shade(5).color,
          body: const Center(
            child: CardStack(),
          ),
        ),
      );
}