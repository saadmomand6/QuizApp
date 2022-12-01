// this page is for ABSTRACTION

import 'question.dart';


class QuizBrain {
  
   int _questionNumber = 0;

    final List<Question /* <= this is class from quiestion.dart page*/> _questionBank =[ //the _ befor questionbank 
    //is to make it private and this is for ENCAPSULATION
    // below  are objects of constructor of class and giving parameters
    Question('Sharks are mammals', false),
    Question('The hummingbird egg is the world\'s smallest bird egg',true),
    Question('Bats are blind', false),
    Question('An octopus has seven hearts.', false),
    Question('The goat is the national animal of Scotland.', false),
    Question('South Africa has one capital.', false),
    Question('The Atlantic Ocean is the biggest ocean on Earth.',false),
    Question('You can find the "Desert of Death" in California.', false),
    Question('The total length of the Great Wall of China adds up to 13,171 miles.', true),
    Question( 'Venezuela is home to the world\'s highest waterfall.', true),
    Question( 'Most of the human brain is made of muscle.', false),
    Question( 'Taste buds can only be found on the tongue.', false),
    Question( 'The human eye can distinguish 10 million different colors.',true),
    Question( 'The human body is about 60% water.', true),
    Question( 'The most common blood type is 0- negative.',true),
    Question( 'Pineapples grow on trees.', false),
    Question( 'French fries originated from France.',false),
    Question( 'Polo takes up the largest amount of space in terms of land area.', true),
    Question( 'Brazil is the only nation to have played in every World Cup finals tournament.', true),
    Question( 'Every golf ball has the same number of dimples.',  false),
    Question( 'The letter “T” is the most common in the English Language.', false),
    Question( 'All the kings in a standard deck of cards have a mustache.', false),
    Question( 'Pepsi was the first soft drink to be enjoyed in outer space.', false),
    Question( 'Herbivores are animal eaters.', false),
    Question( 'New York City is composed of between 36 and 42 islands.', true),
    
];
  
 void nextQuestion() {
  if(_questionNumber < _questionBank.length -1){
    _questionNumber++;
  }
  
 }
 String getQuestionText(){
  return _questionBank[_questionNumber].questionText;
 }

 bool getQuestionAnswer(){
  return _questionBank[_questionNumber].questionAnswer;
 }

 int totalquestion(){
  return _questionBank.length;
 }

 void reset(){
  _questionNumber =0;
 }

 bool isfinished(){
  if(_questionNumber==_questionBank.length-1){
    return true;
  }else{
    return false;
  }
 }

}