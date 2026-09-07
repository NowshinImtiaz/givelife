import 'package:flutter/material.dart';
import 'settings.dart';
import 'donation_history.dart';
import 'home.dart';
import 'donate_blood.dart';

class SearchDonors extends StatefulWidget {
  final bool isProfileSetup;
  final String userName;

  const SearchDonors({
    super.key,
    this.isProfileSetup = false,
    this.userName = '',
  });

  @override
  State<SearchDonors> createState() => _SearchDonorsState();
}

class _SearchDonorsState extends State<SearchDonors> {
  int _currentIndex = 1;
  String _selectedGroup = 'All';

  static const Color darkMaroon = Color(0xFFA10725);
  static const Color lightBg = Color(0xFFF8F3F3);

  final List<String> _bloodGroups = [
    'All',
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];

  final List<Map<String, String>> _donors = [
    {'bloodGroup': 'O+', 'match': 'Match'},
    {'bloodGroup': 'A-', 'match': 'Match'},
    {'bloodGroup': 'B+', 'match': 'Match'},
    {'bloodGroup': 'AB+', 'match': 'Match'},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredDonors = _donors.where((donor) {
      return _selectedGroup == 'All' || donor['bloodGroup'] == _selectedGroup;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: darkMaroon,
        foregroundColor: lightBg,
        elevation: 0,
        title: const Text('Find Donors', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Search by location or blood group...',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (!widget.isProfileSetup)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: darkMaroon.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: darkMaroon.withOpacity(0.3)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline, color: darkMaroon, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Set up & verify your profile to view donor details.',
                        style: TextStyle(
                          color: darkMaroon,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _bloodGroups.map((group) {
                  final isSelected = _selectedGroup == group;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGroup = group;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? darkMaroon
                              : const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          group,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${filteredDonors.length} DONORS NEARBY',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: filteredDonors.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1),
                itemBuilder: (context, index) {
                  final donor = filteredDonors[index];

                  final String displayName = widget.isProfileSetup
                      ? (widget.userName.isNotEmpty ? widget.userName : 'Verified Donor')
                      : 'Verify Profile to View Name';

                  final String displayHistory = widget.isProfileSetup
                      ? '${donor['match']} · Profile Verified'
                      : '${donor['match']} · History Locked';

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: darkMaroon.withOpacity(0.3),
                                width: 1.5),
                            color: darkMaroon.withOpacity(0.05),
                          ),
                          child: Center(
                            child: Text(
                              donor['bloodGroup']!,
                              style: const TextStyle(
                                color: darkMaroon,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                displayName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: widget.isProfileSetup
                                      ? Colors.black87
                                      : Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                displayHistory,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.circle, size: 8, color: darkMaroon),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right,
                            color: Colors.grey, size: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if(index==0){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen(),),);

          }

          else if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchDonors(),),);
          }

          else if(index==2){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DonateBloodScreen(),),);
          }

          else if(index==3){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DonationHistory(),),);
          }

          else if(index==4){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Settings(),),);
          }
        },
        selectedItemColor: darkMaroon,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop,color: Color(0xFFA10725),), label: 'Donate'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}
