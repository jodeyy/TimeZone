// lib/models/time_model.dart
class TimeModel {
  final String date;
  final String time;
  final String timeZone;

  TimeModel({
    required this.date,
    required this.time,
    required this.timeZone,
  });

  // Fungsi untuk membuat objek TimeModel dari JSON
  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      date: json['date'],
      time: json['time'],
      timeZone: json['timeZone'],
    );
  }
}
