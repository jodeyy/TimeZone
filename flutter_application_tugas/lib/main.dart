// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_tugas/models/time.model.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimeScreen(),
    );
  }
}

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  late Future<TimeModel> futureTime;

  @override
  void initState() {
    super.initState();
    futureTime = ApiService().fetchTimeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time API Example'),
      ),
      body: Center(
        child: FutureBuilder<TimeModel>(
          future: futureTime,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              TimeModel timeData = snapshot.data!;
              return Text(
                'Date: ${timeData.date}\nTime: ${timeData.time}\nTimeZone: ${timeData.timeZone}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              );
            }
            return Text('No data available');
          },
        ),
      ),
    );
  }
}
