import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/presentation/screen.dart/add/add_screen.dart';
import 'package:youtube_clone/presentation/screen.dart/bottomBar/bottomBar_screen.dart';
import 'package:youtube_clone/presentation/screen.dart/home/home_screen.dart';
import 'package:youtube_clone/presentation/screen.dart/shorts/shorts_screen.dart';
import 'package:youtube_clone/presentation/screen.dart/splash_screen.dart';
import 'package:youtube_clone/presentation/screen.dart/subscriptions/subsciption_screen.dart';
import 'package:youtube_clone/presentation/screen.dart/video/video_screen.dart';
import 'package:youtube_clone/presentation/screen.dart/you/profile_screen.dart';
import 'package:youtube_clone/routes/navigator_orserver.dart';
import 'package:youtube_clone/routes/route_name.dart';
import 'package:youtube_clone/routes/screen/notFoundScreen.dart';

final _navigatorkey = GlobalKey<NavigatorState>(debugLabel: 'navigator');
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shortsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _addNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _subscribtionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _youNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

class AppRoutes {
  static final _router = GoRouter(
      navigatorKey: _navigatorkey,
      observers: [MyNavigatorObserver()],
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'splash',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SplashScreen());
          },
        ),
        StatefulShellRoute.indexedStack(
            builder: (context, _, shell) => BottomBar(shell: shell),
            branches: [
              StatefulShellBranch(navigatorKey: _homeNavigatorKey, routes: [
                GoRoute(
                    parentNavigatorKey: _homeNavigatorKey,
                    path: '/home',
                    name: RouteNames.home,
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: HomeScreen());
                    },
                    routes: [
                      // GoRoute(
                      //     parentNavigatorKey: _navigatorkey,
                      //     path: 'videoScreen',
                      //     name: RouteNames.videoScreen,
                      //     builder: (context, state) {
                      //       return const VideoScreen();
                      //     })
                    ]),
              ]),
              StatefulShellBranch(navigatorKey: _shortsNavigatorKey, routes: [
                GoRoute(
                    parentNavigatorKey: _shortsNavigatorKey,
                    path: '/shorts',
                    name: RouteNames.shorts,
                    builder: (context, state) {
                      return ShortScreen(
                        index: 0,
                      );
                    })
              ]),
              StatefulShellBranch(navigatorKey: _addNavigatorKey, routes: [
                GoRoute(
                    parentNavigatorKey: _addNavigatorKey,
                    path: '/add',
                    name: RouteNames.add,
                    builder: (context, state) {
                      return const AddScreen();
                    })
              ]),
              StatefulShellBranch(
                  navigatorKey: _subscribtionNavigatorKey,
                  routes: [
                    GoRoute(
                        parentNavigatorKey: _subscribtionNavigatorKey,
                        name: RouteNames.subscibtion,
                        path: '/subscription',
                        builder: (context, state) {
                          return const SubscriptionScreen();
                        })
                  ]),
              StatefulShellBranch(navigatorKey: _youNavigatorKey, routes: [
                GoRoute(
                    parentNavigatorKey: _youNavigatorKey,
                    path: '/you',
                    name: RouteNames.you,
                    builder: (context, state) {
                      return const ProfileScreen();
                    })
              ])
            ])
      ],
      errorBuilder: (context, state) {
        return const NotFoundScreen();
      });

  static GoRouter get router => _router;
}
