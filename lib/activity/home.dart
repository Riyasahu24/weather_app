import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:http/http.dart';
import 'package:waether_app/activity/location.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init activity");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("setstate activity");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose activity");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["mumbai", "delhi", "dhar", "indore", "pune"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    Map info = ModalRoute.of(context)?.settings?.arguments as Map;

    return Scaffold(
      appBar: PreferredSize(
          //for statusbar
          child: GradientAppBar(
            gradient: LinearGradient(
              colors: [Colors.lightBlue, Colors.lightBlueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          preferredSize: Size.fromHeight(0)),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // stops: [
                //   0.1,  //0-10%-blue
                //   0.3,  //30%-50%-pinkaccent
                //   0.7,  //70%-100%-green
                // ],
                colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
              // Colors.green,
            ])),
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.only(right: 7, left: 3),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city",
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(25),
                    child: Text("hello"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    padding: EdgeInsets.all(25),
                    child: Text("hello"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    padding: EdgeInsets.all(25),
                    child: Text("hello"),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    padding: EdgeInsets.all(25),
                    child: Text("hello"),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Made By Riya"),
                  Text("Data provides by openweathermap.org"),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
