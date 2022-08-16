// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/member_model.dart';

class ClubNameTextField extends StatelessWidget {
  const ClubNameTextField({
    Key? key,
    required this.memberList,
    required this.controller,
  }) : super(key: key);

  final RxList<MemberModel> memberList;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if ((value == null || value.isEmpty) && memberList.isNotEmpty) {
          return 'Please enter your Club name';
        }
        return null;
      },
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(20),
        counter: Text(''),
        label: Text("Club name"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
