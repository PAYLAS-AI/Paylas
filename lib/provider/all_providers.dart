

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/model/categoryby.dart';

final selectedNavigationIndexProvider = StateProvider<int>((ref) => 0,);

final selectedCategoryProvider = StateProvider<CategoryBy>((ref) => CategoryBy.all);