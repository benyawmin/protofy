import 'package:Enter/features/card_management/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'injection_container.dart' as di;
import 'package:sizer/sizer.dart';

//* Dear Examiners of this technical project,
// Unfortunately due to my teeth surgery I could not finish the whole project before the specific time
// But I think you can already see my approach which is TDD clean architecture and it would also be the same
// for the rest of the code.
// If I could write it. I would use the card management bloc to remove and editing events for cards and 
//change state based on them
// and then save or remove the carc from the list and add it to the secure storage. */

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
