import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Helper{
  static Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop() ,
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
}