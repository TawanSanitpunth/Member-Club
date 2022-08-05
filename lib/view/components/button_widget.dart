import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.ontap, required this.title})
      : super(key: key);
  final Function ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.teal),
        height: 56,
        width: double.maxFinite,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
