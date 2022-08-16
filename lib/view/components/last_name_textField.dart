// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../member_form.dart';

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({
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
                widget.memberModel.lastName = text;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Last name"),
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
