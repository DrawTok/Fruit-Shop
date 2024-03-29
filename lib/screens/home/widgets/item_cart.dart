import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(height: 100, 'assets/images/apple_green.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Apple',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\$50.00',
                style: TextStyle(color: TColors.grayText),
              ),
            ],
          ),
          SizedBox(
              height: 30,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: TColors.greenPrimary,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: TColors.blackPrimary),
                ),
              )),
        ],
      ),
    );
  }
}
