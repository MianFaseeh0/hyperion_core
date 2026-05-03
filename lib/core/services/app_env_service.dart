import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/app_assets.dart';

class AppEnvService {
  static Future<void> initializeEnv() async{
    print('env init start');
    await dotenv.load(fileName: AppAssets.customerEnv);
    print('env init complete');

  }
  static String get googleMapsAPIKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
}