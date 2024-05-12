import 'package:flutter/material.dart';
import 'package:fruitshop/screens/profile/layout/profile_form.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin'),
          actions: [TextButton(onPressed: () {}, child: const Text('Lưu'))],
        ),
        backgroundColor: Colors.white,
        body: const ProfileForm());
  }
}
