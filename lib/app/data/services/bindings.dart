import 'package:get/get.dart';
import 'package:pi01/app/data/services/boiler.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync(
      () async => BoilerController(),
      permanent: true,
    );
  }
}
