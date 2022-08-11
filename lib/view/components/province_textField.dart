// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../member_form.dart';

class ProvinceTextField extends StatelessWidget {
  const ProvinceTextField({
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
          widget.memberModel.province = text;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your state/province';
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20),
          counter: Text(''),
          label: Text("State/Province"),
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
