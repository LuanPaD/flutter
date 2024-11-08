import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String _apiKey = "#####";
  final String _baseUrl = "https://api.openai.com/v1/chat/completions";

  Future<String> getChatGptResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "message": [
            {"role": "user", "content": prompt}
          ]
        }),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final responseText = data['choices'][0]['message']['content'];
        return responseText.toString();
      } else {
        print("Erro ao retornar dados do chat");
        return "Erro do chatgpt";
      }
    } catch (err) {
      print(err);
      return "erro";
    }
  }
}
