import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class CamPage extends StatefulWidget {
  const CamPage({Key? key}) : super(key: key);

  @override
  State<CamPage> createState() => _CamPageState();
}
String up = "0";
class _CamPageState extends State<CamPage> {
  String led = 'Off';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 0, horizontal: 9),

                 child:
                IconButton(
                  icon: const Icon(Icons.flashlight_on_rounded),

                  onPressed: () async {
                    Firebase.initializeApp();
                    DatabaseReference myRef = FirebaseDatabase.instance.ref();
                    final snapshot = await myRef.child("car/led").get();
                    Object? newvalue = snapshot.value;
                    print(newvalue);
                    if (newvalue == "0" ){
                      newvalue = "1";
                    }else  {
                      newvalue = "0";
                    }
                    await myRef.set({
                      "car": {"led" : newvalue}

                    });




                  },
                ),
              )],
            title: const Text('Camera',textAlign: TextAlign.center),
            shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),


              ),

            )),body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
                    children: [IconButton(


                        icon: const Icon(Icons.arrow_circle_up),

      onPressed: (){}

      ),IconButton(
      icon: const Icon(Icons.arrow_circle_down),


       onPressed: (){}),Container(child:
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                          IconButton(
                           icon: const Icon(Icons.arrow_circle_left),

                           onPressed: (){}),IconButton(
                            icon: const Icon(Icons.arrow_circle_right),

                            onPressed: (){}),

                      ],
                      ),)
      // IconButton(
      //     icon: const Icon(Icons.arrow_circle_right),
      //
      //     onPressed: (){}),
  ]),
            ),

        );
  }
}
