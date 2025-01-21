class Environment {
  static const String dev = 'development';
  static const String prod = 'production';

  static const String currentEnvironment = dev;

  static String get apiUrl {
    switch (currentEnvironment) {
      case dev:
        return 'https://api.themoviedb.org/3/';
      case prod:
        return 'https://api.themoviedb.org/3/';
      default:
        return 'https://api.themoviedb.org/3/';
    }
  }
}
