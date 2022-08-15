import 'dart:developer';

import 'package:club_member/controller/member_form_controller.dart';
import 'package:club_member/model/member_model.dart';
import 'package:club_member/view/components/button_widget.dart';
import 'package:club_member/model/hobby_form_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../model/hobby_model.dart';
import 'components/add_hobby.dart';
import 'components/address_line2_textField.dart';
import 'components/address_textField.dart';
import 'components/birth_date_picker.dart';
import 'components/city_textField.dart';
import 'components/country_textField.dart';
import 'components/faceBook_textField.dart';
import 'components/first_name_textField.dart';
import 'components/gender_radio.dart';
import 'components/last_name_textField.dart';
import 'components/line_textField.dart';
import 'components/phone_textField.dart';
import 'components/province_textField.dart';
import 'components/source_checkBox.dart';
import 'components/web_textField.dart';
import 'components/zip_code_textField.dart';

class MemberForm extends StatefulWidget {
  const MemberForm({
    Key? key,
    required this.memberModel,
    required this.removeForm,
  }) : super(key: key);
  final MemberModel memberModel;
  final Function removeForm;

  @override
  State<MemberForm> createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  MemberFormController memberFormController = Get.find();
  GlobalKey<FormState> memberFormKey = GlobalKey<FormState>();
  Uuid uuid = const Uuid();
  bool isValidateGender = true;
  bool isValidateBirthDate = true;
  List<HobbyFormModel> hobbiesList = List.empty(growable: true);
  addForm() {
    setState(() {
      if (memberFormKey.currentState!.validate() &&
          isValidateGender &&
          isValidateBirthDate) {
        memberFormKey.currentState!.save();
        memberFormController.memberList.add(widget.memberModel);
        log(memberFormController.memberList.toSet().toString());
        widget.removeForm();
      }
    });
  }

  addHobby() {
    setState(() {
      HobbyModel hobbyModel = HobbyModel(
        id: uuid.v1(),
      );
      widget.memberModel.listHobby = [];
      hobbiesList.add(HobbyFormModel(
          hobbyModel: hobbyModel,
          memberModel: widget.memberModel,
          removeHobby: () {
            removeHobby(hobbyModel);
          }));
    });
  }

  removeHobby(HobbyModel hobbyModel) {
    setState(() {
      int index = hobbiesList
          .indexWhere((element) => element.hobbyModel?.id == hobbyModel.id);

      if (hobbiesList.isNotEmpty) {
        hobbiesList.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: memberFormKey,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 0.8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add member'),
                  IconButton(
                      onPressed: () {
                        widget.removeForm();
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
              FirstNameTextField(
                widget: widget,
              ),
              LastNameTextField(
                widget: widget,
              ),
              PhoneTextField(
                widget: widget,
              ),
              WebTextField(
                widget: widget,
              ),
              FaceBookTextField(
                widget: widget,
              ),
              LineTextField(
                widget: widget,
              ),
              GenderRadio(
                widget: widget,
                isPickGender: isValidateGender,
              ),
              BirthDatePicker(
                memberModel: widget.memberModel,
                birthDateValidate: isValidateBirthDate,
              ),
              AddressTextField(
                widget: widget,
              ),
              AddressLine2TextField(
                widget: widget,
              ),
              CityTextField(
                widget: widget,
              ),
              ProvinceTextField(
                widget: widget,
              ),
              ZipCodeTextField(
                widget: widget,
              ),
              CountryTextField(
                widget: widget,
              ),
              SourceCheckBox(
                memberModel: widget.memberModel,
              ),
              AddHobby(
                  hobbiesList: hobbiesList,
                  addHobby: () {
                    addHobby();
                  }),
              ButtonWidget(
                  ontap: () {
                    if (widget.memberModel.gender == null) {
                      isValidateGender = false;
                      addForm();
                    }
                    if (widget.memberModel.birthDate == null) {
                      isValidateBirthDate = false;
                      addForm();
                    } else {
                      isValidateBirthDate = true;
                    }
                    if (widget.memberModel.gender != null &&
                        widget.memberModel.birthDate != null) {
                      isValidateGender = true;
                      isValidateBirthDate = true;
                      addForm();
                    }
                  },
                  title: "Submit member")
            ],
          ),
        ),
      ),
    );
  }
}
