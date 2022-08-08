import 'package:club_member/controller/member_form_controller.dart';
import 'package:club_member/model/member_model.dart';
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
import 'hobby_form.dart';

class MemberForm extends StatefulWidget {
  const MemberForm(
      {Key? key,
      required this.index,
      required this.memberModel,
      required this.removeForm})
      : super(key: key);
  final int index;
  final MemberModel memberModel;
  final Function removeForm;

  @override
  State<MemberForm> createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  MemberFormController memberFormController = Get.find();
  Uuid uuid = const Uuid();

  addHobby() {
    setState(() {
      HobbyModel hobbyModel = HobbyModel(id: uuid.v1());
      memberFormController.hobbiesList.add(HobbyForm(
          index: memberFormController.hobbiesList.length,
          hobbyModel: hobbyModel,
          memberModel: widget.memberModel,
          removeHobby: () {
            removeHobby(hobbyModel);
          }));
    });
  }

  removeHobby(HobbyModel hobbyModel) {
    setState(() {
      int index = memberFormController.hobbiesList
          .indexWhere((element) => element.hobbyModel.id == hobbyModel.id);

      if (memberFormController.hobbiesList.isNotEmpty) {
        print("Deleted");
        memberFormController.hobbiesList.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Color(0xff2E387C)),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Member  ${widget.index}'),
                IconButton(
                    onPressed: () {
                      widget.removeForm();
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            FirstNameTextField(widget: widget),
            LastNameTextField(widget: widget),
            PhoneTextField(widget: widget),
            WebTextField(widget: widget),
            FaceBookTextField(widget: widget),
            LineTextField(widget: widget),
            GenderRadio(
              widget: widget,
            ),
            BirthDatePicker(
              memberModel: widget.memberModel,
            ),
            AddressTextField(widget: widget),
            AddressLine2TextField(widget: widget),
            CityTextField(widget: widget),
            ProvinceTextField(widget: widget),
            ZipCodeTextField(widget: widget),
            CountryTextField(widget: widget),
            SourceCheckBox(
              memberModel: widget.memberModel,
            ),
            AddHobby(addHobby: () {
              addHobby();
            })
          ],
        ),
      ),
    );
  }
}
