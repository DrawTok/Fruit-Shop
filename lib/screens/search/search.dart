import 'package:flutter/material.dart';
import 'package:fruitshop/screens/home/widgets/app_bar.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: 'Search'),
      body: Padding(
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
                    borderRadius: BorderRadius.circular(TSizes.borderRadius8),
                   ),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
              ),
            )
          ],
        ),
      ),
    );
  }
}
