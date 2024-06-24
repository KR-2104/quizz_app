import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/pages/leadboard_page.dart';
import 'package:quizz_app/pages/question_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'The Football Quiz',
          style: TextStyle(
            fontSize: 40,
            color: Colors.green,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Field.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/Football.jpg',
                  height: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, bottom: 8, top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    context.goNamed(QuestionPage.routeName);
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(LeadboardPage.routeName);
                },
                child: Text(
                  'Leadboard',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                ),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
