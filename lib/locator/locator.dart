
import 'package:get_it/get_it.dart';
import 'package:paylas/tools/screen_sizes.dart';


GetIt locator = GetIt.instance ;


void getitSetup()  {
  locator.registerLazySingleton(() => ScreenSizes(),);

}