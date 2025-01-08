import 'package:flutter/cupertino.dart';
import 'package:quiz_mobile/config/environment/environment.dart';
import 'package:quiz_mobile/config/environment/environment_storage.dart';

class EnvironmentProvider extends ChangeNotifier {
  final EnvironmentStorage _storage;

  EnvironmentProvider({
    required EnvironmentStorage storage,
  }) : _storage = storage;

  Environment _environment = Environment.prod;

  Environment get environment => _environment;

  Future<void> loadEnvironment() async {
    _environment = await _storage.loadEnvironment();
    notifyListeners();
  }

  Future<void> saveEnvironment(Environment environment) async {
    await _storage.saveEnvironment(environment);
    _environment = environment;
    notifyListeners();
  }
}
