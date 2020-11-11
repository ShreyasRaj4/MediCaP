import 'package:get/get.dart';
import 'GetXHelper/FirebaseController.dart';

class InstanceBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }
}