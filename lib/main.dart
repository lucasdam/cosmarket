import 'package:cosmarket/screens/base/base_screen.dart';
import 'package:cosmarket/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse(); // Só roda o app depois que inicializar o Parse
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializeParse() async {
  await Parse().initialize( // Inicializa o Parse
    '9CfSV0NXFGXv6xay1OBypg43FEELQkRG8nXfTs1k',
    'https://parseapi.back4app.com/',
    clientKey: 'KpjfAODHGHEgcsjdcrQ3Y32OIiWFwpIrfLNMRr1u',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CosMarket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        cursorColor: Colors.blue,
      ),
      home: BaseScreen(),
    );
  }
}