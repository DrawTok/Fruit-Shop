import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/widgets/app_bar.dart';
import 'package:fruitshop/widgets/custom_button.dart';
import 'package:get/get.dart';

class ShippingInfo extends GetView<CartController> {
  const ShippingInfo({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const TAppBar(title: 'Thông tin vận chuyển'),
      body: Container(
        padding: const EdgeInsets.all(TSizes.spacing8),
        color: Colors.white,
        child: Form(
            key: controller.formKeyInfo,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: controller.setPhone,
                        keyboardType: TextInputType.number,
                        validator: (value) => controller.validatePhone(value),
                        decoration:
                            Styles.buildInputDecoration('Số điện thoại'),
                      ),
                      const SizedBox(height: TSizes.sizeBoxHeight10),
                      TextFormField(
                        onChanged: controller.setAddress,
                        keyboardType: TextInputType.streetAddress,
                        decoration: Styles.buildInputDecoration('Địa chỉ'),
                      ),
                      const SizedBox(height: TSizes.sizeBoxHeight20),
                      Text('Chọn phương thức thanh toán', style: Styles.title2),
                      const SizedBox(height: TSizes.sizeBoxHeight10),
                      Obx(() => _buildRowWithRadio(
                          'Tiền mặt', 0, controller.selectedOptions.value)),
                      const SizedBox(height: TSizes.sizeBoxHeight4),
                      Obx(() => _buildRowWithRadio('Ví điện tử MoMo', 1,
                          controller.selectedOptions.value))
                    ],
                  ),
                ),
                CustomButton(
                    text: 'Xác nhận thanh toán',
                    onPressed: controller.handlePayment)
              ],
            )),
      ),
    );
  }

  Widget _buildRowWithRadio(String text, int value, int groupValue) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: controller.selectedOptions.value,
            onChanged: (value) {
              controller.onChangePaymentType(value!.toInt());
            },
            activeColor: TColors.greenPrimary,
          ),
          const SizedBox(width: TSizes.spacing8),
          Text(text)
        ],
      ),
    );
  }
}
