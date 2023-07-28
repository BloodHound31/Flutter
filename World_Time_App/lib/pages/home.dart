import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty == true ? data : ModalRoute.of(context)!.settings.arguments as Map;

    //Checking if it's day time or night time and setting the image accordingly
    String bgImage = data['isDayTime'] == true ? 'day.png':'night.png';



    return Scaffold(
      //backgroundColor: Colors.grey[200],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
                child: TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/ChooseLocation');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'flag': result['flag'],
                        'location': result['location'],
                        'day': result['day'],
                        'isDayTime': result['isDayTime'],
                      };//data
                    });},
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[200],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/${data['flag']}'),
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 1.0,
                      color: Colors.white
                    ),
                  ),
                ],//Row[children]
              ),
              SizedBox(height: 10.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                data['day'],
                style: TextStyle(
                  fontSize: 13.0,
                  letterSpacing: 1.0,
                  color: Colors.white,
                ),
              )
            ],//Column[children]
          ),
        ),
      ),
    );
  }
}
