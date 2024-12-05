import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_go_route/internal_screen.dart';

import 'package:test_go_route/scaffold_nested_navigation.dart';

import 'home_screen.dart';

/// handles the internal routes of the app, each starting branch refers to a module.
List<RouteBase> appBranches = [
  /**
   * ShellRoute is a route that can have multiple branches.
   * This is useful when you want to have a bottom navigation bar, or a navigation drawer with multiple navigators.
   *
   * the scaffoldWithNestedNavigation is a custom widget that has a bottom navigation, it takes route from the
   * navigator shell and shows the current route as the body of the scaffold.
   */
  ShellRoute(
    pageBuilder: (context, state, child) {
      return MaterialPage(
        child: ScaffoldWithNestedNavigation(navigationShell: child, goRouterState: state)
      );
    },
    routes:
    [
      /**
       * This is the main navigation of the app, it contains the main pages of the app, such as home and profile.
       * Routes can be nested, and can be accessed using the context.go() methods or the context.goBranch() to switch between branches.
       * Routes can further be nested inside each other, and can be accessed using the context.go() method.
       *
       * To add more branches, add more branches to the branches list.
       * Declare the branches and its routes on its own file under the specific module name under router, and import it here.
       */

      GoRoute(
        path: '/shell-home',
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
      ),

      GoRoute(
        path: '/internal-screen',
        pageBuilder: (context, state) => const MaterialPage(
          child: InternalScreen(),
        ),
      ),
    ],
  ),
];

