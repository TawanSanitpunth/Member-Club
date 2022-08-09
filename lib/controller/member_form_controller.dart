import 'package:club_member/model/club_model.dart';
import 'package:club_member/model/member_model.dart';
import 'package:club_member/view/member_form.dart';
import 'package:get/get.dart';

import '../model/check_box_model.dart';

class MemberFormController extends GetxController {
  List<MemberForm> memberForm = <MemberForm>[];
  RxList<ClubModel> clubList = List<ClubModel>.empty().obs;
  RxInt age = 0.obs;
  RxBool isValidateRadio = true.obs;
  RxBool isValidateDate = false.obs;
  bool isCheckedGender = true;
  RxInt radioValue = 0.obs;
  List<CheckboxModel> item = [
    CheckboxModel(title: "Website ads"),
    CheckboxModel(title: "Blog Post"),
    CheckboxModel(title: "News Article"),
    CheckboxModel(title: "Google search engine"),
    CheckboxModel(title: "Etc"),
  ];
}
