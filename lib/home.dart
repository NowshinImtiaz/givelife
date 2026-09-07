import 'package:flutter/material.dart';
import 'SearchDonors.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  final String bloodType;
  final int donations;
  final int livesSaved;
  final int lastDonationDays;

  const HomeScreen({
    super.key,
    this.userName = 'Donor',
    this.bloodType = '',
    this.donations = 0,
    this.livesSaved = 0,
    this.lastDonationDays = 0,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const Color darkMaroon = Color(0xFFA10725);
  static const Color lightBg = Color(0xFFF8F3F3);

  @override
  Widget build(BuildContext context) {
    final String formattedDonations = widget.donations < 10 
        ? '0${widget.donations}' 
        : '${widget.donations}';

    final String displayBloodType = widget.bloodType.isNotEmpty ? widget.bloodType : '--';

    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        backgroundColor: darkMaroon,
        foregroundColor: lightBg,
        elevation: 0,
        title: const Text('GiveLife - Home', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: lightBg),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: lightBg),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: lightBg,
                      child: Icon(Icons.person, color: darkMaroon),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Good morning,', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Text(
                            widget.userName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkMaroon),
                          ),
                          const Text('Profile active', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: darkMaroon,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        displayBloodType,
                        style: const TextStyle(color: lightBg, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('YOU CAN DONATE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 6),
                    const Text(
                      'Today is the day',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkMaroon),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.lastDonationDays > 0
                          ? 'Last whole-blood donation was ${widget.lastDonationDays} days ago. Your body is ready to save lives!'
                          : 'Your body is ready to save lives!',
                      style: const TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: lightBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  formattedDonations,
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkMaroon),
                                ),
                                const SizedBox(height: 2),
                                const Text('DONATIONS', style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: lightBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${widget.livesSaved}',
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkMaroon),
                                ),
                                const SizedBox(height: 2),
                                const Text('LIVES SAVED', style: TextStyle(fontSize: 11, color: darkMaroon, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchDonors()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: darkMaroon,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: darkMaroon, width: 1),
                      ),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.search, size: 28, color: darkMaroon),
                        SizedBox(height: 6),
                        Text('Find Requests', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Browse local needs', style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchDonors()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkMaroon,
                      foregroundColor: lightBg,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.add_circle_outline, size: 28, color: lightBg),
                        SizedBox(height: 6),
                        Text('Request Blood', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Post urgent appeal', style: TextStyle(fontSize: 11, color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchDonors()),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        selectedItemColor: darkMaroon,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'Donate'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}
