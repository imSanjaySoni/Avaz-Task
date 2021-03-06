import 'package:avaz/model/piece.dart';
import 'package:flutter/material.dart' show Color, Colors;

const int rowSize = 6;
const int colSize = 10;

final List<Piece> avilablePieceVarients = [
  Piece(id: 0, color: Colors.transparent),
  Piece(id: 1, color: Color(0xFFB088F9)),
  Piece(id: 2, color: Color(0xFFCD5D7D)),
  Piece(id: 3, color: Color(0xFFF1CA89)),
  Piece(id: 4, color: Color(0xFFFFE66D)),
  Piece(id: 5, color: Color(0xFFCDC733)),
  Piece(id: 6, color: Color(0xFFFF7171)),
  Piece(id: 7, color: Color(0xFFAEE6E6)),
  Piece(id: 8, color: Color(0xFF7579E7)),
  Piece(id: 9, color: Color(0xFFFAAD80)),
  Piece(id: 10, color: Color(0xFFE5D549)),
  Piece(id: 11, color: Color(0xFF00EAD3)),
  Piece(id: 13, color: Color(0xFFE4BAD4)),
  Piece(id: 12, color: Color(0xFFE63E6D)),
  Piece(id: 14, color: Color(0xFFFF8474)),
  Piece(id: 15, color: Color(0xFF62959C)),
  Piece(id: 16, color: Color(0xFFF1935C)),
  Piece(id: 17, color: Color(0xFF0C9463)),
  Piece(id: 18, color: Color(0xFFF9813A)),
  Piece(id: 19, color: Color(0xFF6CA6C1)),
];

const defaultArena = [
  0,
  1,
  1,
  0,
  0,
  0,
  0,
  1,
  2,
  2,
  0,
  0,
  0,
  1,
  1,
  2,
  3,
  0,
  17,
  0,
  2,
  2,
  4,
  0,
  17,
  5,
  5,
  5,
  6,
  0,
  17,
  0,
  0,
  8,
  7,
  0,
  17,
  9,
  8,
  8,
  10,
  10,
  17,
  11,
  12,
  12,
  12,
  13,
  17,
  15,
  12,
  14,
  0,
  16,
  17,
  12,
  12,
  12,
  18,
  19
];
