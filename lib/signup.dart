import 'package:flutter/material.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF8F3F3),

      appBar: AppBar(
        backgroundColor: Color(0xFFA10725),
          foregroundColor: Color(0xFFF8F3F3),
          title: Row(
            children: [
              //Icon(Icons.water_drop_outlined,size: 25,color: Color(0xFFA10725),),
              Text('Create Account',
                  style:TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF8F3F3),
                  )
              ),

            ],
          ),
        ),


      body: GestureDetector(

        onTap: (){
         //  FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(

           // keyboardDismissBehavior:
           // ScrollViewKeyboardDismissBehavior.onDrag,

          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

              SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Become a donor',
                      style:TextStyle(
                        fontSize:25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF101820),
                      )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Takes less than a minute',
                      style:TextStyle(
                        fontSize:18,
                        color: Color(0xB8101820),
                      )
                  ),
                ),


                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Full Name',
                      style:TextStyle(
                        fontSize:12,
                        color: Color(0xB8101820),
                      )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Enter your name',
                        labelStyle: const TextStyle(
                            color: Color(0xB8323D49)
                        ),
                        border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 18),
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


                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Phone',
                      style:TextStyle(
                        fontSize:12,
                        color: Color(0xB8101820),
                      )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                   // obscureText: true,
                    decoration: InputDecoration(
                      labelText: '+880 ****-******',
                      labelStyle: const TextStyle(
                          color: Color(0xB8323D49)
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.only(left:20),
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
                      labelText: 'Create your password',
                      labelStyle: const TextStyle(
                          color: Color(0xB8323D49)
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text('Blood Group',
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
                      labelText: 'A+/A-/B+/B-/O+/O-/AB+/AB-',
                      labelStyle: const TextStyle(
                          color: Color(0xB8323D49)
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),


                SizedBox(height: 160),

                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA10725), // Button background color
                      foregroundColor: Colors.white,            // Text & Icon color
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      elevation: 4,                             // Shadow depth
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Rounded corners
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home(),),);            },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}