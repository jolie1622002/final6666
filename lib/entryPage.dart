import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'MEDICINE.dart';
import 'block.dart';
import 'common/convert%20time.dart';
import 'global.dart';
import 'package:provider/provider.dart';
import 'notificationssss.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'Success.dart';
import 'package:permission_handler/permission_handler.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late NewEntryBlock _newEntryBlock;

  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBlock.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();

    requestPermissions();
    initializeNotifications();
    tz.initializeTimeZones();

    _newEntryBlock = NewEntryBlock();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD NEW'),
      ),
      body: Provider<NewEntryBlock>.value(
        value: _newEntryBlock,
        child: Padding(
          padding: EdgeInsets.all((2.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PanelTitle(
                title: "Medicine Name",
                isRequired: true,
              ),
              TextFormField(
                controller: nameController,
                maxLength: 12,
                decoration:
                    const InputDecoration(border: UnderlineInputBorder()),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.black),
              ),
              const PanelTitle(
                title: "Number of pills",
                isRequired: true,
              ),
              TextFormField(
                controller: dosageController, // Added this line
                maxLength: 12,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(border: UnderlineInputBorder()),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.black),
              ),
              const PanelTitle(title: 'Reminder Option', isRequired: true),
              const IntervalSection(),
              const PanelTitle(title: 'Starting time', isRequired: true),
              const SelectTime(),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder(),
                        ),
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          String? medicineName;
                          int? dosage;
                          if (nameController.text.isNotEmpty) {
                            medicineName = nameController.text;
                          }
                          if (dosageController.text.isNotEmpty) {
                            dosage = int.parse(dosageController.text);
                          }
                          if (medicineName != null && dosage != null) {
                            // Added this validation
                            int interval =
                                _newEntryBlock.selectIntervals!.value;
                            String startTime =
                                _newEntryBlock.selectedTimeOfDay!.value;
                            List<int> intIDs = makeIDs(
                                24 / _newEntryBlock.selectIntervals!.value);
                            List<String> notificationIDs =
                                intIDs.map((i) => i.toString()).toList();
                            Medicine newEntryMedicine = Medicine(
                                notiIDs: notificationIDs,
                                medicineName: medicineName,
                                dosage: dosage,
                                interval: interval,
                                startTime: startTime);
                            globalBloc.updateMedicineList(newEntryMedicine);
                            scheduleNotif(newEntryMedicine);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessScreen()));
                          } else {
                            // Show error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please enter valid medicine name and dosage'),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  /// already initialized in main
  initializeNotifications() async {
    var initSettingAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initsetting = InitializationSettings(android: initSettingAndroid);
    await flutterLocalNotificationsPlugin.initialize(initsetting);
  }

  Future<void> requestPermissions() async {
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.requestExactAlarmsPermission();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    print(await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled());
  }

  Future<void> scheduleNotif(Medicine medicine) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Notification details
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'medicine_channel_id',
      'Medicine Reminders',
          sound:RawResourceAndroidNotificationSound('notification'),
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      showWhen: false,
    );

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    final scheduledDate =
        _nextInstanceOfMedicine(medicine.getStartTime, medicine.getInterval);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      // medicine.hashCode,
      0,
      'Time for ${medicine.getName}',
      'Take ${medicine.getDosage} every ${medicine.getInterval} hours',
      // scheduledDate,
      scheduledDate,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: medicine.toJson().toString(),
    );
  }

  tz.TZDateTime _nextInstanceOfMedicine(String startTime, int interval) {
    final now = tz.TZDateTime.now(tz.local);
    final startTimeHour = int.parse(startTime.substring(0, 2));
    final startTimeMinute = int.parse(startTime.substring(2, 4));

    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      startTimeHour - 2,
      startTimeMinute,
    );

    print(scheduledDate);
    print(tz.TZDateTime.now(tz.local));
    print(tz.TZDateTime.now(tz.UTC));

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }

    return scheduledDate;
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: title, style: Theme.of(context).textTheme.titleMedium),
            TextSpan(
              text: isRequired ? '*' : '',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class IntervalSection extends StatefulWidget {
  const IntervalSection({Key? key}) : super(key: key);

  @override
  State<IntervalSection> createState() => _IntervalSectionState();
}

class _IntervalSectionState extends State<IntervalSection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    final NewEntryBlock newEntryBlock = Provider.of<NewEntryBlock>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Remind Me Every',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.cyan),
          ),
          DropdownButton(
            iconEnabledColor: Colors.black,
            dropdownColor: Colors.white,
            hint: _selected == 0
                ? Text(
                    'Select Reminder',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : null,
            elevation: 0,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map(
              (int value) {
                return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ));
              },
            ).toList(),
            onChanged: (newVal) {
              setState(() {
                _selected = newVal!;
                newEntryBlock.updateInterval(newVal);
              });
            },
          ),
          Text(
            'hours',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.cyan),
          ),
        ],
      ),
    );
  }
}

class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;
  Future<TimeOfDay> _selectedTime() async {
    final NewEntryBlock newEntryBlock = Provider.of(context, listen: false);
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
        newEntryBlock.updateTime(convertTime(_time.hour.toString()) +
            convertTime(_time.minute.toString()));
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  _selectedTime();
                },
                child: Center(
                  child: Text(
                    _clicked == false
                        ? "Select Time"
                        : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
