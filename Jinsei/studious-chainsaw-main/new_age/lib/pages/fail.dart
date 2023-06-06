import 'package:flutter/material.dart';

class NotFeasiblePage extends StatelessWidget {
  const NotFeasiblePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solar Farm Feasibility'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255,137, 63),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning,
                size: 80,
                color: Colors.yellow,
              ),
              SizedBox(height: 16),
              Text(
                'Solar Farm Not Feasible',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'The generated solar energy is insufficient to support a solar farm on this location.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}