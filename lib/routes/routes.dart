import 'package:fruitshop/controllers/signin/signin_binding.dart';
import 'package:fruitshop/screens/signin/sign_in.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const initial = '/onboarding';
  static const initialHome = '/signIn';

  static final routes = [
    //GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
    //GetPage(name: '/start', page: () => const StartScreen()),
    /* GetPage(
        name: '/signUp', page: () => const SignUp(), binding: SignUpBinding()), */
    GetPage(
        name: '/signIn',
        page: () => const SignIn(),
        binding: SignInBinding()),
    //GetPage(name: '/otp', page: () => const OTPScreen()),
  ];
}
