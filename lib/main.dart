import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_utils/window_utils.dart';
import 'package:window_utils_example/home.dart';

void main() {
  if (!kIsWeb && debugDefaultTargetPlatformOverride == null) {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const double windowWidth = 400;
  static const double windowHeight = 600;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initAppWindow());
    print('RE-building app');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const WindowUtilsHome(),
    );
  }

  ///  Initialize App window size and position.
  void initAppWindow() {
    //  TODO: Add save / retrieve for size and position
    //  Retrieve is here, save is ... [somewhere else]
    WindowUtils.hideTitleBar();
    WindowUtils.getScreenSize().then((size) {
      //  Xcode sets app size to 2x2, this is not the default
      //    it must be manually adjusted at project create.
      //  For WindowUtils, set position, then set size then set position.
      WindowUtils.setPosition(Offset(size.width - windowWidth - 25,
          (size.height / 2) - (windowHeight / 2)));
      WindowUtils.setSize(Size(windowWidth, windowHeight)).then((value) {
        WindowUtils.setPosition(Offset(size.width - windowWidth - 25,
            (size.height / 2) - (windowHeight / 2)));
      });
    });
  }
}
