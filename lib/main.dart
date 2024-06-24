import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/pages/end_page.dart';
import 'package:quizz_app/pages/home_page.dart';
import 'package:quizz_app/pages/leadboard_page.dart';
import 'package:quizz_app/pages/question_page.dart';
import 'package:quizz_app/provider/app_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(Provider<AppProvider>(
    create: (_) => AppProvider(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  final _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: HomePage.routeName,
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
              name: QuestionPage.routeName,
              path: QuestionPage.routeName,
              builder: (context, state) => QuestionPage(qNo: 0),
              routes: [
                GoRoute(
                  path: EndPage.routerName,
                  name: EndPage.routerName,
                  builder: (context, state) => EndPage(),

                )
              ]),
          GoRoute(
            path: LeadboardPage.routeName,
            name: LeadboardPage.routeName,
            builder: (context,state) => const LeadboardPage(),
          ),
        ],
      ),
    ],
  );
}
