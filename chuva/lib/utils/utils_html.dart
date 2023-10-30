import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

extension HtmlFormatCorrector on String? {
  String htmlCorrector() {
    try {
      final document = parse(this);
      return document.body?.text.trim() ?? "";
    } catch (e) {
      log(e.toString());
      return this ?? "";
    }
  }

  Color fixColor() {
    var temp = this ?? "ff0000";
    if (temp[0] == "#") {
      temp = temp.substring(1);
    }
    int colorValue = int.parse("0xFF$temp");
    return Color(colorValue);
  }
}
