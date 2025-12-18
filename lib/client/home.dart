import 'package:flutter/material.dart';
import 'package:talentconnect/client/feedback.dart';
import 'package:talentconnect/client/history.dart';
import 'package:talentconnect/client/view%20freelancers.dart';

class HomeClient extends StatefulWidget {
  const HomeClient({super.key});

  @override
  State<HomeClient> createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png', height: 50, width: 50),
            SizedBox(height: 8),
            Text(
              'Talent Connect',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'Unlock Your Future',
              style: TextStyle(
                color: const Color.fromARGB(255, 22, 121, 202),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Welcome Client',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Find the best freelancers for your projects.',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 30, top: 20),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 10,
                      color: Colors.black54,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Find Talent',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Nearby_Freelancers(),
                          ),
                        );
                      },
                      child: Text('View Freelancers'),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Your Activity',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 30, top: 20),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 10,
                      color: Colors.black54,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Booking_History(),
                            ),
                          );
                        },
                        icon: Icon(Icons.history, color: Colors.blue),
                        label: Text('Booking History'),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            155,
                            186,
                            186,
                            187,
                          ),
                          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedbackPage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.star_outline, color: Colors.blue),
                      label: Text('Feedback'),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          155,
                          186,
                          186,
                          187,
                        ),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Top Freelancers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                itemBuilder: (context, index) {
                  return Container(
                    width: 120, // REQUIRED
                    margin: const EdgeInsets.only(right: 12),
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            backgroundImage: NetworkImage(
                              'https://imgs.search.brave.com/Og97rlCtAbIWey3gMJkumYk-NCJ130-my1qr4pgRrYc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jb250/ZW50Lm1hZ251bXBo/b3Rvcy5jb20vd3At/Y29udGVudC91cGxv/YWRzLzIwMTYvMTEv/Y29ydGV4L3BhcjE0/NjYzMS10ZWFzZXIt/eHhsLmpwZw',
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Freelancer',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
