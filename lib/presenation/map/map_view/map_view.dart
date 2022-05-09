import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:upapps_live_tracking/presenation/map/map_controller/map_controller.dart';

import '../../../constants.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  //Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapController>(
            init:MapController() ,

            builder: (controller) {
              return ListView(
                children: [
                  Container(
                    height: 500,
                   // color: Colors.white,
                    child: GoogleMap(
                      markers: Set.of((controller.origin)!=null?[controller.origin!]:[]),
                      circles: Set.of((controller.circle)!=null?[controller.circle!]:[]),
                      mapType: MapType.normal,
                      initialCameraPosition: firstPosition,
                      onMapCreated: (GoogleMapController mapGooglecontroller) {
                        controller.onMapCreated(mapGooglecontroller);
                      //  _controller.complete(mapGooglecontroller);
                      },
                    ),
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){
                    controller.isLoading==true;
                    controller.isLive?controller.cancelLiveLocation():controller.getCurrentLocation();
                    //controllerUp.isLive?controllerUp.cancelLiveLocation():controllerUp.getCurrentLocation();
                  }, child: controller.isLoading?CircularProgressIndicator():
                  controller.isLive&&controller.isLoading==false?Text('cancel following'):
                  controller.isLive==false&&controller.isLoading==false?Text('Start following'):
                  controller.isLive==false&&controller.isLoading==true?CircularProgressIndicator(color:Colors.white):
                  controller.isLive==true&&controller.isLoading==true?CircularProgressIndicator(color:Colors.white):CircularProgressIndicator(color:Colors.white))
                ],
              );
            }
          ),



    );
  }

}
