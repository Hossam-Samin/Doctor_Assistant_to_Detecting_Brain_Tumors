import 'package:brain_tumors_detection/presentation/screens/Splash_Screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'business_logic/detection_model/detection_cubit.dart';
import 'business_logic/detection_model/detection_state.dart';
import 'business_logic/detection_model/detiction_observer.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'business_logic/favirote_model/favirote_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'basic notification',
          channelDescription: 'Notification channel for basic test',
          enableVibration: true,
          playSound: true,
          onlyAlertOnce: true,
          criticalAlerts: true,
        )
      ],
      debug: true);

  // ignore: deprecated_member_use
  BlocOverrides.runZoned(() {
    runApp(MyApp(app: AppCubit()));
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.app}) : super(key: key);
  final AppCubit app;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => FavProvider(),
        child: Builder(builder: (BuildContext context) {
          return BlocProvider<AppCubit>(
              create: (context) => app,
              child: BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Doctor Assistant System',
                      theme: ThemeData(primarySwatch: Colors.blue),
                      home: const SplashScreen(),
                    );
                  }));
        }));
  }
}
