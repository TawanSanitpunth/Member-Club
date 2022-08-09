import 'dart:developer';

import 'package:club_member/controller/member_form_controller.dart';
import 'package:club_member/model/check_box_model.dart';
import 'package:club_member/model/club_model.dart';
import 'package:club_member/model/member_model.dart';
import 'package:club_member/view/home_page.dart';
import 'package:club_member/view/member_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'components/button_widget.dart';

class ClubMemberForm extends StatefulWidget {
  const ClubMemberForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClubMemberFormState();
}

class _ClubMemberFormState extends State<ClubMemberForm> {
  var uuid = const Uuid();
  final formKey = GlobalKey<FormState>();
  MemberFormController memberFormController = Get.put(MemberFormController());
  TextEditingController clubNameController = TextEditingController();
  List<MemberModel> memberList = <MemberModel>[];

  addForm() {
    setState(() {
      MemberModel memberModel = MemberModel(id: uuid.v1());
      memberFormController.memberForm.add(MemberForm(
        memberModel: memberModel,
        index: memberFormController.memberForm.length,
        removeForm: () {
          removeForm(memberModel);
        },
      ));
      memberList.add(memberModel);
      memberFormController.isValidateRadio.value = false;
      memberFormController.radioValue.value == 0;
    });
  }

  removeForm(MemberModel member) {
    setState(() {
      int index = memberFormController.memberForm
          .indexWhere((element) => element.memberModel.id == member.id);

      if (memberFormController.memberForm.isNotEmpty) {
        print("Deleted");
        memberFormController.memberForm.removeAt(index);
        memberList.removeAt(index);
      }
    });
  }

  onSave() {
    memberFormController.isValidateRadio.value = true;
    memberFormController.radioValue.value == 0;
    log(memberFormController.isValidateRadio.value.toString());
    if (memberFormController.memberForm.isNotEmpty) {
      if (formKey.currentState!.validate() &&
          memberFormController.radioValue.value != 0) {
        formKey.currentState!.save();
        log(memberFormController.clubList.toSet().toString());
        memberFormController.clubList.add(ClubModel(
            clubName: clubNameController.text, listmember: memberList));
        log(memberFormController.clubList.toSet().toString());
        print(memberFormController.clubList.length);
        Get.to(const MyHomePage());
        memberFormController.isValidateRadio.value = true;
        memberFormController.isValidateDate.value = true;
      }
    }
  }

  saveMock() {
    List<MemberModel> mockData = [
      MemberModel(
        id: uuid.v1(),
        firstName: "firstName ${memberFormController.clubList.length}",
        lastName: "lastName ${memberFormController.clubList.length}",
        gender: "Male ${memberFormController.clubList.length}",
        birthDate: "18/06/1994${memberFormController.clubList.length}",
        phoneNumber: "1234567890${memberFormController.clubList.length}",
        city: "city${memberFormController.clubList.length}",
        province: "Province${memberFormController.clubList.length}",
        country: "Country${memberFormController.clubList.length}",
        zipCode: "5000${memberFormController.clubList.length}",
      )
    ];
    memberFormController.clubList
        .add(ClubModel(clubName: "Test", listmember: mockData));
    log(memberFormController.clubList.toSet().toString());
    Get.to(const MyHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Club name';
                      }
                      if (memberList.isEmpty) {
                        return 'Please enter your member atlease 1';
                      }
                      return null;
                    },
                    controller: clubNameController,
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
                  ),
                  memberFormController.memberForm.isEmpty
                      ? Container()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: memberFormController.memberForm.length,
                          itemBuilder: (context, index) {
                            return memberFormController.memberForm[index];
                          },
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    title: 'Add Member',
                    ontap: () {
                      addForm();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    title: 'Summit',
                    ontap: () {
                      onSave();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    title: 'Test',
                    ontap: () {
                      saveMock();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
