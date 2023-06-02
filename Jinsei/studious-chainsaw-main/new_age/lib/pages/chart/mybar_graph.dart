import 'package:flutter/material.dart';
import 'package:graph/bargraph/bar_graph.dart';

void main() {
  runApp(const MaterialApp(home: GraphPage()));
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
      appBar: AppBar(
        title: const Text("VITA"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Detail Analysis",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
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
              ],
            ),
          ),
          Container(
  margin: const EdgeInsets.symmetric(horizontal: 10.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes the position of the shadow
      ),
    ],
  ),
  child: const Card(
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: CalculationWidget(),
    ),
  ),
)
        ],
      ),
    );
  }
}

const double area = 1.6;
const double efficiency = 0.16;
const double loss = 0.15;

enum CalculationType {
  EnergyPerPanel,
  PanelsNeeded,
  EnergyNeeded,
}

class CalculationWidget extends StatefulWidget {
  const CalculationWidget({Key? key}) : super(key: key);

  @override
  _CalculationWidgetState createState() => _CalculationWidgetState();
}

class _CalculationWidgetState extends State<CalculationWidget> {
  final TextEditingController _requiredEnergyController =
      TextEditingController();
  final TextEditingController _landAreaController = TextEditingController();

  double GHI = 5;
  double _generatedEnergy = 0.0;
  int _panelsNeeded = 0;
  double _energyNeeded = 0.0;

  CalculationType _selectedCalculation = CalculationType.EnergyPerPanel;

  void calculateGeneratedEnergy(double GHI) {
    setState(() {
      double energyPerPanel = GHI * area * efficiency * (1 - loss) * 365;
      _generatedEnergy = energyPerPanel;
    });
  }

  void calculatePanelsNeeded(double GHI, double requiredEnergy) {
    setState(() {
      double energyPerPanel = _generatedEnergy;
      _panelsNeeded = (requiredEnergy / energyPerPanel).round();
    });
  }

  void calculateEnergyNeeded(double GHI, double landArea) {
    setState(() {
      double energyPerPanel = _generatedEnergy;
      _energyNeeded = (landArea / area).round() * energyPerPanel * 0.70;
    });
  }

  @override
  void dispose() {
    _requiredEnergyController.dispose();
    _landAreaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    calculateGeneratedEnergy(GHI);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<CalculationType>(
            value: _selectedCalculation,
            onChanged: (value) {
              setState(() {
                _selectedCalculation = value!;
              });
            },
            items: CalculationType.values.map((CalculationType type) {
              String text = '';
              switch (type) {
                case CalculationType.EnergyPerPanel:
                  text = 'Energy Per Panel';
                  break;
                case CalculationType.PanelsNeeded:
                  text = 'Panels Needed';
                  break;
                case CalculationType.EnergyNeeded:
                  text = 'Energy Needed';
                  break;
              }
              return DropdownMenuItem<CalculationType>(
                value: type,
                child: Text(text),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          if (_selectedCalculation == CalculationType.EnergyPerPanel)
            Center(
              child: Column(
                children: [
                  const Text(
                    'Result:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Generated Energy per Panel: $_generatedEnergy kW per year',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

          //Panels Needed
          if (_selectedCalculation == CalculationType.PanelsNeeded)
            Column(
              children: [
                const Text('Panels required'),
                const SizedBox(height: 16),
                TextField(
                  controller: _requiredEnergyController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    double requiredEnergy = double.tryParse(value) ?? 0.0;
                    calculatePanelsNeeded(_generatedEnergy, requiredEnergy);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Required Energy',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Result:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Panels Needed: $_panelsNeeded',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

          //Land Required
          if (_selectedCalculation == CalculationType.EnergyNeeded)
            Column(
              children: [
                const Text('Enter Land Area (m²)'),
                const SizedBox(height: 16),
                TextField(
                  controller: _landAreaController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    double landArea = double.tryParse(value) ?? 0.0;
                    calculateEnergyNeeded(_generatedEnergy, landArea);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Land Area',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Result:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Energy Generated in Land Area: $_energyNeeded kW per year',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
