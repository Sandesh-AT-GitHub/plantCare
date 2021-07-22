import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class carouselWidget extends StatefulWidget {
  @override
  _carouselWidgetState createState() => _carouselWidgetState();
}

class _carouselWidgetState extends State<carouselWidget> {
  int _current = 0;

  List carouselData = [
    'Select the source to pick an image, either from gallery or through camera',
    'Get the predicted disease and precautions on the selected plant leaf image',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      items: carouselData.map((eachData) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                // image: DecorationImage(
                //   image: AssetImage('assets/images/carouselImg.jpg'),
                //   fit: BoxFit.fill,
                // ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
                // border: Border.all(
                //   color: Colors.white,
                //   width: 3,
                // ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'STEP ${_current + 1}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      eachData,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
