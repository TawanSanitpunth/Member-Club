import 'package:club_member/view/components/text_detail_member.dart';
import 'package:flutter/material.dart';

import '../../model/member_model.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({
    Key? key,
    required this.memberList,
  }) : super(key: key);

  final MemberModel? memberList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextDetailMember(
              textTitle: 'First name', textData: memberList?.firstName ?? ""),
          TextDetailMember(
              textTitle: 'Last name', textData: memberList?.lastName ?? ""),
          TextDetailMember(
              textTitle: 'Phone', textData: memberList?.phoneNumber ?? ""),
          TextDetailMember(
              textTitle: 'Web Url', textData: memberList?.webUrl ?? ""),
          TextDetailMember(
              textTitle: 'Facebook profile Url',
              textData: memberList?.fbProfile ?? ""),
          TextDetailMember(
              textTitle: 'Line id', textData: memberList?.lineId ?? ""),
          TextDetailMember(
              textTitle: 'Gender', textData: memberList?.gender ?? ""),
          TextDetailMember(
              textTitle: 'Birth date', textData: memberList?.birthDate ?? ""),
          TextDetailMember(
              textTitle: 'Address', textData: memberList?.address ?? ""),
          TextDetailMember(
              textTitle: 'Address line 2',
              textData: memberList?.addressLine2 ?? ""),
          TextDetailMember(textTitle: 'City', textData: memberList?.city ?? ""),
          TextDetailMember(
              textTitle: 'State/Province',
              textData: memberList?.province ?? ""),
          TextDetailMember(
              textTitle: 'Zipcode', textData: memberList?.zipCode ?? ""),
          TextDetailMember(
              textTitle: 'Country', textData: memberList?.country ?? ""),
          TextDetailMember(
              textTitle: 'List sourch',
              textData: memberList?.listSourch?.join(",") ?? ""),
          TextDetailMember(
              textTitle: 'List hobby',
              textData: memberList?.listHobby?.join(",") ?? ""),
        ],
      ),
    );
  }
}
