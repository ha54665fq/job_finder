import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_finder/models/faq.dart';
import 'package:job_finder/constants.dart';

class FaqApi {
  static const String _baseUrl = AppConstants.appUrl;
  static const String _token = AppConstants.bearerToken;

  static Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer \$_token',
    };
  }

  static Future<List<Faq>> getAllFaqs() async {
    final Uri uri = Uri.parse('\$_baseUrl/ar/api/faqs');
    try {
      final response = await http.get(
        uri,
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> faqJson = json.decode(response.body);
        return faqJson.map((json) => Faq.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load FAQs: \${response.statusCode} \${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: \$e');
    }
  }
} 