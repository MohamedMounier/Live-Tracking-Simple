import 'package:get/get.dart';
import 'package:upapps_live_tracking/presenation/map/map_binding/map_binding.dart';
import 'package:upapps_live_tracking/presenation/map/map_view/map_view.dart';

class Routes{
  static final String mapRoute='/MapRoute';
}

class RoutesManager {
  static final routesList=[
    GetPage(
        name: Routes.mapRoute,
        page: ()=>MapView(),
        binding:MapBinding()
    )
  ];
}