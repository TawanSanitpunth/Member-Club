import 'dart:developer';

import 'package:club_member/model/club_model.dart';
import 'package:club_member/model/member_model.dart';
import 'package:club_member/view/member_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/check_box_model.dart';

class MemberFormController extends GetxController {
  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController webController = TextEditingController();
  // TextEditingController fbController = TextEditingController();
  // TextEditingController lineController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController address2Controller = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  // TextEditingController provinceController = TextEditingController();
  // TextEditingController zipCodeController = TextEditingController();
  // TextEditingController countryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<MemberForm> memberForm = <MemberForm>[];
  RxList<MemberModel> memberList = List<MemberModel>.empty().obs;
  RxList<ClubModel> clubList = List<ClubModel>.empty().obs;
  RxInt age = 0.obs;
  RxBool isValidateRadio = true.obs;
  RxBool isValidateDate = false.obs;
  RxBool isValidate = false.obs;
  bool isCheckedGender = true;
  RxInt radioValue = 0.obs;
  List<CheckboxModel> item = [
    CheckboxModel(title: "Website ads"),
    CheckboxModel(title: "Blog Post"),
    CheckboxModel(title: "News Article"),
    CheckboxModel(title: "Google search engine"),
    CheckboxModel(title: "Etc"),
  ];
  void submit(MemberModel memberModel, Function removeForm) {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      isValidate.value = isValid;
      formKey.currentState!.save();
      memberList.add(memberModel);
      log(memberList.toSet().toString());
      removeForm();
    }
  }
}
