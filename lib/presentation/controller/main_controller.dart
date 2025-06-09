import 'package:get/get.dart';

class MainController extends GetxController {
  // Variable untuk menyimpan index halaman yang aktif
  final RxInt currentIndex = 0.obs;

  // Method untuk mengubah index halaman
  void changePage(int index) {
    currentIndex.value = index;
  }
}
