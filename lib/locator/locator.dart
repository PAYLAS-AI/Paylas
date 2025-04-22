
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:paylas/tools/screen_sizes.dart';
import '/firebase_options.dart';

GetIt locator = GetIt.instance ;


Future<void> getitSetup() async {
  locator.registerLazySingleton(() => ScreenSizes(),);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}