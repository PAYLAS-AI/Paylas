
import 'package:get_it/get_it.dart';
import 'package:paylas/services/job/job_service.dart';
import 'package:paylas/services/job_admin_control_request/job_admin_control_request_service.dart';
import 'package:paylas/services/job_report_request/job_report_request_service.dart';
import 'package:paylas/services/past_job/past_job_service.dart';
import 'package:paylas/services/url_launcher/launcher_service.dart';
import 'package:paylas/services/user/user_service.dart';
import 'package:paylas/tools/screen_sizes.dart';


GetIt locator = GetIt.instance ;


void getitSetup()  {
  locator.registerLazySingleton(() => ScreenSizes(),);
  locator.registerLazySingleton(() => JobService(),);
  locator.registerLazySingleton(() => PastJobService(),);
  locator.registerLazySingleton(() => JobAdminControlRequestService());
  locator.registerLazySingleton(() => JobReportRequestService());
  locator.registerLazySingleton(()=> UserService());
  locator.registerLazySingleton(() => UrlLauncherService());



}