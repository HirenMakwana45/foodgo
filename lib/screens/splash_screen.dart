import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/extensions/extension_util/duration_extensions.dart';
import 'package:testapp/extensions/extension_util/int_extensions.dart';
import 'package:testapp/extensions/extension_util/widget_extensions.dart';
import 'package:testapp/screens/home_screen.dart';

import '../../../main.dart';
import '../Utils/app_colors.dart';
import '../extensions/text_styles.dart';
import '../utils/app_images.dart';
import 'dashboard_screen.dart';
// import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.seconds.delay;
    if (!mounted) return;
    // LocationPermissionScreen().launch(context);
    // MapLocationScreen().launch(context);
    // LoginScreen().launch(context);
    // if (!getBoolAsync(IS_FIRST_TIME)) {
    //   WalkThroughScreen().launch(context, isNewTask: true);
    // } else {
    //   if (userStore.isLoggedIn) {
    const DashboardScreen().launch(context, isNewTask: true);
    //   } else {
    //      SignInScreen().launch(context, isNewTask: true);
    //   }
    // }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: appStore.isDarkMode
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarIconBrightness: appStore.isDarkMode
            ? Brightness.light
            : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(icLogo, width: 150, fit: BoxFit.cover)],
            ).center(),
            Positioned(
              left: 0,
              bottom: 0,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    icSplash2,
                    width: MediaQuery.of(context).size.width * 0.55,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    icSplash1,
                    width: MediaQuery.of(context).size.width * 0.45,
                    fit: BoxFit.cover,
                  ).paddingLeft(120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
