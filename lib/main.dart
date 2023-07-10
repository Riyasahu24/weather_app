import 'package:flutter/material.dart';
import 'package:waether_app/activity/home.dart';
import 'package:waether_app/activity/loading.dart';
import 'package:waether_app/activity/location.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //priority of routes are more than home (home : home())
    routes: {
      "/": (context) => loading(), //deafult route
      "/home": (context) => home(),
      "/location": (context) => location(),
    },
  ));
}
