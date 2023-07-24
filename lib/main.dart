import 'package:Goodbytz/features/order_pickup/presentation/pages/sleep_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'injection_container.dart' as di;
import 'package:sizer/sizer.dart';

void main() async {
  debugPaintPointersEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //! Using Sizer to make the app responsive
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
              textTheme: GoogleFonts.openSansTextTheme(
                Theme.of(context).textTheme,
              ),
              primaryColor: const Color(0xFF1E5229)),
          title: 'Goodbytz',
          home: const SleepPage(),
        );
      },
    );
  }
}
