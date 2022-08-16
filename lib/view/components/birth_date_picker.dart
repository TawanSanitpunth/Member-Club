import 'package:club_member/controller/member_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/member_model.dart';

// ignore: must_be_immutable
class BirthDatePicker extends StatefulWidget {
  BirthDatePicker(
      {Key? key, required this.memberModel, required this.birthDateValidate})
      : super(key: key);
  final MemberModel memberModel;
  late bool birthDateValidate;

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
                    age = dateNow.difference(newDate).inDays ~/ 365;
                    if (age > 0) {
                      widget.memberModel.birthDate = birthDay;
                      widget.birthDateValidate = true;
                    } else {
                      widget.birthDateValidate = false;
                      widget.memberModel.birthDate = null;
                    }
                  });
                },
                child: widget.birthDateValidate
                    ? birthDay == "Select Date"
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                birthDay,
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                          )
                        : age == 0
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffD53F45), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    birthDay,
                                    style: const TextStyle(
                                        color: Color(0xffD53F45)),
                                  ),
                                ),
                              )
                            : Container(
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
                          border: Border.all(
                              color: const Color(0xffD53F45), width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            birthDay,
                            style: const TextStyle(color: Color(0xffD53F45)),
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        widget.birthDateValidate
            ? birthDay == "Select Date"
                ? Container()
                : age == 0
                    ? const Center(
                        child: Text(
                          'Your birth date incorrect',
                          style: TextStyle(color: Color(0xffD53F45)),
                        ),
                      )
                    : Row(
                        children: <Widget>[
                          const Text('Age : '),
                          const SizedBox(
                            width: 60,
                          ),
                          Text('$age years old'),
                        ],
                      )
            : birthDay == 'Select Date'
                ? const Center(
                    child: Text(
                      'Please select your birthdate',
                      style: TextStyle(color: Color(0xffD53F45)),
                    ),
                  )
                : const Center(
                    child: Text(
                      'Your birth date incorrect',
                      style: TextStyle(color: Color(0xffD53F45)),
                    ),
                  ),
      ],
    );
  }
}
