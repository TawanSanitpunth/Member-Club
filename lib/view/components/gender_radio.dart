import 'package:club_member/controller/member_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../member_form.dart';

class GenderRadio extends StatefulWidget {
  GenderRadio({
    Key? key,
    required this.widget,
    required this.isPickGender,
  }) : super(key: key);
  final MemberForm widget;
  late bool isPickGender;

  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  int radioValue = 0;
  MemberFormController memberFormController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Gender :'),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: (int? index) {
                          setState(() {
                            radioValue = index!;
                            widget.widget.memberModel.gender = "Male";
                            widget.isPickGender = true;
                          });
                        }),
                    const Text('Male')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: (int? index) {
                          setState(() {
                            radioValue = index!;
                            widget.widget.memberModel.gender = "Female";
                            widget.isPickGender = true;
                          });
                        }),
                    const Text('Female')
                  ],
                ),
              ],
            ),
          ],
        ),
        widget.isPickGender
            ? Container()
            : const Text(
                'Please select your gender',
                style: TextStyle(color: Color(0xffD53F45)),
              ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
