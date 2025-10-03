import "package:flutter/material.dart";

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "This app demonstrates a modular Flutter layout with theme and shared widgets.",
        ),
      ),
    );
  }
}
