import 'package:protofy/core/ui/app_theme.dart';
import 'package:protofy/features/order_pickup/presentation/pages/order_input_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:sizer/sizer.dart';

void main() async {
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
          theme: AppTheme.getThemeData(context),
          title: 'Protofy',
          home: const OrderInputPage(),
        );
      },
    );
  }
}
