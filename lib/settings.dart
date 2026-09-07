import 'package:flutter/material.dart';
import 'donation_history.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool notificationsEnabled = false;
  bool availableToDonate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3F3),

      body: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 45,
              bottom: 20,
              left: 20,
            ),
            color: const Color(0xFFA10725),

            child: Row(
              children: [

                Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),

                  child: const Center(
                    child: Text(
                      'S',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'Sarah Johnson',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      'Blood Type: O+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  settingItem(
                    'Edit Profile',
                    'San Francisco, CA',
                    Icons.person_outline,
                  ),

                  toggleItem(
                    'Notifications',
                    notificationsEnabled
                        ? 'Notifications allowed'
                        : 'Notifications not allowed',
                    Icons.notifications_none,
                    notificationsEnabled,
                    (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),

                  toggleItem(
                    'Availability',
                    availableToDonate
                        ? 'Currently available to donate'
                        : 'Currently unavailable to donate',
                    Icons.favorite_border,
                    availableToDonate,
                    (value) {
                      setState(() {
                        availableToDonate = value;
                      });
                    },
                  ),

                  settingItem(
                    'Privacy Policy',
                    '',
                    Icons.lock_outline,
                  ),

                  const SizedBox(height: 10),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Signed out'),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFEEEE),
                        foregroundColor: const Color(0xFFA10725),
                        elevation: 0,
                        padding: const EdgeInsets.all(15),
                      ),

                      child: const Text(
                        'SIGN OUT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        selectedItemColor: const Color(0xFFA10725),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

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
            icon: Icon(Icons.water_drop),
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

        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DonationHistory(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget settingItem(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 3,
      ),

      color: Colors.white,

      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFFA10725),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),

        subtitle: subtitle.isNotEmpty
            ? Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              )
            : null,

        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),

        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title selected'),
            ),
          );
        },
      ),
    );
  }

  Widget toggleItem(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 3,
      ),

      color: Colors.white,

      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFFA10725),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),

        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),

        trailing: Switch(
          value: value,
          activeThumbColor: const Color(0xFFA10725),
          onChanged: onChanged,
        ),
      ),
    );
  }
}