import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarckmodeProvider = StateProvider((ref) => false);

// Listado de colores inmutables
final colorListProvider = StateProvider((ref) => colorList);
final selectedColorProvider = StateProvider((ref) => 0);