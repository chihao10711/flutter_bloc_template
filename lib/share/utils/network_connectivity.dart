import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/base_widgets/base_widgets.dart';
import 'package:flutter_bloc_template/l10n/l10n.dart';
import 'package:flutter_bloc_template/share/utils/utils.dart';

class NetworkConnectivity {
  late StreamSubscription<ConnectivityResult> _listener;

  ConnectivityResult? _newConnectState;

  ConnectivityResult? _oldConnectState;

  int connectChangeNumber = 0;

  Future<void> init() async {
    logInfo("Init listen network connect");
    if (defaultTargetPlatform == TargetPlatform.android) {
      _newConnectState = await Connectivity().checkConnectivity();

      if (!hasInternet(_newConnectState)) {
        showSnackBar(SnackBarNetwork(state: ConnectivityState.unavailable));
      }

      _listener = Connectivity().onConnectivityChanged.listen(
        (status) {
          updateState(status);
          if (!hasInternet(status)) {
            showSnackBar(SnackBarNetwork(state: ConnectivityState.unavailable));
          } else {
            if (hasChangedState()) {
              showSnackBar(SnackBarNetwork(state: ConnectivityState.available));
            }
          }
        },
      );
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      _newConnectState = await Connectivity().checkConnectivity();

      if (!hasInternet(_newConnectState)) {
        showSnackBar(SnackBarNetwork(state: ConnectivityState.unavailable));
      }

      _listener = Connectivity().onConnectivityChanged.listen(
        (status) {
          updateConnectChangeNumber();
          updateState(status);

          /// fix case: Auto báo có kết nối mạng, khi mở app

          if (connectChangeNumber == 1) return;

          if (connectChangeNumber == 2 && !hasInternet(status)) {
            showSnackBar(SnackBarNetwork(state: ConnectivityState.unavailable));
            return;
          }

          if (!hasInternet(status)) {
            showSnackBar(SnackBarNetwork(state: ConnectivityState.unavailable));
          } else {
            if (hasChangedState()) {
              showSnackBar(SnackBarNetwork(state: ConnectivityState.available));
            }
          }
        },
      );
    }
  }

  bool isFirstTouch() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return connectChangeNumber <= 2;
    }
    return false;
  }

  updateConnectChangeNumber() {
    if (connectChangeNumber > 4) {
      return;
    }
    ++connectChangeNumber;
  }

  void dispose() {
    _listener.cancel();
  }

  bool hasInternet(ConnectivityResult? status) =>
      status == ConnectivityResult.ethernet ||
      status == ConnectivityResult.wifi ||
      status == ConnectivityResult.mobile;

  bool hasChangedState() =>
      _newConnectState != null && (_oldConnectState != _newConnectState);

  void updateState(ConnectivityResult state) {
    _oldConnectState = _newConnectState;
    _newConnectState = state;
  }
}

enum ConnectivityState { available, unavailable }

extension ConnectivityExtension on ConnectivityState {
  String get title => _getTitle();

  Icon get getIcon => _getIcon();

  String _getTitle() {
    switch (this) {
      case ConnectivityState.available:
        return S.text.network_online;
      case ConnectivityState.unavailable:
        return S.text.network_online;
    }
  }

  _getIcon() {
    switch (this) {
      case ConnectivityState.available:
        return const Icon(Icons.wifi, color: Colors.white);
      case ConnectivityState.unavailable:
        return const Icon(Icons.network_check, color: Colors.white);
    }
  }
}

class SnackBarNetwork extends SnackBar {
  SnackBarNetwork({
    required this.state,
    Key? key,
  }) : super(
          key: key,
          duration: const Duration(seconds: 2),
          dismissDirection: DismissDirection.vertical,
          content: Row(
            children: [
              state.getIcon,
              const SizedBox(width: 12),
              Text(state.title),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
  final ConnectivityState state;
}
