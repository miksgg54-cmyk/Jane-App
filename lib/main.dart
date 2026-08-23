import 'package:flutter/material.dart';
import 'widgets/ai_chat_widget.dart';

void main() {
  runApp(const JaneApp());
}

class JaneApp extends StatelessWidget {
  const JaneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jane App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('تطبيق جين - الوكيل الذكي'),
          centerTitle: true,
        ),
        body: const AIChatWidget(),
      ),
    );
  }
}
