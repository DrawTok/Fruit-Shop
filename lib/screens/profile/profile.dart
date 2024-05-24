import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/profile/profile_controller.dart';
import 'package:fruitshop/screens/profile/layout/profile_utility.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: Column(
          children: [
            imageProfile("${controller.firstName} ${controller.lastName}"),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(TSizes.spacing16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 100,
                  mainAxisSpacing: TSizes.spacing8,
                  crossAxisSpacing: TSizes.spacing8,
                ),
                children: [
                  ProfileUtility(
                    imageUrl: 'assets/images/information.png',
                    title: 'Thông tin',
                    direction: controller.directionToInfo,
                  ),
                  ProfileUtility(
                    imageUrl: 'assets/images/location.png',
                    title: 'Vị trí',
                    direction: controller.directionToMap,
                  ),
                  ProfileUtility(
                    imageUrl: 'assets/images/invoice.png',
                    title: 'Đơn hàng',
                    direction: controller.directionToPurchaseHistory
                  ),
                  ProfileUtility(
                    imageUrl: 'assets/images/payment.png',
                    title: TTexts.payment,
                    direction: controller.directionToPayment
                  ),
                  /* ProfileUtility(
                    imageUrl: 'assets/images/customer-service.png',
                    title: 'CSKH',
                    direction: controller.directionToInfo
                  ), */
                  ProfileUtility(
                    imageUrl: 'assets/images/logout.png',
                    title: 'Đăng xuất',
                    direction: controller.handleLogout
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container imageProfile(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing20),
      height: 150,
      color: TColors.greenPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: Styles.headingWhite1,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(TSizes.borderRadius100)),
            child: Center(
              child: Text(
                name[0],
                style: Styles.textImage,
              ),
            ),
          )
        ],
      ),
    );
  }
}
