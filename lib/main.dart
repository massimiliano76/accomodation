import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/IntroPage/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:easyhome/redux/reducers/reducers.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized()
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  final store = Store(reducers, initialState: AppState());
  runApp(EasyHome(
    store: store,
  ));
}

class EasyHome extends StatelessWidget {
  EasyHome({this.store});

  final store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cocogoose',
          accentColor: Color(0xFFE34652),
//          accentColor: Colors.blue.shade600,
          textTheme: TextTheme(
            headline: TextStyle(fontWeight: FontWeight.w300),
            title: TextStyle(fontWeight: FontWeight.w300),
            body1: TextStyle(
                fontWeight: FontWeight.w300, color: Color(0xFF707070)),
          ),
        ),
        home: IntroPage(),
      ),
    );
  }
}
