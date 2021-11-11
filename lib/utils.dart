

// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{

  static void showSnackBar(BuildContext context,String text)=> 

  Scaffold.of(context)
  // ignore: 
  ..removeCurrentSnackBar()
  ..showSnackBar(SnackBar(content: Text(text)));

}