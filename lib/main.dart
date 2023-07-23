import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/presentation/pages/pickup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        return const MaterialApp(
          title: 'Goodbytz',
          home: PickupPage(
              orderData: OrderData(
                  dishes: [0, 2, 5], orderId: 'benyamin_jafari_2000')),
        );
      },
    );
  }
}
