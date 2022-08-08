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
      memberFormController.memberList.add(memberModel);
      memberFormController.isValidateRadio.value = true;
      // memberFormController.isValidateDate.value = false;
      memberFormController.radioValue.value == 0;
      print(memberFormController.memberList.length);
    });
  }

  removeForm(MemberModel member) {
    setState(() {
      int index = memberFormController.memberForm
          .indexWhere((element) => element.memberModel.id == member.id);

      if (memberFormController.memberForm.isNotEmpty) {
        print("Deleted");
        memberFormController.memberForm.removeAt(index);
        memberFormController.memberList.removeAt(index);
        print(memberFormController.memberList.length);
      }
    });
  }

  onSave() {
    if (memberFormController.memberForm.isNotEmpty) {
      if (formKey.currentState!.validate() ||
          memberFormController.isValidateDate.value == true) {
        if (memberFormController.radioValue.value == 0) {
          memberFormController.isValidateRadio.value = false;
        } else {
          memberFormController.clubList.add(ClubModel(
              clubName: clubNameController.text,
              listmember: memberFormController.memberList));
          formKey.currentState!.save();
          print(memberFormController.clubList.length);
          print(memberFormController.memberList.length);
          Get.to(const MyHomePage());
          memberFormController.isValidateRadio.value = true;
          memberFormController.isValidateDate.value = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3F4DB0),
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
