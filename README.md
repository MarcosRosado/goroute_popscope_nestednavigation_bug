# test_go_route

This project shows the unintended behaviour of the 'go_router' package when using the ShellRoute.
On version 12.1.3 of the package the following behaviour occurs:
- When using the PopScope inside a ShellRoute, the route on the current rendered route (inside the ShellRoute) is called.

Now after 14.6.1 onwards, the following behaviour occurs:
- The PopScope on the routes inside the shellRoute never gets called, only a PopScope inside the ShellRoute main widget gets called.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
