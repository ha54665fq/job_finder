import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_finder/models/policy.dart';
import 'package:job_finder/constants.dart';

class PolicyApi {
  static const String _baseUrl = AppConstants.appUrl;
  static const String _token = AppConstants.bearerToken;

  static Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer \$_token',
    };
  }

  static Future<List<Policy>> getTermsAndPolicies() async {
    final Uri uri = Uri.parse('\$_baseUrl/ar/api/policies');
    try {
      final response = await http.get(
        uri,
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> policyJson = json.decode(response.body);
        return policyJson.map((json) => Policy.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load terms and policies: \${response.statusCode} \${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: \$e');
    }
  }
} 