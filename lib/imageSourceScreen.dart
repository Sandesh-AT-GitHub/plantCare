import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './displayCureScreen.dart';
import 'dart:io';
import 'dart:async';

class imageSource extends StatefulWidget {
  @override
  _imageSourceState createState() => _imageSourceState();
}

class _imageSourceState extends State<imageSource> {
  final _picker = ImagePicker();
  File _imagePath;
  bool _loading = true;

  void setImagePath(PickedFile pickedFile) {
    setState(() {
      _imagePath = File(pickedFile.path);
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
        margin: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
            Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.collections,
                      color: Colors.white,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                onPressed: () async {
                  PickedFile galleryImage = await _picker.getImage(source: ImageSource.gallery);
                  setImagePath(galleryImage);
                },
              ),
            ),
            Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                onPressed: () async {
                  PickedFile cameraImage = await _picker.getImage(source: ImageSource.camera);
                  setImagePath(cameraImage);
                },
              ),
            ),
          ]),
          Expanded(
            child: _imagePath != null
                ? Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.white,
                              //   width: 3,
                              // ),
                              image: DecorationImage(
                                image: FileImage(_imagePath),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          child: RaisedButton(
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              // side: BorderSide(
                              //   width: 3,
                              //   color: const Color(0xFFECECEB),
                              // ),
                            ),
                            child: Text(
                              'Predict',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => displayCure(imagePath: _imagePath, loading: _loading)));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      'Plant leaf image is not selected yet !',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
