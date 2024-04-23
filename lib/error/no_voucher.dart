import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/styles.dart';

class NoVoucher extends StatelessWidget {
  const NoVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/voucher.png', height: 100),
            Text(
              'Bạn chưa có ưu đãi nào!',
              style: Styles.title1,
            )
          ],
      ),
    );
  }
}
