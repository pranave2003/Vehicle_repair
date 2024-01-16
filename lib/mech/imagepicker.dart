import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImgPick extends StatefulWidget {
  const ImgPick({super.key});

  @override
  State<ImgPick> createState() => _ImgPickState();
}

class _ImgPickState extends State<ImgPick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10))),
    );
  }
}
