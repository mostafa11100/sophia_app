import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.white.withOpacity(0)),
            fontFamily: "Asul"),
        debugShowCheckedModeBanner: false,
        routerConfig: approuter.routs);
  }
}


//  jsonofmodel?['name'] = name==null?"":name;
  //   jsonofmodel?['url'] = url==null?"":url;
  //   jsonofmodel?['state'] = online==null?false:online;
  //   jsonofmodel?['bio'] = bio==null?"":bio;
  //   jsonofmodel?['following'] = following==null?[]:following;
  //   jsonofmodel?['followers'] = followers==null?[]:followers;
  //   jsonofmodel?['description'] = description==null?"":description;
    
  //   jsonofmodel?['publicpost'] = puplicpost==null?[]:puplicpost;
  // }
