import 'package:club_member/controller/member_form_controller.dart';
import 'package:flutter/material.dart';

import 'club_item.dart';

class ListClub extends StatelessWidget {
  const ListClub({Key? key, required this.memberFormController})
      : super(key: key);
  final MemberFormController memberFormController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: memberFormController.clubList.length,
        itemBuilder: (context, index) {
          return ClubItem(clubList: memberFormController.clubList[index]);
        },
      ),
    );
  }
}
