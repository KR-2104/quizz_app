import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/pages/home_page.dart';
import 'package:quizz_app/provider/app_provider.dart';

class EndPage extends StatefulWidget {
  static String routerName = 'end';

  const EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Field.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your score is: ${Provider.of<AppProvider>(context,listen: false).score}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text(
                'Would like to save your score?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => new SafeArea(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text('Please enter your name'),
                                        TextField(
                                          controller: nameController,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel')),
                                              Expanded(
                                                child: SizedBox(
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {

                                                  if (nameController.toString() !=null)
                                                    Provider.of<AppProvider>(
                                                            context,listen: false)
                                                        .addName(nameController.text);
                                                  Provider.of<AppProvider>(context,listen: false).resetScore();
                                                  Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
                                                },
                                                child: Text('Submit'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )));
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () {
                        Provider.of<AppProvider>(context,listen: false).resetScore();
                        Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
                      },
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
