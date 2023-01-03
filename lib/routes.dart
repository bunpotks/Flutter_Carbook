import 'package:carbook/screens/book_trip/booktrip_1.dart';
import 'package:carbook/screens/passenger_detail/passenger_detail.dart';
import 'package:carbook/screens/sumary/components/sumary_success.dart';
import 'package:carbook/screens/sumary/sumary_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:carbook/screens/cart/cart_screen.dart';
import 'package:carbook/screens/complete_profile/complete_profile_screen.dart';
import 'package:carbook/screens/details/details_screen.dart';
import 'package:carbook/screens/forgot_password/forgot_password_screen.dart';
import 'package:carbook/screens/home/home_screen.dart';
import 'package:carbook/screens/login_success/login_success_screen.dart';
import 'package:carbook/screens/otp/otp_screen.dart';
import 'package:carbook/screens/profile/profile_screen.dart';
import 'package:carbook/screens/sign_in/sign_in_screen.dart';
import 'package:carbook/screens/splash/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'package:carbook/screens/home/components/catFlash/catgories_flash.dart';
import 'package:carbook/screens/message/components/message_datail.dart';
import 'package:carbook/screens/photoview/photoview_screen.dart';
import 'package:carbook/screens/blank/blank_screen.dart';
import 'package:carbook/screens/passenger_profile/passengerprofille_screen.dart';
import 'package:carbook/screens/booking/booking_screen.dart';
import 'package:carbook/screens/coupon/coupon_screen.dart';
import 'package:carbook/screens/history/history_screen.dart';
import 'package:carbook/screens/passenger_detail/passenger_detail.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CatgoriesFlashScreen.routeName: (context) => CatgoriesFlashScreen(),
  MessageDetail.routeName: (context) => MessageDetail(),
  PhotoViewScreen.routeName: (context) => PhotoViewScreen(),
  BlankScreen.routeName: (context) => BlankScreen(),
  PassengerProfileScreen.routeName: (context) => PassengerProfileScreen(),
  BookingScreen.routeName: (context) => BookingScreen(),
  CouponScreen.routeName: (context) => CouponScreen(),
  HistoryScreen.routeName: (context) => HistoryScreen(),
  PassengerDetail.routeName: (context) => PassengerDetail(),
  BookTrip1Screen.routeName: (context) => BookTrip1Screen(),
  SumaryScreen.routeName: ((context) => SumaryScreen()),
  SummarySuccess.routeName: ((context) => SummarySuccess())
};
