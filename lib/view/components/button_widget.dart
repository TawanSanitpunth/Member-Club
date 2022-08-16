import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.ontap, required this.title})
      : super(key: key);
  final Function ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF3F4DB0)),
        height: 56,
        width: double.maxFinite,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
