import 'package:club_member/model/hobby_model.dart';
import 'package:club_member/model/member_model.dart';

class HobbyFormModel {
  HobbyModel? hobbyModel;
  MemberModel? memberModel;
  Function? removeHobby;
  HobbyFormModel({this.hobbyModel, this.memberModel, this.removeHobby});
}
