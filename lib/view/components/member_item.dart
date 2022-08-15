import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          Text('First name: ${memberList?.firstName}'),
          Text('Last name: ${memberList?.lastName}'),
          Text('Phone: ${memberList?.phoneNumber}'),
          // Text(
          //     'Phone ${NumberFormat("###-#######").format(memberList?.phoneNumber)}'),
          Text(
              'Web Url: ${memberList?.webUrl == "" ? " - " : memberList?.webUrl}'),
          Text(
              'Facebook profile Url: ${memberList?.fbProfile == "" ? " - " : memberList?.fbProfile}'),
          Text(
              'Line id: ${memberList?.lineId == "" ? " - " : memberList?.lineId}'),
          Text('Gender: ${memberList?.gender}'),
          Text('Birth date: ${memberList?.birthDate}'),
          Text(
              'Address: ${memberList?.address == "" ? " - " : memberList?.address}'),
          Text(
              'Address line 2: ${memberList?.addressLine2 == "" ? " - " : memberList?.addressLine2}'),
          Text('City: ${memberList?.city == "" ? " - " : memberList?.city}'),
          Text(
              'State/Province: ${memberList?.province == "" ? " - " : memberList?.province}'),
          Text(
              'Zipcode: ${memberList?.address == "" ? " - " : memberList?.address}'),
          Text(
              'Country: ${memberList?.country == "" ? " - " : memberList?.country}'),
          Text('List sourch : ${memberList?.listSourch?.join(",") ?? " - "}'),
          Text('List hobby : ${memberList?.listHobby?.join(",") ?? " - "}'),
        ],
      ),
    );
  }
}
