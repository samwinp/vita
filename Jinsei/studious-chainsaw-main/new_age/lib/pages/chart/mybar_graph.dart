import 'package:flutter/material.dart';
import 'bar_graph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GraphPage(),
    );
  }
}

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  List<double> months = [
    2.0,
    4.1,
    1.4,
    7.5,
    5.7,
    4.2,
    2.7,
    6.3,
    4.2,
    5.8,
    2.3,
    4.2
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 18, 10),
              child: SizedBox(
                height: 300,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Energy(Kwh)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyBarGraph(monthlyEnergyGenerated: months),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Detail Analysis",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
