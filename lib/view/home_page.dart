import 'package:club_member/controller/member_form_controller.dart';
import 'package:club_member/view/club_member_form.dart';
import 'package:club_member/view/components/list_club.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MemberFormController memberFormController = Get.put(MemberFormController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F4DB0),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Club Member'),
      ),
      body: memberFormController.clubList.isEmpty
          ? Center(
              child: Text(
                'No data',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black),
              ),
            )
          : ListClub(memberFormController: memberFormController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          memberFormController.memberList.clear();
          Get.to(const ClubMemberForm());
        },
        tooltip: 'Increment',
        backgroundColor: const Color(0xFF3F4DB0),
        child: const Icon(Icons.add),
      ),
    );
  }
}
