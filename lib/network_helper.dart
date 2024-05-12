import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_weather/network/bloc/network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      for (var result in results) {
        if (result == ConnectivityResult.none) {
          NetworkBloc().add(NetworkNotify());
        } else {
          NetworkBloc().add(NetworkNotify(isConnected: true));
        }
      }
    });
  }
}
