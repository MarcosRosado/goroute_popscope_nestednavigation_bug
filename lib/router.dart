import 'package:go_router/go_router.dart';
import 'package:test_go_route/shell_router.dart';


final router = GoRouter(
  initialLocation: '/shell-home',
  routes: [
    ...appBranches
  ],
);