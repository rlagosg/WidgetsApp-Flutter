import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutables, Provider => valores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean, StateProvider => para mentener una pieza de estado
final isDarckmodeProvider = StateProvider((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo Apptheme (custom)
// StateNotifierProvider => para mantener objetos elaborados
final themeNotifierProvider = 
  StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme>{
  ThemeNotifier(): super(AppTheme()); 

  void toggleDarkmode(){
    state = state.copyWith(isDarkmode: !state.isDarckMode);
  }

  void changeColorIndex(int index){
    state = state.copyWith(selectedColor: index);
  }
}