import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivityService {
  Future<bool> isConnected() async {
    var connectivity = await (Connectivity().checkConnectivity());

    return connectivity == ConnectivityResult.ethernet ||
        connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi;
  }
}
