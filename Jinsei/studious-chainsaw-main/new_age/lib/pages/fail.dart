import 'package:flutter/material.dart';

class Fail extends StatefulWidget {
  const Fail({super.key});

  @override
  State<Fail> createState() => _FailState();
}

class _FailState extends State<Fail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child :Text("Wind isn't a viable option :(",
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 30,
              
              fontWeight: FontWeight.bold,
              color: Colors.red[400],
            ),
    ),);
  }
}