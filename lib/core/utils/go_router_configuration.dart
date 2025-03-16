import 'package:go_router/go_router.dart';
import 'package:lighthouse_web_app/features/auth/presentation/view/change_password_page.dart';
import 'package:lighthouse_web_app/features/auth/presentation/view/login_page.dart';
import 'package:lighthouse_web_app/features/navigation_screen/presentation/view/main_screen_page.dart';
import 'package:lighthouse_web_app/features/navigation_screen/presentation/widget/side_menu.dart';
import 'package:lighthouse_web_app/features/welcome_page/presentation/view/welcome_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => NavigationScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/change-password',
      builder: (context, state) => ChangePasswordPage(),
    ),
    GoRoute(
      path: '/side-menu',
      builder: (context, state) => SideMenu(context: context,),
    ),
    GoRoute(
      path: '/main-screen',
      builder: (context, state) => NavigationScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => WelcomePage(),
    ),
  ],
);