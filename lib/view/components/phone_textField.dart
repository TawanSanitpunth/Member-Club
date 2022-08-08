// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../member_form.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MemberForm widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              onSaved: (text) {
                widget.memberModel.phoneNumber = text;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone';
                }
                if (value.length != 10) {
                  return 'Your phone number incorrect';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Phone number"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
