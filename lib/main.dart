import 'package:flutter/material.dart';
import 'widgets/ai_chat_widget.dart';

void main() {
  runApp(const JaneApp());
}

class JaneApp extends StatelessWidget {
  const JaneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jane App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AIChatWidget(),
    );
  }
}
