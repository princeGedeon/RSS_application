import 'package:flutter/material.dart';
class DescText extends Text{
  final String desc;
  DescText({required this.desc}):super(
    desc,
    style: TextStyle(
      color: Colors.black45,

    )
  );



}