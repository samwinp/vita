import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class MillInfo extends StatefulWidget {
  late String millname;
  late String millinfo;
  late String imagePath;
  late dynamic page;
  MillInfo({super.key,required String millname,required String millinfo, required String imagePath, required dynamic page}){
    this.millname = millname;
    this.millinfo = millinfo;
    this.imagePath = imagePath;
    this.page = page;
  }

  @override
  State<MillInfo> createState() => _MillInfoState();
}

class _MillInfoState extends State<MillInfo> {
  @override
  Widget build(BuildContext context) {
   return Padding(
                padding: const EdgeInsets.all(8.0,),
                child: Container(
                  width: 180,
                  height: 160,
                  decoration:  BoxDecoration(
                    border: Border.all(width: 8, color: Color.fromARGB(255, 246, 248, 247), ),
                    color: Color.fromARGB(255, 250, 252, 251),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  

                  child: Column(
                    children:  [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Lottie.asset("${widget.imagePath}",
                          height: 130,
                          width: 130,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.millname,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 99, 98, 98),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                       Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.millinfo,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 118, 117, 117),
                        ),
                        ),
                      ),
                      
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(onPressed: (){
                              dynamic route = widget.page;
                              //nextScreenReplace(context,  widget.page);
                            },
                             child: const Text("Read more",
                             style: TextStyle(
                              color: Color.fromARGB(255,255, 137, 63),
                             ),
                             ),
                            ),
                          ),
                         
                          ],
                        ),
                      )

                    ],                
                    ),                    
                  ), 
                ); 

  }
}