import 'package:flutter_test/flutter_test.dart';
import 'package:project_i/config.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("check Enviroment production", () {
    String productionENV = Environments.PRODUCTION;
    EnvironmentDetails productionENVDetails = ConfigEnvironments
        .availableEnvironments
        .firstWhere((d) => d.env == productionENV);
    EnvironmentDetails currentENVDetails = ConfigEnvironments.getEnvironments();

    test('config Enviroment should be production', () {
      expect(currentENVDetails.env, productionENV);
    });

    test('url should not empty', () {
      expect(currentENVDetails.url, productionENVDetails.url);
    });

    test('url image should not empty', () {
      expect(currentENVDetails.urlMedia, productionENVDetails.urlMedia);
    });
  });
}
