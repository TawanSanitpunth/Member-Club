import 'dart:developer';

import 'package:club_member/controller/member_form_controller.dart';
import 'package:club_member/model/club_model.dart';
import 'package:club_member/model/member_model.dart';
import 'package:club_member/view/home_page.dart';
import 'package:club_member/view/member_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'components/button_widget.dart';
import 'components/club_name_textField.dart';

class ClubMemberForm extends StatefulWidget {
  const ClubMemberForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClubMemberFormState();
}

class _ClubMemberFormState extends State<ClubMemberForm> {
  var uuid = const Uuid();
  MemberFormController memberFormController = Get.put(MemberFormController());
  TextEditingController clubNameController = TextEditingController();
  List<MemberForm> formList = <MemberForm>[];

  addForm() {
    setState(() {
      MemberModel memberModel = MemberModel(id: uuid.v1());
      formList.add(MemberForm(
        memberModel: memberModel,
        removeForm: () {
          removeForm(memberModel);
        },
      ));
    });
  }

  removeForm(MemberModel member) {
    setState(() {
      int index =
          formList.indexWhere((element) => element.memberModel.id == member.id);

      if (formList.isNotEmpty) {
        formList.removeAt(index);
      }
    });
  }

  onSave() {
    if (memberFormController.formKey.currentState!.validate()) {
      memberFormController.formKey.currentState!.save();
      memberFormController.clubList.add(ClubModel(
          clubName: clubNameController.text,
          listmember: List.from(memberFormController.memberList)));
      log(memberFormController.clubList.toSet().toString());
      Get.off(const MyHomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: memberFormController.formKey,
                child: Column(
                  children: [
                    ClubNameTextField(
                        memberList: memberFormController.memberList,
                        controller: clubNameController),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () {
                        if (memberFormController.memberList.isEmpty) {
                          return Container();
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: memberFormController.memberList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                padding: const EdgeInsets.all(12),
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
                    formList.isEmpty
                        ? Container()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: formList.length,
                            itemBuilder: (context, index) {
                              return formList[index];
                            },
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      title: 'Add Member',
                      ontap: () {
                        addForm();
                      },
                    ),
                    const SizedBox(
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
