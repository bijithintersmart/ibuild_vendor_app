import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/utils/app_utils/error_handler.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/api_timeout_screen.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/app_error_handler_widget.dart';
import 'package:ibuild_vendor/core/utils/local_storage/global_local_storage.dart';
import 'package:ibuild_vendor/core/utils/local_storage/keys.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../../features/features.dart';
import '../utils/services/global_network_service.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<StatefulNavigationShellState>();
final scaffoldKey = GlobalKey<ScaffoldState>();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final PersistentTabController navController =
    PersistentTabController(initialIndex: 0);
int bookingTabNotifier = 0;
FTabController? tabController;
void resetNavigationToHome() {
  if (shellNavigatorKey.currentState != null) {
    shellNavigatorKey.currentState!.goBranch(0, initialLocation: true);
  }
}

abstract class Routes {
  static const String ABOUT = '/about';
  static const String API_TIMEOUT_ERROR = '/api-timeout-error';
  static const String BOOKING = '/booking';
  static const String BOOKING_DATE = '/booking-date';
  static const String CONTACT_US = '/contact-us';
  static const String DETAILS = '/details';
  static const String EDIT_PROFILE = '/edit-profile';
  static const String EQUIPMENTS = '/equipments';
  static const String ERROR = '/error';
  static const String FORCE_UPDATE = '/force-update';
  static const String FORGOT = '/forgot';
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String MAINTENACE = '/maintenace';
  static const String MY_ADDRESS = '/my-address';
  static const String NOT_INTERNET = '/no-internet';
  static const String ONBOARDING = '/onboarding';
  static const String PRIVACY = '/privacy';
  static const String PROFILE = '/profile';
  static const String REGISTER = '/register';
  static const String RESET_PASSWORD = '/reset-password';
  static const String RESET_SUCCESS = '/reset-success';
  static const String SAVE_ADDRESS = '/save-address';
  static const String SKELETON = '/skeleton';
  static const String SPLASH = '/splash';
  static const String TERMS = '/terms';
  static const String VERIFY_OTP = '/verify-otp';
  static const String REGISTER_EQUIPMENT = '/register-equipment';
  static const String ADD_EQUIPMENT = '/add-equipment';
}

Future<bool> _authStatus() async {
  final authToken =
      GlobalLocalStorage().getString(GlobalLocalStorageKeys.AUTH_TOKEN);
  return authToken != null;
}

class AppRouter {
  static final GoRouter router = GoRouter(
    observers: [routeObserver],
    navigatorKey: navigatorKey,
    initialLocation: Routes.SKELETON,
    errorBuilder: (context, state) => ErrorScreen(
      errorData: ErrorData(
        error: state.error,
        errorType: "Navigation Error",
      ),
    ),
    redirect: (context, state) async {
      /*
      if (kReleaseMode) {
        final auth = await _authStatus();
        final isPublicRoute = {
          Routes.SPLASH,
          Routes.ONBOARDING,
          Routes.LOGIN,
          Routes.REGISTER,
          Routes.FORGOT,
          Routes.RESET_PASSWORD,
          Routes.RESET_SUCCESS,
          Routes.VERIFY_OTP,
          Routes.NOT_INTERNET,
          Routes.API_TIMEOUT_ERROR,
          Routes.ERROR,
          Routes.PRIVACY,
          Routes.TERMS,
        }.contains(state.matchedLocation);
        if (!auth && !isPublicRoute) return Routes.LOGIN;
      }
      */
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.SPLASH,
        name: Routes.SPLASH,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.LOGIN,
        name: Routes.LOGIN,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.REGISTER,
        name: Routes.REGISTER,
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: Routes.FORGOT,
        name: Routes.FORGOT,
        builder: (_, __) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.RESET_PASSWORD,
        name: Routes.RESET_PASSWORD,
        builder: (_, __) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: Routes.RESET_SUCCESS,
        name: Routes.RESET_SUCCESS,
        builder: (_, __) => const ResetPasswordSuccessScreen(),
      ),
      GoRoute(
        path: Routes.VERIFY_OTP,
        name: Routes.VERIFY_OTP,
        builder: (_, state) => VerifyOtpScreen(
          email: state.extra as String,
        ),
      ),
      GoRoute(
        path: Routes.SKELETON,
        name: Routes.SKELETON,
        builder: (_, state) => Skelton(
          controller: navController,
        ),
      ),
      GoRoute(
        path: Routes.EQUIPMENTS,
        name: Routes.EQUIPMENTS,
        builder: (_, state) => const EquipmentScreen(),
      ),
      GoRoute(
        path: Routes.DETAILS,
        name: Routes.DETAILS,
        builder: (_, state) => const EquipmentDetailsPage(),
      ),
      GoRoute(
        path: Routes.BOOKING_DATE,
        name: Routes.BOOKING_DATE,
        builder: (_, state) => const BookingDatePickerScreen(),
      ),
      GoRoute(
        path: Routes.BOOKING,
        name: Routes.BOOKING,
        builder: (_, state) => const BookingScreen(),
      ),
      GoRoute(
        path: Routes.HOME,
        name: Routes.HOME,
        builder: (_, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.REGISTER_EQUIPMENT,
        name: Routes.REGISTER_EQUIPMENT,
        builder: (_, state) => const RegisterEquipment(),
      ),
      GoRoute(
        path: Routes.ADD_EQUIPMENT,
        name: Routes.ADD_EQUIPMENT,
        builder: (_, state) => const AddEquipmentScreen(),
      ),
      GoRoute(
        path: Routes.PROFILE,
        name: Routes.PROFILE,
        builder: (_, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.EDIT_PROFILE,
        name: Routes.EDIT_PROFILE,
        builder: (_, __) => const EditProfile(),
      ),
      GoRoute(
        path: Routes.MY_ADDRESS,
        name: Routes.MY_ADDRESS,
        builder: (_, __) => const MyAddress(),
      ),
      GoRoute(
        path: Routes.SAVE_ADDRESS,
        name: Routes.SAVE_ADDRESS,
        builder: (_, __) => const SaveAddressScreen(),
      ),
      GoRoute(
        path: Routes.NOT_INTERNET,
        builder: (_, __) => const NoInternetScreen(),
      ),
      GoRoute(
        path: Routes.ERROR,
        builder: (_, state) => ErrorScreen(errorData: state.extra as ErrorData),
      ),
      GoRoute(
        path: Routes.API_TIMEOUT_ERROR,
        builder: (_, state) => const ApiTimeoutErrorScreen(),
      ),
    ],
  );

  static final _service = GlobalNetworkService();

  static void initialize() {
    _service.initialize(router);
  }

  static NetworkCubit get networkCubit => _service.networkCubit;
}
