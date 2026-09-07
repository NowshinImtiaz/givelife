import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';


class Splash extends StatefulWidget{
  const  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>{

  @override
  void initState(){
    super.initState();

    Timer(
      const Duration(milliseconds: 4000),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login(),),);

    },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFA10725),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
          Icon(
                Icons.water_drop,
                size: 150,
                color: Color(0xB549010F),

              ),


            SizedBox(height: 20 ),
              Text(
                'GiveLife',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF8F3F3),
                ),
              ),
              SizedBox(height:5),

        Text(
                'Every drop counts.',
                style: TextStyle(
                  fontSize: 18,

                  color: Color(0xFFF8F3F3),
                ),
              ),

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color(0xB549010F), // Button background color
            //     foregroundColor: Colors.white,            // Text & Icon color
            //     padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 15),
            //     elevation: 4,                             // Shadow depth
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20), // Rounded corners
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login(),),);            },
            //   child: const Text(
            //     'Log in',
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //   ),
            // ),
            ],
        ),
      ),
        //backgroundColor: Color(0xFFA10725),
      );
  }

}