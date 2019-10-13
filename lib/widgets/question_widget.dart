import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  
  final String questionTxt;
  
  QuestionWidget(this.questionTxt);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: Text(questionTxt, style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,),
    );
  }
}