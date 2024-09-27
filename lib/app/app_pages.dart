import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/about_us/bindings.dart';
import 'package:restaurant_template/app/modules/about_us/about_us_view.dart';
import 'package:restaurant_template/app/modules/cart/bindings.dart';
import 'package:restaurant_template/app/modules/cart/view_cart.dart';
import 'package:restaurant_template/app/modules/contact_us/bindings.dart';
import 'package:restaurant_template/app/modules/contact_us/view_contact.dart';
import 'package:restaurant_template/app/modules/dashboard/bindings.dart';
import 'package:restaurant_template/app/modules/dashboard/dashboard_view.dart';
import 'package:restaurant_template/app/modules/login_screen/bindings.dart';
import 'package:restaurant_template/app/modules/login_screen/login_view.dart';
import 'package:restaurant_template/app/modules/menu/bindings.dart';
import 'package:restaurant_template/app/modules/menu/view_menu.dart';
import 'package:restaurant_template/app/modules/onboarding/binding.dart';
import 'package:restaurant_template/app/modules/onboarding/view_onboarding.dart';
import 'package:restaurant_template/app/modules/reservation/bindings.dart';
import 'package:restaurant_template/app/modules/reservation/view/confirm_view.dart';
import 'package:restaurant_template/app/modules/reservation/view/reservation_view.dart';
import 'package:restaurant_template/app/modules/reservation/view/success_view.dart';
import 'package:restaurant_template/app/modules/signup_screen/bindings.dart';
import 'package:restaurant_template/app/modules/signup_screen/signup_view.dart';
import 'package:restaurant_template/app/modules/splash_screen/bindings.dart';
import 'package:restaurant_template/app/modules/splash_screen/splash_view.dart';
import 'package:restaurant_template/app/modules/after_login/bookings/bindings.dart';
import 'package:restaurant_template/app/modules/after_login/bookings/bookings_view.dart';
import 'package:restaurant_template/app/modules/after_login/offers/bindings.dart';
import 'package:restaurant_template/app/modules/after_login/offers/offers_view.dart';
import 'package:restaurant_template/app/modules/after_login/orders/bindings.dart';
import 'package:restaurant_template/app/modules/after_login/orders/orders_view.dart';
import 'package:restaurant_template/app/modules/after_login/profile/bindings.dart';
import 'package:restaurant_template/app/modules/after_login/profile/profile_view.dart';

class AppPages {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteName.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.menu,
      page: () => const MenuScreen(),
      binding: MenuBookBinding(),
    ),
    GetPage(
      name: RouteName.reservations,
      page: () => ReservationScreen(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: RouteName.reservationsConfirm,
      page: () => const ReservationConfirmScreen(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: RouteName.reservationsSuccess,
      page: () => const ReservationSuccessScreen(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: RouteName.aboutUs,
      page: () => const InfoScreen(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: RouteName.contact,
      page: () => const ContactScreen(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: RouteName.cart,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RouteName.signup,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: RouteName.bookings,
      page: () => const BookingsScreen(),
      binding: BookingsBindings(),
    ),
    GetPage(
      name: RouteName.offers,
      page: () => const OffersScreen(),
      binding: OffersBindings(),
    ),
    GetPage(
      name: RouteName.orders,
      page: () => const OrdersScreen(),
      binding: OrdersBindings(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBindings(),
    ),
  ];
}

class RouteName {
  static const String splash = "/splash";
  static const String dashboard = "/dashboard";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String menu = "/menu";
  static const String reservations = "/reservations";
  static const String reservationsConfirm = "/reservationsConfirm";
  static const String reservationsSuccess = "/reservationsSuccess";
  static const String aboutUs = "/aboutUs";
  static const String contact = "/contact";
  static const String cart = "/cart";
  static const String onboarding = "/onboarding";
  static const String offers = "/offers";
  static const String bookings = "/bookings";
  static const String orders = "/orders";
  static const String profile = "/profile";
}
