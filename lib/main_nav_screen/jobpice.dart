import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_to_isloo/jobs.dart';

class JobsPice extends StatefulWidget {
  @override
  _JobsPiceState createState() => _JobsPiceState();
}

class _JobsPiceState extends State<JobsPice> {
  List<Marker> _markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              FontAwesomeIcons.search,
              color: Colors.amber,
            ),
          )
        ],
        leading: Icon(
          FontAwesomeIcons.alignLeft,
          color: Colors.amber,
        ),
        title: Container(
          child: Text(
            'Jobs',
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Get.to(Jobs());
          },
          child: Text('Go to Map'),
          shape: StadiumBorder(),
          color: Colors.amber,
        ),
      ),
    );
  }
}
