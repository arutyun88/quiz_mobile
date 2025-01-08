enum Environment {
  dev(name: 'develop', serverUrl: 'http://localhost:8081/api'),
  prod(name: 'production', serverUrl: '');

  final String name;
  final String serverUrl;

  const Environment({
    required this.name,
    required this.serverUrl,
  });

  static Environment? fromName(String? name) {
    for (var environment in Environment.values) {
      if (environment.name == name) {
        return environment;
      }
    }
    return null;
  }
}
