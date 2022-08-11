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
  MemberFormController memberFormController = Get.put(MemberFormController());
  TextEditingController clubNameController = TextEditingController();
  MemberModel member = MemberModel();
  List<MemberModel> formList = <MemberModel>[];

  addForm() {
    setState(() {
      MemberModel memberModel = MemberModel(id: uuid.v1());
      memberFormController.memberForm.add(MemberForm(
        memberModel: memberModel,
        removeForm: () {
          removeForm(memberModel);
        },
      ));
      formList.add(memberModel);
      memberFormController.isValidateRadio.value = false;
      memberFormController.radioValue.value == 0;
      member = memberModel;
      memberFormController.isValidate.value = false;
    });
  }

  removeForm(MemberModel member) {
    setState(() {
      int index = memberFormController.memberForm
          .indexWhere((element) => element.memberModel.id == member.id);

      if (memberFormController.memberForm.isNotEmpty) {
        print("Deleted");
        memberFormController.memberForm.removeAt(index);
        formList.removeAt(index);
      }
    });
  }

  onSave() {
    memberFormController.isValidateRadio.value = true;
    memberFormController.radioValue.value == 0;
    log(memberFormController.isValidateRadio.value.toString());
    if (memberFormController.formKey.currentState!.validate()) {
      memberFormController.formKey.currentState!.save();
      memberFormController.clubList.add(ClubModel(
          clubName: clubNameController.text,
          listmember: memberFormController.memberList));
      log(memberFormController.clubList.toSet().toString());
      print(memberFormController.clubList.length);
      Get.off(const MyHomePage());
    }
  }

  saveMock() {
    MemberModel mockData = MemberModel(
      id: uuid.v1(),
      firstName: "firstName ${memberFormController.memberList.length}",
      lastName: "lastName ${memberFormController.memberList.length}",
      gender: "Male ${memberFormController.memberList.length}",
      birthDate: "18/06/1994${memberFormController.memberList.length}",
      phoneNumber: "1234567890${memberFormController.memberList.length}",
      city: "city${memberFormController.memberList.length}",
      province: "Province${memberFormController.memberList.length}",
      country: "Country${memberFormController.memberList.length}",
      zipCode: "5000${memberFormController.memberList.length}",
    );
    memberFormController.memberList.add(mockData);
    memberFormController.isValidate.value = true;
    setState(() {});
    log(memberFormController.clubList.toSet().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: memberFormController.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if ((value == null || value.isEmpty) &&
                            memberFormController.memberList.isNotEmpty) {
                          return 'Please enter your Club name';
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
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () {
                        if (memberFormController.memberList.isEmpty) {
                          return Container();
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: memberFormController.memberList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 5),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFF3F4DB0)),
                                child: Text(
                                  'Member ${index + 1} : ${memberFormController.memberList[index].firstName}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          );
                        }
                      },
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
                    memberFormController.memberList.isEmpty ||
                            formList.isNotEmpty
                        ? Container()
                        : ButtonWidget(
                            title: 'Submit',
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
      ),
    );
  }
}
