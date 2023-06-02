import 'package:flutter/material.dart';

import 'calculate.dart';

class Sucess extends StatefulWidget {
  late double energy;
 Sucess({super.key, required double energy}){
 this.energy = energy;
 }

  @override
  State<Sucess> createState() => _SucessState();
}

class _SucessState extends State<Sucess> {
double area = 0;
int result = 0;
  final _formKey = GlobalKey<FormState>();
  String _inputText = '';
  
  // ShowData(){
  //   if(_formKey.currentState!.validate()
  //   );
   
  // }
  
  // NewData(){
  //   if(_formKey.currentState.validate());
  // }

  




  String? kilowatt;
  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        Text("You're Good to Go!",
             style: TextStyle(
               fontFamily: 'poppins',
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: Color(0xff19906A),
             ),
       ),
      SizedBox(height: 20,),
     //the calculator widget

     Container(
      height: 240,
      width: 288,
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter expected energy',
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
                result = (area/widget.energy).round();
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
     ),



    //   Form(
    //     key: _formKey,
    //     child: TextFormField(          
    //       onChanged: (value) {
    //         setState(() {
    //           kilowatt = value;
    //           print('$kilowatt');
    //         });
    //       }, 
    //  validator: (value) {
    //                 return value!.length < 1 ? "enter a valid size" : null;
    //               },
    //     ),        
    //   ),
      
    //   TextButton(onPressed: (){}, child: Icon(Icons.select_all))
      




      ],
     ); 
  }
}


//Container(
    //   child: Text("You're Good to Go!",
    //         style: TextStyle(
    //           fontFamily: 'poppins',
    //           fontSize: 30,
    //           fontWeight: FontWeight.bold,
    //           color: Color(0xff19906A),
    //         ),
    //   ),

    // );

class ResultWidget extends StatelessWidget {
  final int result;

  ResultWidget({required this.result});

  @override
  Widget build(BuildContext context) {
    return result == 0 ? Container() : Text(
      'You require $result sqkm of land',
      style: TextStyle(fontSize: 20,
      color: Colors.green,
      fontWeight: FontWeight.bold),
    );
  }
}