import 'package:flutter/material.dart';

class Payement_status extends StatefulWidget {
  const Payement_status({super.key});

  @override
  State<Payement_status> createState() => _Payement_statusState();
}

class _Payement_statusState extends State<Payement_status> {
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
                "Payement Status",
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
                          title: Text('UName'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('amount'), Text('status')],
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
