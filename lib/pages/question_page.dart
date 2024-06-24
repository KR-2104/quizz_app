import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/pages/end_page.dart';
import 'package:quizz_app/provider/app_provider.dart';
import '../utils/questions.dart';

class QuestionPage extends StatefulWidget {
  int qNo;

  QuestionPage({super.key, required this.qNo});

  static const routeName = 'questions';

  @override
  State<QuestionPage> createState() => _QuestionPageState(qNo: qNo);
}

class _QuestionPageState extends State<QuestionPage> {
  int qNo;

  _QuestionPageState({required this.qNo});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    Question q = appProvider.allQ[qNo];
    return Scaffold(
        appBar: new AppBar(
          title: Text('Quiz'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Background.jpg'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: SingleChildScrollView(
                child: questionView1(q, context, appProvider)),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (appProvider.selectedValue == -1) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Please choose an answer'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ));
              } else {
                appProvider.submit(q, context);
                if (qNo == 9) {
                  context.goNamed(EndPage.routerName);
                } else
                  ++qNo;
              }

              if (qNo == 10) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EndPage()));
              }
            });
          },
          child: Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
        ));
  }

  Widget questionView1(Question q, BuildContext context, AppProvider provider) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              q.question,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                // color: Colors.green,
                child: ListView.builder(
                    itemCount: q.choices.length,
                    itemBuilder: (context, index) => RadioListTile(
                        value: index,
                        activeColor: Colors.white,
                        title: Text(
                          q.choices[index],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        groupValue: provider.selectedValue,
                        onChanged: (value) {
                          setState(() {
                            provider.setSelectedValue(value! as int);
                          });
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
