import 'package:flutter/material.dart';
import 'package:givelife/home.dart';
import 'signup.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}


class _LoginState extends State<Login> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:Color(0xFFF8F3F3),

      body: GestureDetector(

        onTap: (){
          //FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(height: 75),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.water_drop_outlined,size: 25,color: Color(0xFFA10725),),
                  SizedBox(width: 15),
                  Text('GiveLife',
                    style:TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF101820),
                    )
                  ),

                ],
              ),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Welcome back',
                    style:TextStyle(
                      fontSize:25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF101820),
                    )
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Sign in to continue saving lives',
                    style:TextStyle(
                      fontSize:18,
                      color: Color(0xB8101820),
                    )
                ),
              ),

              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(left:20),
                child: Text('Email',
                    style:TextStyle(
                      fontSize:12,
                      color: Color(0xB8101820),
                    )
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  //obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'abc@xyz.com',
                    labelStyle: const TextStyle(
                        color: Color(0xB8323D49)
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Password',
                    style:TextStyle(
                      fontSize:12,
                      color: Color(0xB8101820),
                    )
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Password to login',
                    labelStyle: const TextStyle(
                        color: Color(0xB8323D49)
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              SizedBox(height:30),


              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA10725), // Button background color
                    foregroundColor: Colors.white,            // Text & Icon color
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    elevation: 4,                             // Shadow depth
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home(),),);            },
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),


              Row(

                //crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                  Text('New here?',style: TextStyle(
                    fontSize: 12,
                    color: Color(0xB8101820),
                  )
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup(),),);
                    },
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        color: Color(0xFFA10725),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

}