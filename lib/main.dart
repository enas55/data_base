import 'package:data_base/home_page.dart';
import 'package:data_base/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var sqlHelper = SqlHelper();
  await sqlHelper.initDb();
  if(sqlHelper.db != null){
    GetIt.I.registerSingleton(sqlHelper);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}