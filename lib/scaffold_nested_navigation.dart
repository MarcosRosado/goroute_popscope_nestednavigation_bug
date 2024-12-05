import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
    required this.goRouterState,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final Widget navigationShell;
  final GoRouterState goRouterState;

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;

  void _goBranch(int index) {
    setState(() {
      this.index = index;
    });
    if (index == 0) {
      context.go('/main-services');
    } else if (index == 1) {
      context.go('/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// You can remove this pop scope,
    /// the ones inside the home screen and internal screen will never be called.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        print('Called pop on ShellRoute page');
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: widget.navigationShell,
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          selectedIndex: index,
          destinations: const [
            NavigationDestination(
                label: 'Início', icon: Icon(Icons.home_outlined)),
            NavigationDestination(
                label: 'Perfil', icon: Icon(Icons.person_outline)),
            NavigationDestination(label: 'Menu', icon: Icon(Icons.menu)),
          ],
          onDestinationSelected: (index) {
            _goBranch(index);
          },
        ),
      ),
    );
  }
}
