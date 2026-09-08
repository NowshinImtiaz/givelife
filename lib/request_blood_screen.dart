import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'SearchDonors.dart';
import 'donate_blood.dart';
import 'donation_history.dart';
import 'settings.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({super.key});

  @override
  State<RequestBloodScreen> createState() {
    return _RequestBloodScreenState();
  }
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  final Color redColor = const Color(0xFFA10725);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController patientNameController =
      TextEditingController();

  final TextEditingController contactController =
      TextEditingController();

  String selectedUrgency = 'Critical';
  String? selectedHospital;

  int selectedUnits = 2;

  bool sendingRequest = false;

  final List<String> hospitals = [
    'City Blood Bank',
    'Red Cross Blood Center',
    'Memorial Clinic',
    'Dhaka Medical College Hospital',
    'Square Hospital',
    'Popular Medical Center',
    'United Hospital',
    'Evercare Hospital',
  ];

  @override
  void dispose() {
    patientNameController.dispose();
    contactController.dispose();
    super.dispose();
  }

  Future<void> sendBloodRequest() async {
    bool validForm = formKey.currentState!.validate();

    if (validForm == false) {
      showMessage(
        'Please fill in all required information.',
        redColor,
      );

      return;
    }

    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Blood Request'),
          content: Text(
            'Urgency: $selectedUrgency\n'
            'Units Required: $selectedUnits\n'
            'Hospital: $selectedHospital\n'
            'Patient: ${patientNameController.text}\n'
            'Contact: ${contactController.text}\n\n'
            'Do you want to send this request?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                foregroundColor: Colors.white,
              ),
              child: const Text('SEND'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    setState(() {
      sendingRequest = true;
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      sendingRequest = false;
    });

    showSuccessDialog();
  }

  void showSuccessDialog() {
    int matchingDonors = 12;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 60,
          ),
          title: const Text(
            'Request Sent Successfully',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Your blood request has been created.\n\n'
            '$matchingDonors nearby donors have been notified.',
            textAlign: TextAlign.center,
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  clearForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('DONE'),
              ),
            ),
          ],
        );
      },
    );
  }

  void clearForm() {
    setState(() {
      selectedUrgency = 'Critical';
      selectedUnits = 2;
      selectedHospital = null;
    });

    patientNameController.clear();
    contactController.clear();
  }

  void showMessage(String message, Color color) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void bottomButtonPressed(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SearchDonors()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DonateBloodScreen(),
        ),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DonationHistory(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Settings()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              showMessage(
                'This is the Request Blood page.',
                Colors.black87,
              );
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 19,
          ),
        ),
        title: const Text(
          'Request Blood',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            16,
            5,
            16,
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('URGENCY LEVEL'),

              const SizedBox(height: 9),

              urgencyButton(
                title: 'Critical',
                subtitle: 'Within 1 hour',
                value: 'Critical',
                color: redColor,
              ),

              const SizedBox(height: 8),

              urgencyButton(
                title: 'Urgent',
                subtitle: 'Within 3 hours',
                value: 'Urgent',
                color: Colors.orange,
              ),

              const SizedBox(height: 8),

              urgencyButton(
                title: 'Needed',
                subtitle: 'Within 24 hours',
                value: 'Needed',
                color: Colors.grey,
              ),

              const SizedBox(height: 20),

              sectionTitle('UNITS REQUIRED'),

              const SizedBox(height: 8),

              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: fieldDecoration(),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (selectedUnits > 1) {
                          setState(() {
                            selectedUnits--;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: redColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$selectedUnits Unit',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (selectedUnits < 10) {
                          setState(() {
                            selectedUnits++;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: redColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              sectionTitle('HOSPITAL / LOCATION'),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: selectedHospital,
                isExpanded: true,
                decoration: inputDecoration(
                  'Select hospital',
                  Icons.local_hospital_outlined,
                ),
                items: hospitals.map(
                  (String hospital) {
                    return DropdownMenuItem<String>(
                      value: hospital,
                      child: Text(
                        hospital,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedHospital = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a hospital';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              sectionTitle('PATIENT NAME'),

              const SizedBox(height: 8),

              TextFormField(
                controller: patientNameController,
                textCapitalization: TextCapitalization.words,
                decoration: inputDecoration(
                  'Patient or contact name',
                  Icons.person_outline,
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter patient name';
                  }

                  if (value.trim().length < 3) {
                    return 'Name is too short';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              sectionTitle('CONTACT NUMBER'),

              const SizedBox(height: 8),

              TextFormField(
                controller: contactController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9+]'),
                  ),
                  LengthLimitingTextInputFormatter(14),
                ],
                decoration: inputDecoration(
                  '01XXXXXXXXX',
                  Icons.phone_outlined,
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter contact number';
                  }

                  String number = value.replaceAll('+', '');

                  if (number.length < 11) {
                    return 'Enter a valid contact number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: sendingRequest
                      ? null
                      : sendBloodRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: redColor,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        redColor.withAlpha(120),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: sendingRequest
                      ? const SizedBox(
                          width: 23,
                          height: 23,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'SEND REQUEST',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: bottomButtonPressed,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: redColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop_outlined),
            label: 'DONATE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'HISTORY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'MORE',
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget urgencyButton({
    required String title,
    required String subtitle,
    required String value,
    required Color color,
  }) {
    bool selected = selectedUrgency == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedUrgency = value;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: selected
              ? color.withAlpha(25)
              : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? color.withAlpha(100)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: selected ? color : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: selected
                        ? color
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(
    String hint,
    IconData icon,
  ) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
        size: 20,
      ),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(
          color: redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(
          color: redColor,
        ),
      ),
    );
  }

  BoxDecoration fieldDecoration() {
    return BoxDecoration(
      color: const Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(7),
    );
  }
}
