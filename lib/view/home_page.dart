import 'package:club_member/controller/member_form_controller.dart';
import 'package:club_member/view/club_member_form.dart';
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
        centerTitle: true,
        title: const Text('Club Member'),
      ),
      body: memberFormController.clubList.isEmpty
          ? Center(
              child: Text(
                'No data',
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          : ListView.builder(
              itemCount: memberFormController.clubList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(memberFormController.clubList[index].clubName ?? ""),
                    Text(memberFormController
                            .clubList[index].listmember?[index].firstName ??
                        ""),
                       
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          memberFormController.memberList.clear();
          memberFormController.memberForm.clear();
          Get.to(const ClubMemberForm());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
