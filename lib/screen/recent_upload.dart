import 'package:flutter/material.dart';

class RecentUpload extends StatefulWidget {
  const RecentUpload({Key? key}) : super(key: key);

  @override
  _RecentUploadState createState() => _RecentUploadState();
}

class _RecentUploadState extends State<RecentUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freshly Baked'),
      ),
    );
  }
}
