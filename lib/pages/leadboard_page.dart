import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/provider/app_provider.dart';

class LeadboardPage extends StatefulWidget {
  static String routeName = 'leadboard';

  const LeadboardPage({super.key});

  @override
  State<LeadboardPage> createState() => _LeadboardPageState();
}

class _LeadboardPageState extends State<LeadboardPage> {
  @override
  Widget build(BuildContext context) {
    final leadboard = Provider
        .of<AppProvider>(context)
        .leadboard;
    return Scaffold(
      appBar: AppBar(
        title: Text('Leadbaord'),
        centerTitle: true,
      ),
      body: (Provider
          .of<AppProvider>(context)
          .leadboard
          .isEmpty)
          ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('No players have played yet')],
          ))
          : Center(
            child: ListView.builder(
              itemCount: leadboard.length,
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(leadboard[index].name),
                    trailing: Text('Score : ${leadboard[index].score}'),
                  ),
            ),
          ),
    );
  }
}
