import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_finder/models/all_job.dart';
import 'package:job_finder/models/job.dart';
import 'package:job_finder/constants.dart';

class JobApi {
  static const String _baseUrl = AppConstants.appUrl;
  static const String _token = AppConstants.bearerToken;

  static Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $_token',
    };
  }

  static Future<AllJob> getAllJobs({Map<String, dynamic>? filters}) async {
    final Uri uri = Uri.parse('$_baseUrl/ar/api/job-seeker/all-jobs');

    try {
      final response = await http.get(
        uri,
        headers: _getHeaders(),
        // body: json.encode(filters ?? {}),
      );
      print("urei: $uri");
      // print("headers: ${_getHeaders()}");
      print("stutus code: ${response.statusCode}");
      // print("response: $response");

      if (response.statusCode == 200) {
        // final List<dynamic> jobJson = json.decode(response.body);
        // return jobJson.map((json) => Job.fromJson(json)).toList();
         return AllJob.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load jobs: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  static Future<Job> getJobDetails(int jobId) async {
    final Uri uri = Uri.parse('$_baseUrl/ar/api/job-seeker/job-details/$jobId');
    try {
      final response = await http.get(
        uri,
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final dynamic jobJson = json.decode(response.body);
        return Job.fromJson(jobJson);
      } else {
        throw Exception('Failed to load job details: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  static Future<bool> markJobFavorite(int jobId) async {
    final Uri uri = Uri.parse('$_baseUrl/ar/api/job-seeker/jobs/$jobId/mark-favorite');
    try {
      final response = await http.post(
        uri,
        headers: _getHeaders(),
      );
      if (response.statusCode == 200) {
        return true; // Assuming 200 means success
      } else {
        throw Exception('Failed to mark job favorite: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  static Future<List<Job>> getAllFavoriteJobs() async {
    final Uri uri = Uri.parse('$_baseUrl/ar/api/job-seeker/favorite-jobs');
    try {
      final response = await http.get(
        uri,
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jobJson = json.decode(response.body);
        return jobJson.map((json) => Job.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load favorite jobs: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  static Future<bool> applyJob(int jobId, {String? videoPath}) async {
    final Uri uri = Uri.parse('$_baseUrl/ar/api/job-seeker/jobs/applied/$jobId');
    try {
      // For file upload, typically you'd use MultipartRequest
      // This is a simplified example assuming a direct POST for now
      final response = await http.post(
        uri,
        headers: _getHeaders(),
        // If videoPath is used, you'd need to handle file reading and multipart request
        // body: videoPath != null ? { 'video': await File(videoPath).readAsBytes() } : null,
      );
      if (response.statusCode == 200) {
        return true; // Assuming 200 means success
      } else {
        throw Exception('Failed to apply for job: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }
}