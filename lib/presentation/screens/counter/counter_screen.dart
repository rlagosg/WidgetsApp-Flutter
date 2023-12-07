import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarckMode = ref.watch(isDarckmodeProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            //icon: const Icon( Icons.light_mode_outlined ),
            icon: Icon( isDarckMode ? Icons.dark_mode_outlined :Icons.light_mode_outlined ),
            onPressed: (){
              ref.read(isDarckmodeProvider.notifier).update((state) => !state);
            },
          ),
        ],
        title: const Text("Counter Screen"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Valor: $clickCounter", style: const TextStyle( fontSize: 25),),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () { 
          // 1er forma:
          ref.read( counterProvider.notifier ).state++;  
          //
          // 2da forma:
          //ref.read( counterProvider.notifier ).update((state) => state+1);         
         },
      ),
    );
  }
}