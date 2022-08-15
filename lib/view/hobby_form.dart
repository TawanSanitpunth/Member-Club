import 'package:club_member/model/hobby_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/member_form_controller.dart';
import '../model/member_model.dart';

class HobbyForm extends StatefulWidget {
  const HobbyForm(
      {Key? key,
      required this.index,
      required this.hobbyModel,
      required this.removeHobby,
      required this.memberModel})
      : super(key: key);
  final int index;
  final HobbyModel hobbyModel;
  final Function removeHobby;
  final MemberModel memberModel;

  @override
  State<HobbyForm> createState() => _HobbyFormState();
}

class _HobbyFormState extends State<HobbyForm> {
  MemberFormController memberFormController = Get.find();
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
                widget.hobbyModel.title = text;
                widget.memberModel.listHobby?.add(text ?? "");
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your hobby';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                counter: const Text(''),
                label: Text('Hobby #${widget.index + 1}'),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                widget.removeHobby();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
