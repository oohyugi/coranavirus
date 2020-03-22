
import 'package:flutter/material.dart';

Widget appbar({@required BuildContext context, @required String title}){
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text(title,style: TextStyle(color: Colors.white),),
    centerTitle: false,
    elevation: 0,
  );
}