import 'package:flutter/rendering.dart';

class Piece {
  Piece({required this.color, required this.id});

  final int id;
  final Color color;

  String get key => id.toString();
}
