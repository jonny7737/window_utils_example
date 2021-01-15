import 'package:flutter/material.dart';
import 'package:window_utils/window_frame.dart';
import 'package:window_utils/window_utils.dart';
import 'package:window_utils_example/app_body.dart';

class WindowUtilsHome extends StatelessWidget {
  const WindowUtilsHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowsFrame(
      active: false, //Platform.isWindows,
      border: Border.all(color: Colors.grey),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Stack(
            children: <Widget>[
              // AppBar background with drag and double tap support
              Positioned.fill(
                child: GestureDetector(
                  onTapDown: (_) {
                    WindowUtils.startDrag();
                  },
                  onDoubleTap: () {
                    WindowUtils.windowTitleDoubleTap();
                  },
                  child: Material(
                    elevation: 4.0,
                    color: Colors.purple,
                  ),
                ),
              ),
              // AppBar title
              Positioned.fill(
                child: IgnorePointer(
                  child: Center(
                    child: Text(
                      'Window Utils Example',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              //  AppBar trailing widget
              Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.info_outline),
                        onPressed: () {
                          WindowUtils.getWindowSize()
                              .then((val) => print('Window: $val'));
                          WindowUtils.getScreenSize()
                              .then((val) => print('Screen: $val'));
                          WindowUtils.getWindowOffset()
                              .then((val) => print('Offset: $val'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: InkWell(
        //   child: Icon(Icons.drag_handle),
        // ),
        body: const AppBody(),
      ),
    );
  }
}
