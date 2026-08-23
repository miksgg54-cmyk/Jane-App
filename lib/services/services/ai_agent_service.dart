
import 'package:google_generative_ai/google_generative_ai.dart';

class AIAgentService {
  late final GenerativeModel _model;
  ChatSession? _chatSession;

  static const String _apiKey = 'YOUR_GEMINI_API_KEY';

  AIAgentService() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _apiKey,
      systemInstruction: Content.system(
        'أنت وكيل ذكاء اصطناعي ومساعد مدمج في تطبيق جين (Jane App) للغرف الصوتية. '
        'دورك هو التفاعل مع المستخدمين في الغرفة، الترحيب بهم، والإجابة على استفساراتهم بأسلوب ودود ومختصر.',
      ),
    );
    _chatSession = _model.startChat();
  }

  Future<String?> sendMessage(String userMessage) async {
    try {
      final response = await _chatSession?.sendMessage(
        Content.text(userMessage),
      );
      return response?.text;
    } catch (e) {
      print('خطأ في الاتصال بالوكيل: $e');
      return 'عذراً، حدث خطأ أثناء الاتصال بالذكاء الاصطناعي.';
    }
  }
}
