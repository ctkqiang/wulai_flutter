import 'package:flutter/material.dart';

class WualaiWarning extends StatelessWidget {
  const WualaiWarning({super.key});

  @override
  Widget build(BuildContext context) {
    final body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset('assets/meme.jpg'), Text('糟糕，这里什么都没有了...')],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: body),
    );
  }
}
