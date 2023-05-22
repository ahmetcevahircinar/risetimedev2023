import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:risetimedev2023/Screens/Welcome/welcome_screen.dart';
import 'package:risetimedev2023/constants.dart';
import 'package:risetimedev2023/pages/adsensesView.dart';
import 'package:risetimedev2023/pages/dailydatasView.dart';
import 'package:risetimedev2023/pages/domainFirmsView.dart';
import 'package:risetimedev2023/pages/domainsView.dart';
import 'package:risetimedev2023/pages/hostingsView.dart';
import 'package:risetimedev2023/pages/settingsView.dart';
import 'package:risetimedev2023/providers/domainfirms_provider.dart';
import 'package:risetimedev2023/screens/adminlogin/adminlogin_screen.dart';
import 'package:risetimedev2023/screens/login/login_screen.dart';
import 'package:risetimedev2023/screens/seotalep/seotalep_screen.dart';
import 'package:risetimedev2023/screens/signup/signup_screen.dart';
import 'package:risetimedev2023/services/auth/auth_methods.dart';
import 'package:risetimedev2023/services/domainfirms/firestore_domainfirms_service.dart';
import 'package:risetimedev2023/translations/codegen_loader.g.dart';
import 'package:risetimedev2023/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'notifiers/menu_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FlutterFireAuthService>(
            create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<FlutterFireAuthService>().authStateChanges,
            initialData: null,
          ),
          Provider<FirestoreDomainFirmsService>(
            create: (_) => FirestoreDomainFirmsService(),
          ),
          ChangeNotifierProvider(create: (context) => DomainFirmsProvider()),
          StreamProvider(
            create: (context) =>
                context.read<FirestoreDomainFirmsService>().getDomainFirms(),
            initialData: null,
          ),
          ChangeNotifierProvider(create: (context) => MenuDrawerNotifier()),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: LocaleKeys.appname.tr(),
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: WelcomeScreen(),
          routes: {
            "home": (_) => WelcomeScreen(),
            "signup": (_) => SignUpScreen(),
            "login": (_) => LoginScreen(),
            "seotalep": (_) => SeoTalepScreen(),
            "adminlogin": (_) => AdminLoginScreen(),
            "domainfirms": (_) => DomainFirmsView(),
            "domains": (_) => DomainsView(),
            "hostings": (_) => HostingsView(),
            "adsenses": (_) => AdsensesView(),
            "dailydatas": (_) => DailyDatasView(),
            "settings": (_) => SettingsView(),
          },
        ));
  }
}
