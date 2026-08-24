import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GiveLife',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF49010F),),
        scaffoldBackgroundColor: Colors.black,

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF49010F),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF49010F),
          foregroundColor: Colors.white,
        ),
      ),




      home: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.water_drop,
              size: 150,
              color: Color(0xFF250109),

            ),

            // Image.asset(
            //   'assets/images/logo.png',
            //   width: 280,
            //   height:280,
            // ),

            SizedBox(height: 20 ),
            Text(
              'GiveLife',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height:10),

            Text(
              'Keep your thoughts.',
              style: TextStyle(
                fontSize: 16,

                color: Color(0xFFAAB4C3),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFA10725),
        nextScreen: MyHomePage(),
        splashIconSize: 500,
        splashTransition: SplashTransition.sizeTransition,
        duration: 3000,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
          title: const Text(
            'GiveLife',

            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            Icon(
              Icons.water_drop_outlined,
              size: 100,
              color: const Color(0xFF250109),
            ),
            const SizedBox(height: 20),

            const Text(
              'Welcome to NoteMe',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              'Start Writing your day',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFAAB4C3),
              ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('Add notes');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
