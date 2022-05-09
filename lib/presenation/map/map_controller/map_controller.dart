import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController{
  Location location=Location();
  StreamSubscription? _subscription;
  StreamSubscription? _newSubscription;
  Marker? origin;
  Circle? circle;
  bool isLive=false;
  bool isLoading=false;


  @override
  void onInit() {
   // Get.put(MapController());
    origin=Marker(markerId: MarkerId('me'),
        draggable: false,
        flat: true,
        position: LatLng(37.42796133580664, -122.085749655962),

        zIndex: 2
    );
    circle=Circle(circleId: CircleId('myCircle'),
        center: LatLng(37.42796133580664, -122.085749655962),
        zIndex: 1,

        strokeColor: Colors.blue,
        fillColor: Colors.blue.withAlpha(60)
    );
  }

  GoogleMapController? _controller ;

  cancelLiveLocation()async{


   await _subscription!.cancel();
    _subscription=_newSubscription;

    isLive=false;

    update();


    print('is live? $isLive');
    print('is isLoading? $isLoading');
  }

  onMapCreated(GoogleMapController googleMapController)async{
    _controller=googleMapController;
    update();
  }
  // we can use this function to transfer icon data to be the marker
  // Future<Uint8List> getImageData()async{
  //   ByteData byteData=await rootBundle.load('assets/images/car.png');
  //   return byteData.buffer.asUint8List();
  // }
  getCurrentLocation()async{
    isLoading=true;
    update();
    try{
     // Uint8List imageData=await getData();
      // await location.getLocation();
      LocationData locationData= await location.getLocation();
      if(_subscription!=null){
        _subscription!.cancel();

      }else{

        print('is isLoading?111 $isLoading');
        var newLatLng=LatLng(locationData.latitude!, locationData.longitude!);
       _subscription= location.onLocationChanged.listen((event) {
          _controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target:newLatLng,
            zoom: 18
          )));
          updateLocation( locationData);
        });

        isLive=true;
        update();
        isLoading=false;
        print('is live? $isLive');
        print('is isLoading?222 $isLoading');
      }
      updateLocation(locationData);
    }on PlatformException catch(e){
      print(e.message);
    }


  }
  updateLocation(LocationData locationData){
    LatLng latLng=LatLng(locationData.latitude!, locationData.longitude!);
    origin=Marker(markerId: MarkerId('me'),
    icon: BitmapDescriptor.defaultMarker,
      draggable: false,
      flat: true,
      position: latLng,
      rotation: locationData.heading!,
      zIndex: 2
    );
    circle=Circle(circleId: CircleId('myCircle'),
    center: latLng,
      zIndex: 1,
      radius: locationData.accuracy!,
      strokeColor: Colors.blue,
      fillColor: Colors.blue.withAlpha(60)
    );
    update();
  }
}