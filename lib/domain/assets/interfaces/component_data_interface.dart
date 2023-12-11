import 'package:flutter/material.dart';

abstract class IComponentDataInterface {
  String get text;

  String get description;

  IconData get icon;

  Color get color;

  bool get isType;
}
