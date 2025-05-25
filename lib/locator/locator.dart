
import 'package:get_it/get_it.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/past_job/past_job_service.dart';
import 'package:paylas/services/user/user_service.dart';
import 'package:paylas/tools/screen_sizes.dart';


GetIt locator = GetIt.instance ;


void getitSetup()  {
  locator.registerLazySingleton(() => ScreenSizes(),);
  locator.registerLazySingleton(() => JobService(),);
  locator.registerLazySingleton(() => PastJobService(),);
  locator.registerLazySingleton(()=> UserService());

}