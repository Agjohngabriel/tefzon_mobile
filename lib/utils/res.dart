import 'package:flutter/material.dart';
double width(BuildContext context, double fraction) =>
    MediaQuery.of(context).size.width * fraction;

double height(BuildContext context, double fraction) =>
    MediaQuery.of(context).size.height * fraction;