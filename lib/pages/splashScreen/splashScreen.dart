import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController.isGetDataComplete.value = false;
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        loginController.loadToken();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double imageSize = w * 0.5;
    double spinkitSize = w * 0.1;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: imageSize,
                width: imageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(UtilImages.splashScreen),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Obx(
              () => !loginController.isGetDataComplete.value
                  ? Positioned(
                      bottom: 60,
                      left: (w / 2) - (spinkitSize / 2),
                      child: SpinKitChasingDots(
                          color: Colors.black38, size: spinkitSize),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
