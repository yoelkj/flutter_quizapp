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
  
  int _questionIndex = 0;
  int _nActiveQ = 0;
  int _totalScore = 0;
  bool _showQuiz = false;
  List _questions = [];

  @override
  void initState() {
    super.initState();
    mainProvider.getData().then((data){
      _questions = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizApp',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions ${(_nActiveQ > 0)?_nActiveQ:""}'),
        ),
        body: (_showQuiz && _questionIndex < _questions.length)
            ? QuizWidget(
                answerQuestion: _answerQuestion,
                questionIdx: _questionIndex,
                questions: _questions,
              )
            : ResultWidget(_totalScore, (!_showQuiz)?_initQuiz:_resetQuiz), 
      
      ),
    );
  }

  //Manage states

  void _initQuiz(){
    _showQuiz = true;
    _resetQuiz();
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _nActiveQ = _questions.length;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
      _nActiveQ--;
    });
  }

}