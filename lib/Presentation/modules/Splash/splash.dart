import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/utils/components/components.dart';

class SplashScreen extends StatefulWidget {
 final Widget start;

  SplashScreen(
    this.start, {
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom, // Shows Status bar and hides Navigation bar
      ],
    );

    Future.delayed(const Duration(seconds: 2)).then((value) {
      naviagetAndKill(context: context, widget: widget.start);
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 120,
              image: AssetImage("assets/images/NH_icon.png"),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
