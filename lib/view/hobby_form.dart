import 'package:club_member/model/hobby_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HobbyForm extends StatelessWidget {
  const HobbyForm(
      {Key? key,
      required this.index,
      required this.hobbyModel,
      required this.removeHobby})
      : super(key: key);
  final int index;
  final HobbyModel hobbyModel;
  final Function removeHobby;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            onSaved: (text) {
              hobbyModel.title = text;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              counter: Text(''),
              label: Text('Hobby #${index + 1}'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              removeHobby();
            },
            icon: Icon(Icons.delete))
      ],
    );
  }
}
