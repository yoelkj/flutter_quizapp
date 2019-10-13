import 'package:flutter/material.dart';
import 'package:flutter_quizapp/providers/main_provider.dart';
import 'package:flutter_quizapp/widgets/quiz_widet.dart';
import 'package:flutter_quizapp/widgets/result_widget.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  
  var _questionIndex = 0;
  var _totalScore = 0;
  var _questions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizApp',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: _getTitleWd(),
        ),
        body: _questionIndex < _questions.length
            ? QuizWidget(
                answerQuestion: _answerQuestion,
                questionIdx: _questionIndex,
                questions: _questions,
              )
            : ResultWidget(_totalScore, _resetQuiz), 
      ),
    );
  }

  //Title widget
  Widget _getTitleWd(){
    return FutureBuilder(
      future: mainProvider.getData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        var snData = snapshot.data;
        
        _questions = snData;
        return Text('Questions ${snData.length}');
      },
    );
  }

  //Manage states
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

}