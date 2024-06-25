import 'package:flutter/material.dart';

BoxShadow shadow() {
  return BoxShadow(
    spreadRadius: 0.1,
    offset: const Offset(0,6),
    blurRadius: 9,
    color: Colors.black.withOpacity(.3),
  );
}

BoxShadow shadowZero() {
  return  BoxShadow(
    spreadRadius: 0,
    offset: const Offset(0,0),
    blurRadius: 0,
    color: Colors.black.withOpacity(0),
  );
}