import 'package:avaz/model/game_constants.dart';
import 'package:flutter/material.dart' show Color;

extension PieceEx on int {
  int get id {
    return avilablePieceVarients.firstWhere((element) => this == element.id).id;
  }

  Color get color {
    return avilablePieceVarients
        .firstWhere((element) => this == element.id)
        .color;
  }

  String get key {
    return avilablePieceVarients
        .firstWhere((element) => this == element.id)
        .key;
  }
}
