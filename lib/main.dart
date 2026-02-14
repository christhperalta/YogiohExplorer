import 'package:entrevista/feature/card_list/presentation/provider/provider.dart';
import 'package:entrevista/feature/card_list/presentation/screen/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CardProvider()..loadCard()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: CardScreen(),
      ),
    );
  }
}
