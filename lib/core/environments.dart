import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Future<void> initializeEnvironment(String environment) async {
    switch (environment) {
      case 'dev':
        await loadEnvFile(env: environment);
        break;
      default:
        await loadEnvFile();
        break;
    }
  }

  Future<void> loadEnvFile({String env = 'dev'}) async =>
      await dotenv.load(fileName: 'environments/.env.$env');
}
