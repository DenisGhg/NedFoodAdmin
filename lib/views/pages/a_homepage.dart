import 'package:flutter/material.dart';
import 'package:ned_food_admin/widgets/app_text.dart';

class AHomepage extends StatefulWidget {
  const AHomepage({super.key});

  @override
  State<AHomepage> createState() => _AHomepageState();
}

class _AHomepageState extends State<AHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText(text: "Hi, Admin Ned"),
      ),
    );
  }
}
