import 'package:club_member/controller/member_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/member_model.dart';

class BirthDatePicker extends StatefulWidget {
  const BirthDatePicker({Key? key, required this.memberModel})
      : super(key: key);
  final MemberModel memberModel;

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  DateTime initialDate = DateTime.now();
  DateTime dateNow = DateTime.now();
  String birthDay = "Select Date";
  int age = 0;
  MemberFormController memberFormController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text('Date of birth : '),
            Expanded(
                child: InkWell(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: initialDate,
                          firstDate: DateTime(DateTime.now().year - 100),
                          lastDate: DateTime.now());

                      if (newDate == null) return;
                      setState(() {
                        initialDate = newDate;
                        birthDay =
                            DateFormat('MM/dd/yyy').format(newDate).toString();
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).unfocus();
                        age = dateNow.difference(newDate).inDays ~/ 365;
                        if (age > 0) {
                          widget.memberModel.birthDate = age.toString();
                          memberFormController.age.value = age;
                          memberFormController.isValidateDate.value = true;
                        } else {
                          memberFormController.isValidateDate.value = false;
                        }
                      });
                    },
                    child: memberFormController.isValidateDate.value
                        ? birthDay == "Select Date" || age > 0
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    birthDay,
                                    style:
                                        const TextStyle(color: Colors.black54),
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    birthDay,
                                    style:
                                        const TextStyle(color: Colors.black54),
                                  ),
                                ),
                              )
                        : age > 0
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              )))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        memberFormController.isValidateDate.value
            ? birthDay == "Select Date"
                ? Container()
                : Row(
                    children: <Widget>[
                      const Text('Age : '),
                      SizedBox(
                        width: 60,
                      ),
                      Text('$age years old'),
                    ],
                  )
            : birthDay == "Select Date"
                ? Container()
                : const Center(
                    child: Text(
                      'Your birth date incorrect',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
      ],
    );
  }
}
