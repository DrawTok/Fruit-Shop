import 'package:fruitshop/controllers/bottom_bar/bottom_bar_binding.dart';
import 'package:fruitshop/controllers/home/home_binding.dart';
import 'package:fruitshop/controllers/signin/signin_binding.dart';
import 'package:fruitshop/controllers/signup/signup_binding.dart';
import 'package:fruitshop/screens/category/category.dart';
import 'package:fruitshop/screens/home/home.dart';
import 'package:fruitshop/screens/profile/profile.dart';
import 'package:fruitshop/screens/profile/widgets/purchase_history.dart';
import 'package:fruitshop/screens/signin/sign_in.dart';
import 'package:fruitshop/screens/signup/sign_up.dart';
import 'package:fruitshop/widgets/bottom_bar.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const initial = '/signUp';
  static const initialHome = '/bottomBar';

  static final routes = [
    GetPage(
        name: '/signUp', page: () => const SignUp(), binding: SignUpBinding()),
    GetPage(
        name: '/signIn', page: () => const SignIn(), binding: SignInBinding()),
    GetPage(
        name: '/bottomBar',
        page: () => const BottomBar(),
        binding: BottomBarBinding()),
    GetPage(name: '/home', page: () => const Home(), binding: HomeBinding()),
    GetPage(name: '/category', page: () => const Category()),
    GetPage(
        name: '/profile',
        page: () => const Profile()),

    GetPage(
        name: '/purchase',
        page: () => const PurchaseHistory()),
  ];
}
