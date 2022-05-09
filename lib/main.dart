import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upapps_live_tracking/resources/routes.dart';
import 'presenation/map/map_view/map_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      getPages: RoutesManager.routesList,
      initialRoute: Routes.mapRoute,
    );
  }
}

