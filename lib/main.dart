import 'app_config/app_config.dart';
import 'bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    firebaseInitialization: () async {
      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );
    },
    flavorConfiguration: () async {
      AppConfig.configDev();
    },
  );
}