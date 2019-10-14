import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  
  final int resultScore;
  final Function resetHandler;

  ResultWidget(this.resultScore, this.resetHandler);

  String get resultPhrase {
    
    String result;

    if(resultScore != 0 && resultScore  <= 8){
      result = "You are awesome and innocent!";
    }else if( resultScore != 0 && resultScore <= 12){
      result = "Pretty likeable!";
    }else if(resultScore >= 12){
      result = "You are .... strange!";
    }else if(resultScore > 0){
      result = "You are so bad!";
    }else{
      result = "Are you ready?";
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        RaisedButton(
          child: Text( (resultPhrase == 'Are you ready?')?'Go!':'Restart'),
          textColor: Colors.white,
          color: Colors.purple,
          onPressed: resetHandler,
          shape: StadiumBorder(),
        )

      ],
    ),);
  }
}