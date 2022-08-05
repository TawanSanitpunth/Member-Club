import 'package:club_member/model/club_model.dart';
import 'package:club_member/model/member_model.dart';
import 'package:club_member/view/member_form.dart';
import 'package:get/get.dart';

class MemberFormController extends GetxController {
  RxList<MemberForm> memberForm = List<MemberForm>.empty(growable: true).obs;
  RxList<MemberModel> memberList = List<MemberModel>.empty().obs;
  RxList<ClubModel> clubList = List<ClubModel>.empty().obs;
  RxInt age = 0.obs;
  RxBool isValidateRadio = true.obs;
  RxBool isValidateDate = false.obs;
  RxInt radioValue = 0.obs;


}
