
import 'package:flutter/material.dart';



class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  double area = 0;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter your Area',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              labelStyle: TextStyle(
                color: Colors.green,
              ),
              hintStyle: TextStyle(
                color: Colors.green,
              ),
            ),
            onChanged: (value) {
              setState(() {
                area = double.parse(value);
              });
            },
          ),
          SizedBox(height: 16,),
          ElevatedButton(
            onPressed: () {
              setState(() {
                result = area*1.23;
              });
            },
            child: Text('Calculate'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0D7066),),
            ),
          ),
          SizedBox(height: 16,),
          ResultWidget(result: result),
        ],
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  final double result;

  ResultWidget({required this.result});

  @override
  Widget build(BuildContext context) {
    return result == 0 ? Container() : Text(
      'Result: $result',
      style: TextStyle(fontSize: 20,
      color: Colors.white),
    );
  }
}