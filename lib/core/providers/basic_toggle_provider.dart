import 'package:flutter_riverpod/flutter_riverpod.dart';

final basicToggleProvider = StateProvider.family<bool, String>((ref, name) => false);