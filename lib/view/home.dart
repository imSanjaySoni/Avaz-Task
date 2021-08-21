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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void play() {
    final list = [];

    if (controller.text.isNotEmpty) {
      final int idForDestroy = int.parse(controller.text);

      setState(() {
        arena = arena.asMap().entries.map((e) {
          if (e.value == idForDestroy) {
            list.add(e.key);
          }
          return e.value == idForDestroy ? 0 : e.value;
        }).toList();
      });
    }

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
                  content: Form(
                    key: _formKey,
                    child: TextFormField(
                      autofocus: true,
                      controller: controller,
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 8),
                        hintText: 'Enter Piece Key in [ 1 - 19 ]',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Piece Key.';
                        }
                        final int? inInt = int.tryParse(controller.text);
                        if (inInt != null && inInt > 0 && inInt < 20) {
                          return null;
                        }
                        return 'Please enter a valid piece key.';
                      },
                      onFieldSubmitted: (value) {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          play();
                        }
                      },
                    ),
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
