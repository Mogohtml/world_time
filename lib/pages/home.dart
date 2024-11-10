import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    // Приведение типа данных
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    print(data);

    // set background
    String bgImage = data['isDayTime'] ? 'isDay.webp' : 'isNight.webp';
    Color bgColor = data['isDayTime']
        ? Colors.green[500] ?? Colors.green
        : Colors.indigo[800] ?? Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                 children: [
                      TextButton.icon(
                         onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                    Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                    'Edit Location',
                  style: TextStyle(
                      color: Colors.grey[300]
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}
