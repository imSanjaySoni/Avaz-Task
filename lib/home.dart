import 'dart:developer';

import 'package:avaz/game_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> arena = defaultArena;
  bool showError = false;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void play() {
    final int idForDestroy = int.parse(controller.text);
    final list = [];

    setState(() {
      arena = arena.asMap().entries.map((e) {
        if (e.value == idForDestroy) {
          list.add(e.key);
        }
        return e.value == idForDestroy ? 0 : e.value;
      }).toList();
    });

    controller.clear();
    Navigator.of(context).pop();
    log(list.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Dev. Sanjay Soni'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Reset Arena',
            onPressed: () {
              setState(() {
                arena = defaultArena;
              });
            },
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('PLAY'),
                  content: TextField(
                    autofocus: true,
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 16),
                      hintText: 'Enter Piece ID',
                      errorText:
                          showError ? 'Please enter a valid Piece ID.' : null,
                    ),
                    onSubmitted: (_) => play(),
                    onChanged: (value) {},
                  ),
                ),
              );
            },
            icon: Icon(Icons.play_arrow),
            tooltip: 'Play',
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Wrap(
          children: arena
              .asMap()
              .entries
              .map(
                (e) => PieceTile(
                  value: e.value,
                  index: e.key,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class PieceTile extends StatelessWidget {
  const PieceTile({
    Key? key,
    required this.value,
    required this.index,
  }) : super(key: key);

  final int value;
  final int index;

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
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white10),
        color: value.color,
      ),
      child: value != 0
          ? Center(
              child: Text(
                '$index\n${value.key}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Center(
              child: Text(
                '$index',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}

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
