import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}//LoadingClass

class _LoadingState extends State<Loading> {

  String time = 'loading....';

  void SetupWorldTime() async {

    WorldTimeData Data = WorldTimeData(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await Data.getTime();
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location': Data.location,
      'flag': Data.flag,
      'time': Data.time,
      'day': Data.day,
      'isDayTime': Data.isDayTime,
    });
  }//SetupWorldTime

  @override
  void initState() {

    super.initState();
    SetupWorldTime();
  }//initState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[800],
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }//widget
}//class
