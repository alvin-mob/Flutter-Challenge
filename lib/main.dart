import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterchallenge/core/bloc/dashboard_bloc.dart';
import 'package:flutterchallenge/ui/views/dashboardView/dashboard_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [
    SystemUiOverlay.top
  ]).then((value) => {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const FlutterChallenge()))
  });

}

class FlutterChallenge extends StatelessWidget {
  const FlutterChallenge({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DashBoardBloc>(
            create: (context) => DashBoardBloc(),
            dispose: (_, DashBoardBloc dashboardBloc)=>dashboardBloc.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Colors.blue,
        ),
        home: DashBoardView(),
      ),
    );
  }
}