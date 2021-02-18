import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOn = false;
  int alarmId = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.scale(
          scale: 2,
          child: Switch(
            value: isOn,
            onChanged: (value) {
              setState(() {
                isOn = value;
              });
              if (isOn == true) {
                AndroidAlarmManager.periodic(
                    Duration(seconds: 60), alarmId, fireAlarm);
              } else {
                AndroidAlarmManager.cancel(alarmId);
                print('Alarm Timer Canceled');
              }
            },
          ),
        ),
      ),
    );
  }
}

void fireAlarm() {
  print('Alarm Fired at ${DateTime.now()}');
}
