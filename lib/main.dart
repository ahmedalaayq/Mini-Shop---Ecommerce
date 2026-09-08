import 'package:flutter/material.dart';
import 'package:mini_shop/core/helpers/init_core_functions.dart';

import 'mini_shop.dart';

void main() async {
  await initCoreFunctions();
  runApp(const MiniShop());
}
