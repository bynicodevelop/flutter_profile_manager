import 'package:flutter/material.dart';
import 'package:flutter_profile_manager/enums/TypeField.dart';

class FieldModel {
  final String id;
  final IconData icon;
  final String label;
  final String defaultValue;
  final Function(String) onUpdated;
  final TypeField type;
  final String fieldPlaceholder;

  String value;

  FieldModel({
    @required this.id,
    @required this.icon,
    @required this.label,
    @required this.value,
    @required this.onUpdated,
    this.defaultValue,
    this.fieldPlaceholder,
    this.type = TypeField.TEXT,
  });

  set updateValue(String val) => value = val;
}
