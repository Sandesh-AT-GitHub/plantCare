import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'dart:async';
import 'dart:io';
import './data/diseaseCure.dart';

class displayCure extends StatefulWidget {
  File imagePath;
  bool loading;

  displayCure({this.imagePath, this.loading});

  @override
  _displayCureState createState() => _displayCureState(imagePath, loading);
}

class _displayCureState extends State<displayCure> {
  File _imagePath;
  bool _loading;
  List _result;

  _displayCureState(this._imagePath, this._loading);

  @override
  void initState() {
    super.initState();
    loadModel();
    classifyImage(_imagePath);
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  loadModel() async {
    await Tflite.loadModel(model: 'assets/model.tflite', labels: 'assets/labels.txt');
    classifyImage(_imagePath);
  }

  classifyImage(File imagePath) async {
    var output = await Tflite.runModelOnImage(
      path: imagePath.path,
      numResults: 16,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _result = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).primaryColor,
        title: Text(
          'Plant Care',
          style: TextStyle(
            fontFamily: 'KirangHaerang',
          ),
          textScaleFactor: 2,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Plant',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    diseaseCure[_result[0]['label']]['plant'],
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
              color: const Color(0xFFECECEB),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Disease',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    diseaseCure[_result[0]['label']]['disease'],
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
              color: const Color(0xFFECECEB),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Cure',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        diseaseCure[_result[0]['label']]['cure'],
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
