import 'package:club_member/controller/member_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../hobby_form.dart';
import 'button_widget.dart';

class AddHobby extends StatefulWidget {
  const AddHobby({Key? key, required this.addHobby, required this.hobbiesList})
      : super(key: key);
  final Function addHobby;
  final List<HobbyForm> hobbiesList;

  @override
  State<AddHobby> createState() => _AddHobbyState();
}

class _AddHobbyState extends State<AddHobby> {
  MemberFormController memberFormController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.hobbiesList.isEmpty
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: widget.hobbiesList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return widget.hobbiesList[index];
                }),
              ),
        widget.hobbiesList.length == 5
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonWidget(
                    title: 'Add Hobby',
                    ontap: () {
                      widget.addHobby();
                    }),
              )
      ],
    );
  }
}
