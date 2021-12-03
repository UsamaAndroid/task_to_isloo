import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:location/location.dart';
double? plat;
double? plang;
double? dlat;
double? dlang;

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  List<Marker> _markers = <Marker>[];final Set<Polyline>_polyline={};
  GoogleMapController? mapController;
  PermissionStatus? _permissionGranted;
  Location? location;
  bool? serviceEnabled;
  LocationData? locationData;
  double? currentLat, currentLong;
  bool loading = true;
  List<LatLng> latlng = <LatLng>[];
  LatLng? _new;
  LatLng? _news;

  getLoc() async {
    loading = true;
    setState(() {});
    print('in get location Home page Section');
    location = new Location();
    serviceEnabled = await location!.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location!.requestService();
      if (!serviceEnabled!) {
        return;
      }
    }
    _permissionGranted = await location!.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location!.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location!.getLocation();
    currentLat = locationData!.latitude;
    currentLong = locationData!.longitude;
    print('lat main: $currentLat');
    print('long main: $currentLong');
    loading = false;
    setState(() {});
  }

  addMarkerP() {
    if (plat != null && plang != null) {
      if (_markers.length < 1) {
        _markers.add(Marker(
            markerId: MarkerId('1'),
            position: LatLng(plat, plang),
            infoWindow: InfoWindow(title: 'Pick point')));
      } else {
        _markers[0] = Marker(
            markerId: MarkerId('1'),
            position: LatLng(plat, plang),
            infoWindow: InfoWindow(title: 'Pick point'));
      }
    }
    if (dlat != null && dlang != null) {
      if (_markers.length < 2) {
        _markers.add(Marker(
            markerId: MarkerId('2'),
            position: LatLng(dlat, dlang),
            infoWindow: InfoWindow(title: 'Drop point')));
      } else {
        _markers[1] = Marker(
            markerId: MarkerId('2'),
            position: LatLng(plat, plang),
            infoWindow: InfoWindow(title: 'Drop point'));
      }
      // _markers.add(Marker(
      //     markerId: MarkerId('2'),
      //     position: LatLng(30.123, 71.123),
      //     infoWindow: InfoWindow(title: 'Drop point')));
      setState(() {});
    }
    if (dlat != null && dlang != null) {
      _controller
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(dlat, dlang), 14));
    } else if (plat != null && plang != null) {
      _controller
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(plat, plang), 14));
    }
    if (plat != null && dlang != null) {
      _new = LatLng(plat, plang);
      _news = LatLng(dlat, dlang);

      latlng.add(_new!);
      latlng.add(_news!);
      _polyline.add(Polyline(
        polylineId: PolylineId('${dlang.toString()}'),
        visible: true,
        points: latlng,
        color: Colors.blue,
      ));
      _controller
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(plat, plang), 14));
    }

    setState(() {});
  }

  late GoogleMapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(25))),
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          child: GoogleMap( polylines:_polyline,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(currentLat, currentLong),
                              zoom: 9.0,
                            ),
                            mapType: MapType.normal,
                            markers: Set<Marker>.of(_markers),
                            onMapCreated: (GoogleMapController controller) {
                              _controller = controller;
                              mapController = controller;
                            },
                          ),
                        ),
                      ),
                      Container(margin: EdgeInsets.only(right: 12,left: 12,bottom: 12),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlacePicker(
                                        /// Add YOUR OWN KEY here.
                                        apiKey: 'YOUR API KEY',
                                        onPlacePicked: (result) async {
                                          print('${result.geometry.location.lat}');
                                          print('${result.geometry.location.lng}');
                                          Navigator.of(context).pop();
                                          setState(() {});
                                          print(result.geometry.location.lat);
                                          print(result.geometry.location.lng);
                                          print(result);

                                          if (result.geometry.location.lat != null &&
                                              result.geometry.location.lng != null) {
                                            plat = result.geometry.location.lat;
                                            plang = result.geometry.location.lng;

                                            print("nLatitude: $plat");
                                            print("nLongitude: $plang");
                                            // setState(() {});
                                            addMarkerP();
                               
                                          } else {
                                            print("Address not Changed");
                                          }
                                          setState(() {});
                                        },
                                        // initialPosition: LatLng(currentLat, currentLong),
                                        useCurrentLocation: true,
                                      ),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: Text('PickUp Location')),
                                    ),
                                    Icon(FontAwesomeIcons.arrowRight)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            (plat == null && plang == null)
                                ? Container()
                                : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlacePicker(
                                        /// Add YOUR OWN KEY here.
                                        apiKey:
                                        'YOUR API KEY',
                                        onPlacePicked: (result) async {
                                          print('${result.geometry.location.lat}');
                                          print('${result.geometry.location.lng}');
                                          Navigator.of(context).pop();
                                          setState(() {});
                                          print(result.geometry.location.lat);
                                          print(result.geometry.location.lng);
                                          print(result);

                                          if (result.geometry.location.lat !=
                                              null &&
                                              result.geometry.location.lng !=
                                                  null) {
                                            dlat = result.geometry.location.lat;
                                            dlang = result.geometry.location.lng;
                                            // nlatitude = double.parse(result.geometry.location.lat.toString());
                                            // nlongitude = double.parse(result.geometry.location.lng.toString());

                                            print("nLatitude: $dlat");
                                            print("nLongitude: $dlang");
                                            // setState(() {});
                                            addMarkerP();
                                     
                                          } else {
                                            print("Address not Changed");
                                          }
                                        },
                                        // initialPosition: LatLng(currentLat, currentLong),
                                        useCurrentLocation: true,
                                      ),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: Text('Drop Location')),
                                    ),
                                    Icon(FontAwesomeIcons.arrowRight)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),],
                        ),
                      ),
                       ],
                  ),

                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 12, bottom: 12),
                        child: Text('Proceed'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
