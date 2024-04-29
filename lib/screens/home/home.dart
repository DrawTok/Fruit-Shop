import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/home/home_controller.dart';
import 'package:fruitshop/screens/home/widgets/category.dart';
import 'package:fruitshop/screens/home/widgets/custom_sliver.dart';
import 'package:fruitshop/screens/home/widgets/form_slider.dart';
import 'package:fruitshop/screens/home/widgets/product_list.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const TSliverAppBar(),
            const SliverPadding(
              padding: EdgeInsets.all(TSizes.spacing16),
              sliver: SliverToBoxAdapter(
                child: TFormSlider(),
              ),
            ),
            const TCategory(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing16),
              sliver: SliverToBoxAdapter(
                child: Text('Đề xuất', style: Styles.title1),
              ),
            ),
            const ProductList(),
          ],
        ));
  }
}
