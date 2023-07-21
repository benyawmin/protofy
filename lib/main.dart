import 'package:Goodbytz/features/card_management/presentation/pages/sleep_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //! Using Sizer to make the app responsive
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Goodbytz',
          home: SleepPage(),
        );
      },
    );
  }
}
