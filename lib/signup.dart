import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  // Controllers for Email and Password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Firebase account creation
  Future<void> createAccount() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print('Account created successfully!');
      print(credential.user);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
        ),
      );

    } on FirebaseAuthException catch (e) {
      String message;

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else {
        message = 'Error: ${e.code}';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong: $e'),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF8F3F3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFA10725),
        foregroundColor: const Color(0xFFF8F3F3),
        title: Row(
          children: [
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8F3F3),
              ),
            ),
          ],
        ),
      ),

      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Become a donor',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101820),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Takes less than a minute',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xB8101820),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Full Name
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xB8101820),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    labelStyle: TextStyle(
                      color: Color(0xB8323D49),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Email
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xB8101820),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'abc@xyz.com',
                    labelStyle: TextStyle(
                      color: Color(0xB8323D49),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Phone
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xB8101820),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: '+880 ****-******',
                    labelStyle: TextStyle(
                      color: Color(0xB8323D49),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Password
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xB8101820),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Create your password',
                    labelStyle: TextStyle(
                      color: Color(0xB8323D49),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Blood Group
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Blood Group',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xB8101820),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'A+/A-/B+/B-/O+/O-/AB+/AB-',
                    labelStyle: TextStyle(
                      color: Color(0xB8323D49),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 160),

              // Create Account Button
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA10725),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: createAccount,

                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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