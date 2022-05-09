import 'package:get/get.dart';
import 'package:upapps_live_tracking/presenation/map/map_controller/map_controller.dart';

class MapBinding extends Bindings{
  @override
  void dependencies() {
    Get.put( MapController());
  }

}