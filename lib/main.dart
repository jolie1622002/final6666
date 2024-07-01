import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/addPaitientInfo_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'screens/addDocument.dart';
import 'screens/add_screen.dart';
import 'screens/start_screen.dart';

import 'block.dart';
import 'global.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notificationssss.dart';
import 'package:intl/intl.dart';

Future<void> requestNotificationPermission() async {
  var status = await Permission.notification.request();
  if (status.isGranted) {
    // Permission granted
  } else {
    // Handle permission not granted
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notification permissions
  await requestNotificationPermission();

  runApp(ZEE());
}

class ZEE extends StatefulWidget {
  @override
  State<ZEE> createState() => _ZEEState();
}

class _ZEEState extends State<ZEE> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              iconTheme: IconThemeData(
                color: Colors.blue,
              ),
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              'LoginScreen': (context) => LoginScreen(),
              'RegisterScreen': (context) => RegisterScreen(),
              'StartScreen': (context) => StartScreen(),
              AddScreen.routeName: (context) => AddScreen(),
              AddPatientInfo.routeName: (context) => AddPatientInfo(),
              'AddDocument': (context) => AddDocument(),
            },
            initialRoute: 'StartScreen',
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Flutter Demo'),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TimeDisplay(), // Display time in the app bar
                  ),
                ],
              ),
              body: const NotificationPage(), // Example body content
            ),
          );
        },
      ),
    );
  }
}

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({Key? key}) : super(key: key);

  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late Stream<DateTime> _clockStream;
  late DateFormat _timeFormatter;

  @override
  void initState() {
    super.initState();
    // Initialize the stream with a timer that ticks every second
    _clockStream =
    Stream<DateTime>.periodic(const Duration(seconds: 1), (count) {
      return DateTime.now();
    });

    // Initialize the time formatter
    _timeFormatter =
        DateFormat.Hm(); // Hm for 24-hour format, hh:mm a for 12-hour format
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _clockStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DateTime currentTime = snapshot.data!;
          String formattedTime = _timeFormatter.format(currentTime);

          return Text(
            formattedTime,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return Text('Loading...'); // Placeholder widget if no data
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
