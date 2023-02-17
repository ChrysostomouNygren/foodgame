import 'package:flutter/material.dart';
import 'item.dart';

class Customer {
  Customer({
    required this.name,
    required this.imageProvider,
    required this.healthy,
    List<Item>? items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final bool healthy;
  List<Item> items;
}
