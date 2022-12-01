import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();/*   this is an object of class QuizBrain*/

void main() => runApp( const Quizler());


class Quizler extends StatelessWidget/* "extends" means here is used INHERITANCE*/ {
  const Quizler({super.key});

  @override /* "@override" means here is used POLYMORPHISM*/

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const  Center(
          child: Text('Quiz App',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body:const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
      child: QuizerPage(),
      ),
      ),
    );
  }
}

class QuizerPage extends StatefulWidget {
  const QuizerPage({super.key});

  @override
  State<QuizerPage> createState() => _QuizerPageState();
}

class _QuizerPageState extends State<QuizerPage> {

  List<Icon> scorekeeper = [];
  int score=0;
  void checkAnswer(bool userpickedanswer){
    bool correctanswer = quizbrain.getQuestionAnswer();/*quizbrain is 
                used as object of class QuizBrain,  here text is 
                given from questionbank list of having specific questionnumber and as 'a=questionAnswer' so 
                here questionAnswer is used for bool (true/false)*/
                setState(() {
                  if(quizbrain.isfinished()==true){
                    Alert(
      context: context,
      type: AlertType.success,
      title: "Quiz Finished",
      desc: "You Got $score Out Of ${quizbrain.totalquestion()}",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "TRY AGAIN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
                    quizbrain.reset();
                    scorekeeper.clear();
                  }else{

                if(userpickedanswer == correctanswer){
                  scorekeeper.add( Icon(Icons.check, color: Colors.green.shade100,));
                  score++;
                }else{
                  scorekeeper.add(Icon(Icons.close, color: Colors.red.shade100,));
                }
                
                  quizbrain.nextQuestion();
                  }
                });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(),/*quizbrain is 
                used as object of class QuizBrain,  here text is given from questionbank 
list of having specific questionnumber and as 'q=questionText' so here questionText is used for text */ 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              ),
            ),),),
            Expanded(child: Padding(padding: const EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white,),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                checkAnswer(true);
                
              },
              child: const Text('True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              )),
            )),
             Expanded(child: Padding(padding: const EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white,),
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text('False',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              )),
            )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                
                children: scorekeeper,
                ),
            ),
            const SizedBox(
              height: 40,
            )
      ],
    );
  }
}

