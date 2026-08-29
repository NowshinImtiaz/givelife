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

          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end:1.0,
            ),
            duration: Duration(milliseconds: 1800),
            curve: Curves.easeOutBack,

            builder: (context,value,child){
              return Transform.scale(
                scale: value,
                child: child,
              );
            },


          child: Icon(
                Icons.water_drop,
                size: 150,
                color: Color(0xB549010F),

              ),
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
              SizedBox(height:10),

        Text(
                'Every drop counts .',
                style: TextStyle(
                  fontSize: 20,

                  color: Color(0xFFF8F3F3),
                ),
              ),
            ],
        ),
      ),
        //backgroundColor: Color(0xFFA10725),
      );
  }
  
}