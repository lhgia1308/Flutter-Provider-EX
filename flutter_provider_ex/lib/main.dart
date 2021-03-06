import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_provider_ex/controllers/login_controller.dart';
import 'package:flutter_provider_ex/controllers/menu_controller.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';
import 'package:flutter_provider_ex/language_change_provider.dart';
import 'package:provider/provider.dart';
import 'constrants.dart';
import 'routes.dart';
import 'utils/user_simple_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await UserSimplePreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => LanguageChangeProvider()),
        ChangeNotifierProvider(create: (context) => MenuController()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            fontFamily: "Lora",
            scaffoldBackgroundColor: Colors.blueGrey[400],
            primaryColor: Colors.blue,
            textTheme: TextTheme(
              bodyText1: bodyText1,
              //Default bodyText2
              bodyText2: bodyText2,
              caption: caption,
              headline1: headLine1,
              headline4: headLine4,
              headline5: headLine5,
              subtitle1: subTitle1,
              subtitle2: subTitle2,
              button: buttonText,
            ),
            appBarTheme: AppBarTheme(
              color: Colors.amber[600],
            ),
            elevatedButtonTheme: elevatedButtonThemeData,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.loginScreen,
          onGenerateRoute: RouteManager.generateRoute,
        );
      }),
    );
  }
}
