// ignore_for_file: file_names

import 'package:club_member/controller/member_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/check_box_model.dart';
import '../../model/member_model.dart';

class SourceCheckBox extends StatefulWidget {
  const SourceCheckBox({
    Key? key,
    required this.memberModel,
  }) : super(key: key);
  final MemberModel memberModel;

  @override
  State<SourceCheckBox> createState() => _SourceCheckBoxState();
}

class _SourceCheckBoxState extends State<SourceCheckBox> {
  MemberFormController memberFormController = Get.find();
  List<String> selectedItem = [];
  List<CheckboxModel> item = [
    CheckboxModel(title: "Website ads"),
    CheckboxModel(title: "Blog Post"),
    CheckboxModel(title: "News Article"),
    CheckboxModel(title: "Google search engine"),
    CheckboxModel(title: "Etc"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Which source does he know'),
          ...item.map((buildCheckbox)).toList(),
          selectedItem.contains('Etc')
              ? TextFormField(
                  onSaved: (newValue) {
                    selectedItem.last = "Etc : $newValue";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Etc';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    counter: Text(''),
                    label: Text("Etc"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget buildCheckbox(CheckboxModel checkBoxItems) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkBoxItems.value,
        title: Text(checkBoxItems.title!),
        onChanged: (newValue) {
          checkBoxItems.value = newValue!;
          if (checkBoxItems.value == true) {
            setState(() {
              selectedItem.add(checkBoxItems.title!);
              widget.memberModel.listSourch = selectedItem;
            });
          } else {
            setState(() {
              selectedItem.remove(checkBoxItems.title!);
              widget.memberModel.listSourch = selectedItem;
            });
          }
        });
  }
}
