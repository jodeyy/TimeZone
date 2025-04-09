// lib/services/api_service.dart
import 'dart:convert';
import 'package:flutter_application_tugas/models/time.model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Fungsi untuk mendapatkan data waktu dari API
  Future<TimeModel> fetchTimeData() async {
    final response = await http.get(
      Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=Europe/Amsterdam'),
    );

    if (response.statusCode == 200) {
      return TimeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load time data');
    }
  }
}
