import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time_data.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}//ChooseLocation Class

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTimeData> locations = [
    WorldTimeData(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTimeData(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTimeData(url: 'Africa/Cairo', location: 'Cairo', flag: 'cairo.png'),
    WorldTimeData(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
    WorldTimeData(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeData(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeData(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeData(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTimeData(url: 'Asia/Kolkata', location: 'India', flag: 'india.jpg'),
    WorldTimeData(url: 'Australia/Darwin', location: 'Australia', flag: 'australia.jpg'),
    WorldTimeData(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTimeData(url: 'America/Toronto', location: 'Canada', flag: 'canada.png'),
  ];//Locations List

  void UpdateTime(index) async{

    WorldTimeData data = locations[index];
    await data.getTime();
    
    Navigator.pop(context, {
      'location': data.location,
      'flag': data.flag,
      'time': data.time,
      'day': data.day,
      'isDayTime': data.isDayTime,
    });//Navigator

  }//UpdateTime

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade800,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child:Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    onTap: (){
                      UpdateTime(index);
                    },
                    title: Text(locations[index].location),
                    subtitle: Text(locations[index].url),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                )
            );
          }//itemBuilder
      ),
    );
  }//Widget
}//class
