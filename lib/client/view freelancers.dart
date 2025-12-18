import 'package:flutter/material.dart';

class Nearby_Freelancers extends StatefulWidget {
  const Nearby_Freelancers({super.key});

  @override
  State<Nearby_Freelancers> createState() => _Nearby_FreelancersState();
}

class _Nearby_FreelancersState extends State<Nearby_Freelancers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
              Text(
                "Nearby Freelancers ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://imgs.search.brave.com/rwhsAZqSWXCVphF5E70iKMiLYifVpAurXKN1LTpa1Z8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMud2l4c3RhdGlj/LmNvbS9tZWRpYS81/NjVlZGRfZDhlYzU3/ODk3MWE2NGQxOGI2/M2M4ZTJjY2RhNGI5/NTZ-bXYyLmpwZy92/MS9maWxsL3dfMzA4/LGhfMzA4LGZwXzAu/NTBfMC41MCxxXzkw/LGVuY19hdmlmLHF1/YWxpdHlfYXV0by81/NjVlZGRfZDhlYzU3/ODk3MWE2NGQxOGI2/M2M4ZTJjY2RhNGI5/NTZ-bXYyLndlYnA',
                            ),
                          ),
                          title: Text('Name'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email'),
                              Text('Phone'),
                              Text('Job'),
                            ],
                          ),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('BOOK'),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
