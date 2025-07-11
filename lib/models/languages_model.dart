import 'package:flutter/material.dart';
class language_model
{
  final String name;
  final String icon_image;
  bool isFavorite;

  language_model(this.name, this.icon_image, {this.isFavorite=false});
}