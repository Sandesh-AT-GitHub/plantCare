import 'package:flutter/material.dart';
import './widgets/carouselWidget.dart';
import './imageSourceScreen.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        title: Text(
          'Plant Care',
          style: TextStyle(
            fontFamily: 'KirangHaerang',
          ),
          textScaleFactor: 2,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       'assets/images/backgroundImg.jpg',
        //     ),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            carouselWidget(),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20,
              ),
              height: 40,
              width: 150,
              child: RaisedButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  // side: BorderSide(
                  //   width: 3,
                  //   color: Colors.white,
                  // ),
                ),
                child: Text(
                  'Pick a Image',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => imageSource()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
