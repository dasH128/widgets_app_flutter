import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/configs/app_theme.dart';

final darkModeProvider = StateProvider<bool>((ref) => false);

final colorListProvider = Provider<List<Color>>((ref) => colorList);

final colorSelectedProvider = StateProvider<int>((ref) => 0);
