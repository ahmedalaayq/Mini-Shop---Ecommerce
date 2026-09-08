import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> initCoreFunctions() async {
  await dotenv.load(fileName: '.env');
}
