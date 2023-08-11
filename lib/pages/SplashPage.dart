import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Services/http_service.dart';
import 'package:movie_app/Services/movie_service.dart';
import '../model/app_config.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashPage({
    Key? key,
    required this.onInitializationComplete,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((_) => _setup(context).then(
          (_) => widget.onInitializationComplete(),
        ));
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configfile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configfile);
    getIt.registerSingleton<AppConfig>(AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY']));

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );
    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'MovieBUFF',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
