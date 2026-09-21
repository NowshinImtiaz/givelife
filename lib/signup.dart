import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final bloodController = TextEditingController();

  void createAccount() async {

    try {

      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'bloodType': bloodController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully'),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

    } on FirebaseAuthException catch (e) {

      String message = 'Something went wrong';

      if (e.code == 'email-already-in-use') {
        message = 'This email already exists';
      }
      else if (e.code == 'weak-password') {
        message = 'Password is too weak';
      }
      else if (e.code == 'invalid-email') {
        message = 'Invalid email';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    bloodController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF8F3F3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFA10725),
        foregroundColor: Colors.white,

        title: const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Become a donor',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101820),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Takes less than a minute',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xB8101820),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Full Name'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Email'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'abc@xyz.com',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Phone'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '+880 ****-******',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Password'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Create your password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Blood Group'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: bloodController,
                decoration: const InputDecoration(
                  labelText: 'A+/A-/B+/B-/O+/O-/AB+/AB-',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: createAccount,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA10725),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),

                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}