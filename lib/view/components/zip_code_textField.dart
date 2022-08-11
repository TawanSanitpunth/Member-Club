// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../member_form.dart';

class ZipCodeTextField extends StatelessWidget {
  const ZipCodeTextField({
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
          widget.memberModel.zipCode = text;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your zip code';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20),
          counter: Text(''),
          label: Text("Zipcode"),
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
