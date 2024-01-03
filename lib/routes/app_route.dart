import 'package:go_router/go_router.dart';
import 'package:youtube_clone/presentation/screen.dart/SplashScreen.dart';
import 'package:youtube_clone/routes/notFoundScreen.dart';

class AppRoutes {
  static final _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            name: 'splash',
            builder: (context, state) {
              return const SplashScreen();
            })
      ],
      errorBuilder: (context, state) {
        return const NotFoundScreen();
      });

  static GoRouter get router => _router;
}
