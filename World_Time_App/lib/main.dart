import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //Sets the initial route to loading
    initialRoute: '/',
    //Setting routes / pages of the app
    routes:{
      '/': (context) => Loading(),
      '/Home': (context) => Home(),
      '/ChooseLocation': (context) => ChooseLocation(),
    },//routes
  ));
}//main

