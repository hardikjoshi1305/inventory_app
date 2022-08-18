import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:logging/logging.dart';

class CastController extends GetxController {
  var isLoading = true.obs;
  var casts = List<Cast>().obs;

  void fetchCasts({int movieID}) async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchCastOfMovie(movieID: movieID);
      log('data:$res');
      if (res != null) {
        casts.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }
}