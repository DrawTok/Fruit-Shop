import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/styles.dart';

class NoItem extends StatelessWidget {
  const NoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/not_found_item.png', height: 100),
            Text(
              'Bạn chưa có đơn hàng nào!',
              style: Styles.title1,
            )
          ],
      ),
    );
  }
}
