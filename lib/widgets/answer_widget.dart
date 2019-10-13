import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {

  final Function selectHandler;
  final String answerTxt;
  
  AnswerWidget(this.selectHandler, this.answerTxt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.purple,
        textColor: Colors.white,
        child: Text(answerTxt),
        onPressed: selectHandler,
      ),
    );
  }
}