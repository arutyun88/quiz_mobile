import 'package:quiz_mobile/config/environment/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnvironmentStorage {
  final SharedPreferences _prefs;

  EnvironmentStorage({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  Future<Environment> saveEnvironment(Environment newEnvironment) async {
    await _prefs.setString('environment', newEnvironment.name);
    return await loadEnvironment();
  }

  Future<Environment> loadEnvironment() async {
    return Environment.fromName(_prefs.getString('environment')) ?? Environment.prod;
  }
}
