// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../member_form.dart';

class CityTextField extends StatelessWidget {
  const CityTextField({
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
          widget.memberModel.city = text;
        },
        maxLength: 100,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your city';
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20),
          counter: Text(''),
          label: Text("City"),
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
