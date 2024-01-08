import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/main.dart';

extension GetSize on double {
  h() {
    return MediaQuery.of(navigatorKey.currentState!.context).size.height * this;
  }

  w() {
    return MediaQuery.of(navigatorKey.currentState!.context).size.width * this;
  }

  res() {
    return (MediaQuery.of(navigatorKey.currentState!.context).size.height *
            this) +
        (MediaQuery.of(navigatorKey.currentState!.context).size.width * this);
  }
}
