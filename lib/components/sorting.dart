import 'package:flutter/material.dart';
import 'item.dart';

class Sorting {
  Sorting({
    required this.type,
    required this.imageProvider,
    required this.healthy,
    List<Item>? items,
  }) : items = items ?? [];

  final String type;
  final ImageProvider imageProvider;
  final bool healthy;
  List<Item> items;
}
