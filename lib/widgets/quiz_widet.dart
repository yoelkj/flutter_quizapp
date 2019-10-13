import 'package:flutter/material.dart';
import 'package:flutter_quizapp/widgets/answer_widget.dart';
import 'package:flutter_quizapp/widgets/question_widget.dart';

class QuizWidget extends StatelessWidget {
  
  final List questions;
  final int questionIdx;
  final Function answerQuestion;


  QuizWidget({
    @required this.questions,
    @required this.questionIdx,
    @required this.answerQuestion
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _createItems(),
    );
  }

  List<Widget> _createItems(){
    List<Widget> result = [];
    //Question
    final tmpQuestion = QuestionWidget(questions[questionIdx]['questionText'],);
    
    result.add(tmpQuestion);
    
    //Answers
    (questions[questionIdx]['answers']).forEach((answer){
      final tmpWidget = AnswerWidget(() => answerQuestion(answer['score']), answer['text']);
      result.add(tmpWidget);
    });
    return result;
  }


}