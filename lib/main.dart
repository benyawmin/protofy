import 'package:Goodbytz/features/card_management/data/models/order_data_model.dart';
import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/presentation/pages/pickup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'injection_container.dart' as di;
import 'package:sizer/sizer.dart';

void main() async {
  debugPaintPointersEnabled = true;
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
          home: PickupPage(
              orderData: OrderData(
                  dishes: [0, 2, 5], orderId: 'benyamin_jafari_2000')),
        );
      },
    );
  }
}
