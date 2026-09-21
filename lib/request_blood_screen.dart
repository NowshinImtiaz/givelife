import 'package:flutter/material.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({super.key});

  @override
  State<RequestBloodScreen> createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  final Color redColor = const Color(0xFFA10725);
  final patient = TextEditingController();
  final hospital = TextEditingController();
  String bloodGroup = 'A+';
  String urgency = 'Normal';
  int units = 1;

  void sendRequest() {
    String message = patient.text.isEmpty || hospital.text.isEmpty
        ? 'Please fill all fields.'
        : 'Blood request sent successfully!';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  InputDecoration field(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3F3),
      appBar: AppBar(
        title: const Text('Request Blood'),
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: patient, decoration: field('Patient Name')),
          const SizedBox(height: 12),
          TextField(controller: hospital, decoration: field('Hospital Name')),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: bloodGroup,
            decoration: field('Blood Group'),
            items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (value) => setState(() => bloodGroup = value!),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<int>(
            value: units,
            decoration: field('Units Needed'),
            items: [1, 2, 3, 4]
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text('$item Unit'),
                    ))
                .toList(),
            onChanged: (value) => setState(() => units = value!),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: urgency,
            decoration: field('Urgency'),
            items: ['Normal', 'Urgent', 'Critical']
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (value) => setState(() => urgency = value!),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: sendRequest,
            style: ElevatedButton.styleFrom(
              backgroundColor: redColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('SEND REQUEST'),
          ),
        ],
      ),
    );
  }
}
