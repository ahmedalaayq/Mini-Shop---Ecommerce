import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mini_shop/core/helpers/init_core_functions.dart';
import 'package:mini_shop/core/networking/session_manager_impl.dart';

import 'mini_shop.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCoreFunctions();

  final sessionManager = SessionManagerImpl(storage: FlutterSecureStorage());

  final hasSession = await sessionManager.hasSession();

  runApp(MiniShop(hasSession: hasSession));
}
