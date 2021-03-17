import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50.0,
                backgroundImage: AssetImage('images/yousef.jpg'),
              ),
              Text(
                'Yousef Zook',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'SOFTWARE ENGINEER',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  fontFamily: 'Source Sans Pro',
                ),
              ),
              Divider(
                color: Colors.teal.shade300,
                height: 20,
                thickness: 1,
                indent: 80,
                endIndent: 80,
              ),
              Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+20 111 5866 984',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal.shade900,
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'yousefmohamed252@gmail.com',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18,
                          color: Colors.teal.shade900),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
