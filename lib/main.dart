import 'package:clean_architecture_tdd_course/features/card_management/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'injection_container.dart' as di;
import 'package:sizer/sizer.dart';

void main() async {
  debugPaintSizeEnabled = true;
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
        //! The design did not include color styles and text styles so I set them manually
        //! Instead of creating a theme for the app
        //?? The code is responsive so UI could not be pixel perfect
        return MaterialApp(
          title: 'Card Manager',
          home: LoginPage(),
        );
      },
    );
  }
}
