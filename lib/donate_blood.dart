import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonateBloodScreen extends StatefulWidget {
  const DonateBloodScreen({super.key});

  @override
  State<DonateBloodScreen> createState() => _DonateBloodScreenState();
}

class _DonateBloodScreenState extends State<DonateBloodScreen> {

  int _currentIndex = 2;
  final Color redColor = const Color(0xFFA10725);
  bool available = false;

  String? selectedHospital;

  void donate() {
    String message = available
        ? 'You are ready to donate.'
        : 'Turn on availability first.';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3F3),
      appBar: AppBar(
        title: const Text('Donate Blood'),
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: const Text('Available to Donate'),
              subtitle: Text(available ? 'Available' : 'Not available'),
              value: available,
              //activeColor: redColor,
              onChanged: (value) {
                setState(() => available = value);
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Nearby Hospitals',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('City Blood Bank'),
              subtitle: Text('Dhanmondi, Dhaka'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Red Cross Blood Center'),
              subtitle: Text('Mohakhali, Dhaka'),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: donate,
            style: ElevatedButton.styleFrom(
              backgroundColor: redColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('DONATE NOW'),
          ),
        ],
      ),
    );
  }
}
