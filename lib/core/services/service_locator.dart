import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/cashe_helper.dart';

final sl = GetIt.instance;

void setUp(){
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}