// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../member_form.dart';

class LineTextField extends StatelessWidget {
  const LineTextField({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MemberForm widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        onSaved: (text) {
          widget.memberModel.lineId = text;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null;
          }
          if (GetUtils.isLowerThan(value.length, 7)) {
            return 'Line id should be at least 8 characters';
          }
          return null;
        },
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20),
          counter: Text(''),
          label: Text("Line Id"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
