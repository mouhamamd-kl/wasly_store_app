import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasly_store/screens/onBoarding/on_boarding_screen.dart';
import 'package:wasly_store/screens/splash_screen.dart';
import 'package:wasly_template/core/styles/custom_color_styles.dart';
import 'package:wasly_template/wasly_template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.theme,
      home: SplashScreen(
        nextScreen: OnboardingScreen(
          onFinish: () async {
            await Get.to(HomePage());
          },
        ),
        backgroundColor: AppColors.primaryBase,
      ),
      getPages: [
        // GetPage(name: '/', page: () => OnboardingScreen(onFinish: ,)),
        // GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_) => OnboardingScreen(
                onFinish: () async {
                  await Get.to(() => HomePage());
                },
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage 2"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This Store screen comes dynamically after splash screen',
            ),
          ],
        ),
      ),
    );
  }
}