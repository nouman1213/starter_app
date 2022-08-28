import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_app/app_repository/splash_repo.dart';
import '../utils/globals.dart' as globals;

class SplashScren extends StatefulWidget {
  const SplashScren({Key? key}) : super(key: key);

  @override
  State<SplashScren> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    SplashRepo().checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/2695623/pexels-photo-2695623.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'welcome',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            )));
  }
}
