import 'package:flutter/material.dart';
import 'package:fruitshop/screens/home/widgets/item_cart.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.all(TSizes.spacing10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  mainAxisSpacing: TSizes.spacing8,
                  crossAxisSpacing: TSizes.spacing8),
              itemBuilder: (_, index) => const ItemCard()),
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(TSizes.spacing10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Search fruit',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: TSizes.spacing10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
