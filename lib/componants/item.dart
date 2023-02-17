import 'package:flutter/material.dart';

class Item {
  const Item({
    required this.name,
    required this.healthy,
    required this.uid,
    required this.imageProvider,
  });
  final String name;
  final bool healthy;
  final int uid;
  final ImageProvider imageProvider;
}
