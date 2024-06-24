import 'package:flutter/material.dart';
import 'package:quizz_app/utils/questions.dart';

import '../utils/players.dart';

class AppProvider extends ChangeNotifier {
  List<Player> leadboard = [];
  static Question q1 = Question(
      question: 'Which club is known as the Toffes?',
      answer: 'Everton',
      choices: ['Southampton', 'Everton', 'Burnely']);
  static Question q2 = Question(
      question: 'Who is the manager of Germany national team in 23/24 season?',
      answer: 'Nagelsmann',
      choices: ['Nagelsmann', 'Hans Flick', 'Lowe']);
  static Question q3 = Question(
      question: 'What is first name of Casemiro?',
      answer: 'Carlos',
      choices: ['Lucas', 'Dani', 'Carlos']);
  static Question q4 = Question(
      question: 'Who is the all time top scorer of the Bundesliga?',
      answer: 'Gerd Muller',
      choices: ['Lewandowski', 'Gerd Muller', 'Klose']);
  static Question q5 = Question(
      question: 'Who is the all time top scorer of La Liga?',
      answer: 'Leo Messi',
      choices: ['Luis Suarez', 'Cristiano Ronaldo', 'Leo Messi']);
  static Question q6 = Question(
      question:
          'Which player played for both Manchester United and Manchester City?',
      answer: 'Carlos Tevez',
      choices: ['Carlos Tevez', 'Wayne Rooney', 'Garnacho']);
  static Question q7 = Question(
      question: 'Who won the Ballon do' r' in 2022?',
      answer: 'Karim Benzema',
      choices: ['Karim Benzema', 'Luca Modric', 'Leo Messi']);
  static Question q8 = Question(
      question: 'Who won the golden glove in the 2018 World Cup?',
      answer: 'Thibaut Courtois',
      choices: ['Hugo Lloris', 'Jordan Pickford', 'Thibaut Courtois']);
  static Question q9 = Question(
      question: 'Who won the Premier League season 14/15?',
      answer: 'Leicester City',
      choices: ['Chelsea', 'Leicester City', 'Manchester City']);
  static Question q10 = Question(
      question: 'What is Cristiano Ronaldo first shirt number in Real Madrid?',
      answer: '9',
      choices: ['19', '9', '7']);

  List<Question> allQ = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10];

  int _selectedValue = -1;
  int _score = 0;

  int get selectedValue => _selectedValue;

  int get score => _score;

  void setSelectedValue(int value) {
    _selectedValue = value;
    notifyListeners();
  }

  void submit(Question q,BuildContext context) {
    if (q.choices[_selectedValue] == q.answer) _score++;
    print(q.choices[_selectedValue]);
    _selectedValue = -1;
    print(score);
  }
  void addName(String name){
    Player p = Player(name: name, score: score);
    leadboard.add(p);
  }
  void resetScore(){
    _score = 0;
  }
}
