import 'package:flutter/material.dart';
import 'package:moviez_streaming_ui/core/theme/_theme.dart';
import 'package:moviez_streaming_ui/presentation/pages/_pages.dart';


void main() {
  runApp(const MoviezStreaming());
}

class MoviezStreaming extends StatelessWidget {
  const MoviezStreaming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temenin Isoman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: BaseColors.whiteBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Homepage(),
      routes: {
        // LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }
}
