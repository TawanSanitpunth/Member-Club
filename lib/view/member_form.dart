import 'package:club_member/controller/member_form_controller.dart';
import 'package:club_member/model/hobby_model.dart';
import 'package:club_member/model/member_model.dart';
import 'package:club_member/view/components/button_widget.dart';
import 'package:club_member/view/hobby_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../model/check_box_model.dart';

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

  List<HobbyForm> hobbiesList = List.empty(growable: true);
  DateTime date = DateTime.now();
  DateTime dateNow = DateTime.now();
  String birthDay = "Select Date";
  List<CheckboxModel> item = [
    CheckboxModel(title: "Website ads"),
    CheckboxModel(title: "Blog Post"),
    CheckboxModel(title: "News Article"),
    CheckboxModel(title: "Google search engine"),
    CheckboxModel(title: "Etc"),
  ];
  List<String> selectedItem = [];
  int radioValue = 0;
  Uuid uuid = const Uuid();
  int age = 0;
  addHobby() {
    setState(() {
      HobbyModel hobbyModel = HobbyModel(id: uuid.v1());
      hobbiesList.add(HobbyForm(
          index: hobbiesList.length,
          hobbyModel: hobbyModel,
          removeHobby: () {
            removeHobby(hobbyModel);
          }));
    });
  }

  removeHobby(HobbyModel hobbyModel) {
    setState(() {
      int index = hobbiesList
          .indexWhere((element) => element.hobbyModel.id == hobbyModel.id);

      if (hobbiesList.isNotEmpty) {
        print("Deleted");
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
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
        ),
        padding: EdgeInsets.all(12),
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
                    icon: Icon(Icons.delete))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    onSaved: (text) {
                      widget.memberModel.firstName = text;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      counter: Text(''),
                      label: Text("First name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    onSaved: (text) {
                      widget.memberModel.lastName = text;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      counter: Text(''),
                      label: Text("Last name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    onSaved: (text) {
                      widget.memberModel.phoneNumber = text;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      if (value.length != 10) {
                        return 'Your phone number incorrect';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      counter: Text(''),
                      label: Text("Phone number"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.webUrl = text;
              },
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text('Web site'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.fbProfile = text;
              },
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Facebook profile url"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.lineId = text;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (GetUtils.isLowerThan(value.length, 7)) {
                  return 'Line id should be at least 8 characters';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Line Id"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Text('Gender :'),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (int? index) {
                              setState(() {
                                radioValue = index!;
                                memberFormController.radioValue.value = index;
                                widget.memberModel.gender = "Male";
                                memberFormController.isValidateRadio.value =
                                    true;
                              });
                            }),
                        const Text('Male')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (int? index) {
                              setState(() {
                                radioValue = index!;
                                widget.memberModel.gender = "Female";
                                memberFormController.isValidateRadio.value =
                                    true;
                              });
                            }),
                        const Text('Female')
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Obx((() {
              if (memberFormController.isValidateRadio.value == false) {
                return const Center(
                  child: Text(
                    'Please select your gender',
                    style: TextStyle(color: Color(0xffD53F45)),
                  ),
                );
              } else {
                return Container();
              }
            })),
            Row(
              children: <Widget>[
                const Text('Date of birth : '),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(DateTime.now().year - 100),
                          lastDate: DateTime.now());

                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                        birthDay =
                            DateFormat('MM/dd/yyy').format(newDate).toString();
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).unfocus();
                        age = dateNow.difference(newDate).inDays ~/ 365;
                        if (age > 0) {
                          widget.memberModel.birthDate = age.toString();
                          memberFormController.age.value = age;
                          memberFormController.isValidateDate.value = true;
                        } else {
                          memberFormController.isValidateDate.value = false;
                        }
                      });
                    },
                    child: birthDay == "Select Date" || age > 0
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                birthDay,
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                birthDay,
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            memberFormController.isValidateDate.value
                ? birthDay == "Select Date"
                    ? Container()
                    : Row(
                        children: <Widget>[
                          const Text('Age : '),
                          SizedBox(
                            width: 60,
                          ),
                          Text('$age years old'),
                        ],
                      )
                : birthDay == "Select Date"
                    ? Container()
                    : const Center(
                        child: Text(
                          'Your birth date incorrect',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.address = text;
              },
              maxLength: 100,
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Address"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.addressLine2 = text;
              },
              maxLength: 100,
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Address line 2"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.city = text;
              },
              maxLength: 100,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("City"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.province = text;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your state/province';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("State/Province"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.zipCode = text;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your zip code';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Zipcode"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            TextFormField(
              onSaved: (text) {
                widget.memberModel.country = text;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your country';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                counter: Text(''),
                label: Text("Country"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Which source does he know'),
            ...item.map((buildCheckbox)).toList(),
            selectedItem.contains('Etc')
                ? TextFormField(
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
            hobbiesList.isEmpty
                ? Container()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: hobbiesList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return hobbiesList[index];
                    }),
                  ),
            hobbiesList.length == 5
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonWidget(
                        title: 'Add Hobby',
                        ontap: () {
                          addHobby();
                        }),
                  )
          ],
        ),
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
