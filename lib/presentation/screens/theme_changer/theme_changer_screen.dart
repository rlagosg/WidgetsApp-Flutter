import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarckMode = ref.watch(isDarckmodeProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
            //icon: const Icon( Icons.light_mode_outlined ),
            icon: Icon( isDarckMode ? Icons.dark_mode_outlined :Icons.light_mode_outlined ),
            onPressed: (){
              ref.read(isDarckmodeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch( selectedColorProvider );

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {

        final Color color = colors[index];

        return RadioListTile(
         title: Text('Este color', style:  TextStyle( color: color )),
          subtitle: Text('${ color.value }'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor,//selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;
            //ref.watch( themeNotifierProvider.notifier )
             // .changeColorIndex(index);
          }, 
        );
      }
    );
  }
}