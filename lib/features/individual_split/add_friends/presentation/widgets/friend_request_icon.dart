import 'package:flutter/material.dart';

Widget friendRequestIcon() {
  return const SizedBox(
    width: 60,
    height: 50,
    child: Stack(
      children: [
        Icon(
          Icons.person,
          size: 50,
        ),
        Positioned(
            right: 0,
            child: Icon(
              Icons.send,
              color: Colors.blue,
            ))
      ],
    ),
  );
}