import 'package:club_member/controller/member_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'button_widget.dart';

class AddHobby extends StatefulWidget {
  const AddHobby({Key? key, required this.addHobby}) : super(key: key);
  final Function addHobby;

  @override
  State<AddHobby> createState() => _AddHobbyState();
}

class _AddHobbyState extends State<AddHobby> {
  MemberFormController memberFormController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        memberFormController.hobbiesList.isEmpty
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: memberFormController.hobbiesList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return memberFormController.hobbiesList[index];
                }),
              ),
        memberFormController.hobbiesList.length == 5
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonWidget(title: 'Add Hobby', ontap: widget.addHobby),
              )
      ],
    );
  }
}
