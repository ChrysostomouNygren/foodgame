import 'package:flutter/material.dart';

class Sorting {
  Sorting({
    required this.type,
    required this.imageProvider,
    required this.healthy,
    List? items,
  }) : items = items ?? [];

  final String type;
  final ImageProvider imageProvider;
  final bool healthy;
  List items;
}
