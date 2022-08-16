import 'package:flutter/material.dart';

class TextDetailMember extends StatelessWidget {
  const TextDetailMember(
      {Key? key, r, required this.textTitle, required this.textData})
      : super(key: key);
  final String textTitle;
  final String textData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$textTitle : '),
          Flexible(
            child: Column(
              children: <Widget>[Text(textData == '' ? ' - ' : textData)],
            ),
          )
        ],
      ),
    );
  }
}
