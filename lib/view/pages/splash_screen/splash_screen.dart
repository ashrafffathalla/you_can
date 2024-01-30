import 'package:flutter/material.dart';
import 'package:you_can/view/pages/auth/login/autth_view.dart';
import 'package:you_can/view/pages/home/home/home_screen.dart';
import '../../../core/size_config/size_config.dart';
import '../../../data/local/hiva_helper.dart';
import '../home/layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  String? token = HiveHelper().getData("token");
  late Widget startWidget;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
    if (token != null) {
      startWidget = const LayoutScreen();
    } else {
      startWidget = const AuthView();
    }
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => startWidget),
            ));
    // Future.delayed(
    //     const Duration(seconds:2),
    //     () => Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(builder: (context) =>const AuthView()),
    //         ));
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor:  Colors.white,
        body: Center(
          child: Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.08),
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) {
                return Opacity(opacity: _opacityAnimation.value,
                child: Image.asset(
                  "assets/images/splash.png",
                  gaplessPlayback: true,
                ),
                );
              },
            ),
          ),
        ));
  }
}
