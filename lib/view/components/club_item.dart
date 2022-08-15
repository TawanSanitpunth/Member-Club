// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/club_model.dart';
import 'club_detail.dart';

class ClubItem extends StatelessWidget {
  const ClubItem({
    Key? key,
    required this.clubList,
  }) : super(key: key);

  final ClubModel clubList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => Get.to(ClubDetail(
          clubList: clubList,
        )),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF3F4DB0)),
          child: Center(
            child: Text(
              '${clubList.clubName}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
