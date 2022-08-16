import 'package:club_member/model/club_model.dart';
import 'package:club_member/model/member_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/check_box_model.dart';

class MemberFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxList<MemberModel> memberList = List<MemberModel>.empty().obs;
  RxList<ClubModel> clubList = List<ClubModel>.empty().obs;
  List<CheckboxModel> item = [
    CheckboxModel(title: "Website ads"),
    CheckboxModel(title: "Blog Post"),
    CheckboxModel(title: "News Article"),
    CheckboxModel(title: "Google search engine"),
    CheckboxModel(title: "Etc"),
  ];
}
