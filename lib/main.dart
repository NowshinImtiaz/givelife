import 'package:flutter/material.dart';
import 'splash.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GiveLife',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF49010F),),
        scaffoldBackgroundColor: Color(0xFFF8F3F3),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF49010F),
          foregroundColor: Color(0xFFF8F3F3),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF49010F),
          foregroundColor: Color(0xFFF8F3F3),
        ),
      ),

      home: const Splash(),
    );
  }
}




//       home: AnimatedSplashScreen(
//         splash: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.water_drop,
//               size: 150,
//               color: Color(0xB549010F),
//
//             ),
//
//             // Image.asset(
//             //   'assets/images/logo.png',
//             //   width: 280,
//             //   height:280,
//             // ),
//
//             SizedBox(height: 20 ),
//             Text(
//               'GiveLife',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFF8F3F3),
//               ),
//             ),
//             SizedBox(height:10),
//
//             Text(
//               'Keep your thoughts.',
//               style: TextStyle(
//                 fontSize: 16,
//
//                 color: Color(0xFFF8F3F3),
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Color(0xFFA10725),
//         nextScreen: MyHomePage(),
//         splashIconSize: 500,
//         splashTransition: SplashTransition.scaleTransition,
//         duration: 3000,
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: Color(0xFFF8F3F3),
//
//       appBar: AppBar(
//           title: const Text(
//             'GiveLife',
//
//             style: TextStyle(
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.bold,
//             ),
//           )
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: .center,
//           children: [
//             Icon(
//               Icons.water_drop_outlined,
//               size: 100,
//               color: const Color(0xB549010F),
//             ),
//             const SizedBox(height: 20),
//
//             const Text(
//               'Welcome to NoteMe',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF101820),
//               ),
//             ),
//             const SizedBox(height: 10),
//
//             const Text(
//               'Start Writing your day',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF101820),
//               ),),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           print('Add notes');
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
