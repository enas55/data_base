import 'package:data_base/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLoading = true;
  bool result = false;
  String res = '';
  @override
  void initState() {
    init();
    showLoading = false;
    super.initState();
  }

  void init() async {
    result = await GetIt.I.get<SqlHelper>().createTables();
    showLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          result ? 'tables created successfully' : 'Failed to create tables',
          style: const TextStyle(fontSize: 25),
        ),
        showLoading
            ? const CircularProgressIndicator()
            : CircleAvatar(
                backgroundColor: result ? Colors.green : Colors.red,
              ),
      ],
    );
  }
}
