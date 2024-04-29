import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          imageProfile(
              'Lê Thanh Hòa'), // Assuming this is a custom widget for displaying profile image
          _buildForm('Lê Thanh Hòa', 'Họ tên', false),
          _buildForm('12/11/2003', 'Ngày sinh', false),
          _buildForm('lth121199@gmail.com', 'Email', true),
          _buildForm('0399123456', 'Số điện thoại', false),
          _buildForm('250 Kim Giang', 'Địa chỉ', false),
          SizedBox(
            height: TDeviceUtility.getBottomNavigationBarHeight(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing20),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.greenPrimary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(TSizes.borderRadius10))),
                child: const Text(TTexts.tSave),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(String initialValue, String label, bool isRead) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.spacing20, vertical: TSizes.spacing8),
      child: TextFormField(
        initialValue: initialValue,
        readOnly: isRead,
        decoration: Styles.buildInputDecoration(label),
      ),
    );
  }

  Container imageProfile(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing20),
      height: 150,
      color: TColors.greenPrimary,
      child: Center(
          child: Stack(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(TSizes.borderRadius100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(TSizes.borderRadius100),
              child: _buildAvatar(name[0], true),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TSizes.borderRadius100),
                  color: TColors.orangePrimary),
              child: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _buildAvatar(String name, bool imageUrlExists) {
    return imageUrlExists
        ? Image.network(
            'https://th.bing.com/th/id/OIP.YamThAfETQJZRHNHwcjeCAHaE7?rs=1&pid=ImgDetMain',
            fit: BoxFit.cover)
        : Text(name, style: Styles.textImage);
  }
}
