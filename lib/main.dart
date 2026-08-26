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
      // تم دمج الثيم في مكان واحد وبشكل صحيح
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A2E),
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق جين | Jane App'),
        centerTitle: true,
        backgroundColor: const Color(0xFF16213E),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mic, size: 80, color: Colors.deepPurpleAccent),
            const SizedBox(height: 20),
            const Text(
              'أهلاً بك في تطبيق جين',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('غرف صوتية ودردشة مباشرة'),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.meeting_room),
              label: const Text('دخول الغرف الصوتية'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            // تم إضافة زر للانتقال إلى صفحة الدردشة الذكية
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AIChatWidget()),
                );
              },
              icon: const Icon(Icons.chat_bubble),
              label: const Text('الدردشة الذكية'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
