import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {

  //con riverpod
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );

  //sin riverpod
  //runApp(const MainApp());
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final int selectedColor = ref.watch( selectedColorProvider );
    final bool isDarckMode = ref.watch(isDarckmodeProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(
        selectedColor: selectedColor,
        isDarckMode: isDarckMode
      ).getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
