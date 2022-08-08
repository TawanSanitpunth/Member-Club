// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../member_form.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({
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
          widget.memberModel.address = text;
        },
        maxLength: 100,
        validator: (value) {
          return null;
        },
        keyboardType: TextInputType.streetAddress,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20),
          label: Text("Address"),
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