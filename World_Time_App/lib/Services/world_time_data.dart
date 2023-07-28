import'package:http/http.dart';
import'dart:convert';
import 'package:intl/intl.dart';


class WorldTimeData {

  late String location;//Location to be displayed on the UI
  late String time;//time at the given location
  late String day;//day at the given location
  late String flag;//path url of flag
  late String url;//url for the location for example:'Europe/London'
  late bool isDayTime;//WillKeep a track for if is it day time or not


  WorldTimeData({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {


    try{

      //Gets the response from the url (Basically gets the data)
      Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      //Convert the data to Map so you can use the key to get the value
      Map data = jsonDecode(response.body);//This function just convert the data to json which was in string format before


      //Getting date and time
      String dateTime = data['dateTime'];
      String dayAtLocation = data['dayOfWeek'];


      //Converting it to datetime format
      DateTime now = DateTime.parse(dateTime);

      isDayTime = now.hour >= 6 && now.hour < 19 ? true : false;

      //converting it into string
      time = DateFormat.jm().format(now);
      day = dayAtLocation;


    }catch(e){
      print('The error: $e');
      time = 'Could not fetch the time';
    }

  }//getTime

}//class