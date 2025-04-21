import 'dart:convert'; // Librería para codificar y decodificar datos JSON.
import 'dart:math';
import 'package:flutter/material.dart'; // Librería para utilidades de Flutter.
import 'package:http/http.dart' as http; // Librería para realizar solicitudes HTTP.

// Función que envía un historial de chat a la API y obtiene una respuesta generada.
Future<String?> getAnswer(List<Map<String, dynamic>> chatHistory) async {
  try {
    // URL de la API con la clave
    final url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyCMSEaQgECbNJvGxnrkSqgFxJFTJz5Cpu8';
    final uri = Uri.parse(url);

    // Contexto interno (no se envía en chatHistory)
    const String systemPrompt = '''
You are a multilingual nutritional assistant and recipe chatbot. You should respond in the language specified by the user, or—in the language of the user’s first message. Use a concise, clear, and friendly tone.

Your primary responsibilities:
1. Provide healthy, balanced recipes with clear, step-by-step instructions.
2. Answer questions about nutrition, dietary guidelines, and the nutritional properties of ingredients.
3. Offer ingredient substitutions and alternatives when requested.
4. Adapt recipes to suit different dietary preferences (e.g., vegetarian, vegan, gluten‑free, keto).
5. Supply portion‑size guidance and approximate calorie or macronutrient estimates upon request.
6. Refrain from giving specialized medical advice or diagnosing health conditions.

**Important:**  
- Format **all** your responses in Markdown (use `#` para títulos, `-` o `*` para listas, **negrita**, _cursiva_, etc.).  
- Do **not** wrap your answer in any JSON structure—output _only_ the Markdown text.
''';


    // Construir solo el contenido de usuario y modelo
    List<Map<String, dynamic>> contents = [
      for (var msg in chatHistory)
        if (msg['role'] == 'user' || msg['role'] == 'model')
          {
            'role': msg['role'] == 'user' ? 'user' : 'assistant',
            'parts': [
              {'text': msg['message'] ?? ''}
            ]
          }
    ];

    // Payload con systemInstruction separado
    final Map<String, dynamic> request = {
      'systemInstruction': {
        'parts': [
          {'text': systemPrompt}
        ]
      },
      'contents': contents,
      'generationConfig': {
        'temperature': 0.4,
        'topK': 32,
        'topP': 0.95,
        'maxOutputTokens': 512,
      },
    };

    debugPrint('Enviando solicitud: ${jsonEncode(request)}');

    final response = await http
        .post(uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(request))
        .timeout(Duration(seconds: 20));

    debugPrint('Código de estado: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final candidates = data['candidates'] as List<dynamic>?;
      if (candidates != null && candidates.isNotEmpty) {
        final parts = candidates[0]['content']['parts'] as List<dynamic>?;
        if (parts != null && parts.isNotEmpty) {
          return parts[0]['text'] as String?;
        }
      }
      return 'Lo siento, no pude interpretar la respuesta correctamente.';
    } else {
      return 'Error del servicio: ${response.statusCode}';
    }
  } catch (e) {
    debugPrint('Excepción: $e');
    return 'Ocurrió un error al conectar con el servicio.';
  }
}
