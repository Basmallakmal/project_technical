class Environments {
  static const String LOCAL = 'local';
  static const String DEV = 'dev';
  static const String QAS = 'QAS';
  static const String PRODUCTION = 'prod';
}

class EnvironmentDetails {
  String env;
  String url;
  String urlMedia;

  EnvironmentDetails({
    required this.env,
    required this.url,
    required this.urlMedia,
  });
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.PRODUCTION;
  static final List<EnvironmentDetails> _availableEnvironments = [
    EnvironmentDetails(
      env: Environments.LOCAL,
      url: '',
      urlMedia: '',
    ),
    EnvironmentDetails(
      env: Environments.DEV,
      url: 'https://jsonplaceholder.typicode.com/',
      urlMedia: '',
    ),
    EnvironmentDetails(
      env: Environments.QAS,
      url: '',
      urlMedia: '',
    ),
    EnvironmentDetails(
      env: Environments.PRODUCTION,
      url: 'https://jsonplaceholder.typicode.com/',
      urlMedia: '',
    ),
  ];

  static List<EnvironmentDetails> get availableEnvironments =>
      _availableEnvironments;

  static EnvironmentDetails getEnvironments() {
    return _availableEnvironments.firstWhere(
          (d) => d.env == _currentEnvironments,
    );
  }
}