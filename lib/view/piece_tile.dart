import 'package:avaz/model/model.dart';
import 'package:flutter/material.dart';

class PieceTile extends StatelessWidget {
  const PieceTile({Key? key, required this.value}) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    final Size size;
    final double pieceSize;
    size = MediaQuery.of(context).size;
    pieceSize = size.width / rowSize;

    return AnimatedContainer(
      height: pieceSize,
      width: pieceSize,
      curve: Curves.easeInCirc,
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white10),
        color: value.color,
      ),
      child: value != 0
          ? Center(
              child: Text(
                '${value.key}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Container(),
    );
  }
}
