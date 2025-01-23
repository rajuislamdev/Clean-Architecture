import 'package:clean_mvvm/core/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginViewModelProvider);
    return Scaffold(
      body: loginState.when(
        initial: () => Center(
          child: Text('Enter credentials'),
        ),
        loading: () => CustomLoader(),
        success: (data) => Text(data.name),
        error: (failure) => Text(failure.message),
      ),
    );
  }
}
