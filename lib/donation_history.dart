import 'package:cloud_firestore/cloud_firestore.dart' hide Settings;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:givelife/request_blood_screen.dart';
import 'donate_blood.dart';
import 'settings.dart';
import 'SearchDonors.dart';
import 'home.dart';
//import 'donate_blood.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DonationHistory(),
    ),
  );
}

class DonationHistory extends StatelessWidget {
  const DonationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3F3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF6FD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Donation History',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body:StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(stream: _donationStream(), builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFA10725),
            ),
          );
        }

        final donations = snapshot.data?.docs ?? [];


        int donationCount = donations.length;

        int livesSaved = 0;
        int bloodGiven = 0;

        for (var donation in donations) {
          final data = donation.data();

          livesSaved += (data['livesSaved'] ?? 0) as int;
          bloodGiven += (data['units'] ?? 0) as int;
        }

        return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                           Container(
                             width: double.infinity,
                             padding: const EdgeInsets.symmetric(vertical: 25),
                             decoration: BoxDecoration(
                               color: const Color(0xFFA10725),
                               borderRadius: BorderRadius.circular(15),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [

                                 Column(
                                   children: [
                                     Text(
                                       '$donationCount',
                                       style: const TextStyle(
                                         color: Colors.white,
                                         fontSize: 32,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     const SizedBox(height: 4),
                                     const Text(
                                       'DONATIONS',
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 13,
                                       ),
                                     ),
                                   ],
                                 ),

                                 Column(
                                   children: [
                                     Text(
                                       '$livesSaved',
                                       style: const TextStyle(
                                         color: Colors.white,
                                         fontSize: 32,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     const SizedBox(height: 4),
                                     const Text(
                                       'LIVES SAVED',
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 13,
                                       ),
                                     ),
                                   ],
                                 ),

                                 Column(
                                   children: [
                                     Text(
                                       '${bloodGiven}L',
                                       style: const TextStyle(
                                         color: Colors.white,
                                         fontSize: 32,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     const SizedBox(height: 4),
                                     const Text(
                                       'BLOOD GIVEN',
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontSize: 13,
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),

                           const SizedBox(height: 25),

                           const Text(
                             'ALL DONATIONS',
                             style: TextStyle(
                               color: Colors.grey,
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                             ),
                           ),

                           const SizedBox(height: 12),
                            if (donations.isEmpty)
                              Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 50,
                                horizontal: 20,
                              ),

                              child: const Column(
                                  children: [

                                    Icon(
                                      Icons.water_drop_outlined,
                                      size: 55,
                                      color: Colors.grey,
                                    ),

                                    SizedBox(height: 15),

                                    Text(
                                      'No donations yet',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    ],
                              ),
                              ),

                    if (donations.isNotEmpty)
                    ...List.generate(
                    donations.length,
                    (index) {

        final data = donations[index].data();

        final hospital =
        data['hospital'] ?? 'Unknown';

        final type =
        data['type'] ?? 'Blood';

        final units =
        data['units'] ?? 0;

        return Padding(
        padding: const EdgeInsets.only(bottom: 12),

        child: donationItem(
        hospital,
        '$type • $units unit',
        '${index+1}',
        ),
        );
        },),


                   ],
              ),
            ),
        );


      }),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: const Color(0xFFA10725),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop,color: Color(0xFFA10725),),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],

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
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>const DonationHistory(),),);
          }

          else if(index==4){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Settings(),),);
          }
        },
      ),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _donationStream() {

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Stream.empty();
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('donations')
        .snapshots();
  }


  Widget donationItem(
    String hospital,
    String type,
    String number,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [

          Container(
            width: 45,
            height: 45,

            decoration: const BoxDecoration(
              color: Color(0xFFA10725),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.water_drop,
              color: Colors.white,
              size: 24,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  hospital,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 3),

          Text(
            number,
            style: const TextStyle(
              color: Color(0xFFA10725),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
      ],
    ),
    );
  }
}
