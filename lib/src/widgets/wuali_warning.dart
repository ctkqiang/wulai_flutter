import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WualaiWarning extends StatelessWidget {
  const WualaiWarning({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent color
        statusBarIconBrightness: Brightness.dark, // icons for Android
        statusBarBrightness: Brightness.light, // icons for iOS
      ),
    );

    final body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/meme.jpg', package: 'wulai'),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Text('糟糕，这里什么都没有了...', style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            '谓诸无赖：速缴所欠，此乃汝行其职之应得耳，毋待人催而后动',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: Center(child: body),
    );
  }
}
