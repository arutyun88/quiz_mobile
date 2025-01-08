import 'package:get_it/get_it.dart';
import 'package:quiz_mobile/config/environment/environment_provider.dart';
import 'package:quiz_mobile/config/environment/environment_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'environment_di.dart';

final getIt = GetIt.instance;

Future<void> initDi() async {
  await _initEnvironmentDi();

  await getIt.allReady();
}
