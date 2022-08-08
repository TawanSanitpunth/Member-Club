// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../member_form.dart';

class FaceBookTextField extends StatelessWidget {
  const FaceBookTextField({
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
          widget.memberModel.fbProfile = text;
        },
        validator: (value) {
          return null;
        },
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20),
          counter: Text(''),
          label: Text("Facebook profile url"),
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



