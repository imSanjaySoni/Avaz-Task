import 'dart:developer';

import 'package:avaz/model/model.dart';
import 'package:flutter/material.dart';

import 'piece_tile.dart';

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
        title: const Text('Dev. Sanjay Soni'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
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
                  title: const Text('PLAY'),
                  content: TextField(
                    autofocus: true,
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 12),
                      hintText: 'Enter Piece Key',
                      errorText:
                          showError ? 'Please enter a valid Piece ID.' : null,
                    ),
                    onSubmitted: (_) => play(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.play_arrow),
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
