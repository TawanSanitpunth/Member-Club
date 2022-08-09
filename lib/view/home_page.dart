import 'dart:developer';

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
          : ListView.builder(
              itemCount: memberFormController.clubList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff2F3880),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 12.0,
                          ),
                          child: Center(
                            child: Text(
                              '${memberFormController.clubList[index].clubName}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                      Container(
                        padding: const EdgeInsets.all(8),
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
                              offset: const Offset(
                                  2, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: memberFormController
                              .clubList[index].listmember?.length,
                          itemBuilder: (context, i) {
                            var clubList = memberFormController
                                .clubList[index].listmember?[i];
                            log(clubList.toString());
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('First name: ${clubList?.firstName}'),
                                Text('Last name: ${clubList?.lastName}'),
                                Text('Phone: ${clubList?.phoneNumber}'),
                                Text('Web Url: ${clubList?.webUrl ?? "-"}'),
                                Text(
                                    'Facebook profile Url: ${clubList?.fbProfile ?? "-"}'),
                                Text('Line id: ${clubList?.lineId ?? "-"}'),
                                Text('Gender: ${clubList?.gender}'),
                                Text('Birth date: ${clubList?.birthDate}'),
                                Text('Address: ${clubList?.address ?? "-"}'),
                                Text(
                                    'Address line 2: ${clubList?.addressLine2 ?? "-"}'),
                                Text('City: ${clubList?.city}'),
                                Text('State/Province: ${clubList?.province}'),
                                Text('Zipcode: ${clubList?.address ?? "-"}'),
                                Text('Country: ${clubList?.country ?? "-"}'),
                                Text(
                                    'List sourch : ${clubList?.listSourch?.join(",") ?? "-"}'),
                                Text(
                                    'List hobby : ${clubList?.listHobby?.join(",") ?? "-"}'),
                                Divider()
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          memberFormController.memberForm.clear();
          Get.to(const ClubMemberForm());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
