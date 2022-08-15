import 'package:club_member/model/club_model.dart';
import 'package:flutter/material.dart';

import 'member_item.dart';

class ClubDetail extends StatelessWidget {
  const ClubDetail({Key? key, required this.clubList}) : super(key: key);
  final ClubModel clubList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F4DB0),
        title: Text(
          '${clubList.clubName}',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: clubList.listmember?.length,
        itemBuilder: (context, i) {
          var memberList = clubList.listmember?[i];
          return MemberItem(memberList: memberList);
        },
      ),
    );
  }
}
