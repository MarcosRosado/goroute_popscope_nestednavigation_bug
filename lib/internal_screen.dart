import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InternalScreen extends StatefulWidget {
  const InternalScreen({super.key});

  @override
  State<InternalScreen> createState() => _InternalScreenState();
}

class _InternalScreenState extends State<InternalScreen> {

  void _handleBackButton() {
    print('Called back button on internal screen');
    context.go('/shell-home');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _handleBackButton(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/shell-home');
                },
                child: const Text('Navigate to Shell Home'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
