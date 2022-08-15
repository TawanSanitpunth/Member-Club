import 'package:flutter/material.dart';

import '../model/hobby_form_model.dart';

class HobbyForm extends StatelessWidget {
  const HobbyForm({
    Key? key,
    required this.listHobby,
    required this.index,
  }) : super(key: key);

  final HobbyFormModel listHobby;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              onSaved: (text) {
                listHobby.hobbyModel?.title = text;
                listHobby.memberModel?.listHobby?.add(text ?? "");
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your hobby';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                counter: const Text(''),
                label: Text('Hobby #${index + 1}'),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                listHobby.removeHobby!();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
