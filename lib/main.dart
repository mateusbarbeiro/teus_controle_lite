import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:teus_controle_lite/app/domain/services/web_service.dart';

import 'app/injection.dart';
import 'app/my_app.dart';

// conect debug via wifi
// adb tcpip 5555
// adb connect <ip 192.168.2.2>:5555
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configInjection();
  runApp(MyApp());

  // var x = WebService();
  // var y = x.requestGetProduct('7898967002068');
  // y.then((value) => print(value.description));
}