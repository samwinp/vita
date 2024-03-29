import 'package:flutter/material.dart';
import 'package:new_age/pages/Landing_Page.dart';

import '../widgets/widgets.dart';

class ReadMore extends StatefulWidget {
  String keys = '';
  String heading='';

  ReadMore({Key? key, required this.keys, required this.heading}) : super(key: key);

  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {

  Map<String, String> myMap = {
    '1': '''While wind energy is a clean and renewable source of energy, there are some disadvantages of windmills that should be taken into consideration. Here are a few:
Weather-dependency: Wind turbines require a steady and consistent wind speed to generate electricity. If the wind speed is too low, the turbines won't be able to generate enough electricity, and if the wind speed is too high, they will need to be shut down for safety reasons..
Land use: Wind turbines require a significant amount of space to operate, and this can impact the surrounding environment. Large wind farms can disrupt wildlife habitats, damage ecosystems, and even affect property values in nearby areas.
Noise pollution: Wind turbines can be noisy, and this can be a concern for people living near wind farms. The noise can be particularly bothersome at night, and some people have reported health issues related to prolonged exposure to the sound.
Maintenance costs: Wind turbines require regular maintenance and upkeep to ensure that they continue to operate effectively. This can be expensive, particularly for large wind farms, and can impact the overall cost-effectiveness of wind energy.
It's worth noting that many of these disadvantages are site-specific and can be mitigated through careful planning and design. Nonetheless, they are important factors to consider when evaluating the benefits and drawbacks of wind energy.''',
    '2': '''The amount of energy generated by a wind turbine is directly proportional to the wind speed. The exact relationship depends on the specific characteristics of the turbine, but in general, the power output of a wind turbine varies with the cube of the wind speed.

For example, a wind turbine with a rotor diameter of 100 meters and a wind speed of 8 meters per second (about 18 miles per hour) might generate around 3.5 megawatts (MW) of electricity. If the wind speed increases to 12 meters per second (about 27 miles per hour), the same turbine could generate around 12 MW of electricity.

However, it's important to note that wind speeds can vary widely depending on the location and time of day. Wind turbines are typically designed to operate in a specific range of wind speeds, and they may shut down or reduce their output if the wind speed exceeds or falls below this range.

In addition, the actual amount of energy generated by a wind turbine can be affected by factors such as the efficiency of the turbine and the transmission and distribution losses associated with getting the electricity from the turbine to the end user.''',
    '3': '''Windmills have been used for centuries to grind grain, pump water, and generate electricity. The first windmill used for electricity generation was built in Scotland in 1887.

The largest wind turbine in the world is currently located in Rotterdam, Netherlands. It stands at 220 meters tall and has a rotor diameter of 164 meters.

The blades of a modern wind turbine can rotate at speeds of up to 300 km/h (186 mph) at the tips.

The first offshore wind farm was built in Denmark in 1991.

The world's largest wind farm is the Gansu Wind Farm in China, which has a capacity of 7,965 MW and consists of over 7,000 turbines.
''',
  };

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () => nextScreenReplace(context, LandingPage()),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.heading,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    myMap[widget.keys]!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
