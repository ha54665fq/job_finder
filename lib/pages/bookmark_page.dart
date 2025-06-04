import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشارات المرجعية'),
      ),
      body: const Center(
        child: Text('هذه هي صفحة الإشارات المرجعية'),
      ),
    );
  }
}
