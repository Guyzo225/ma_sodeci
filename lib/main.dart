import 'package:flutter/material.dart';
import 'package:sodeci_mobile/ui/accueil/accueil_page.dart';
import 'package:sodeci_mobile/ui/connexion/inscription_page.dart';
import 'package:sodeci_mobile/ui/connexion/login_page.dart';
import 'package:sodeci_mobile/ui/connexion/mot_de_passe_oublie_page.dart';
import 'package:sodeci_mobile/ui/contact/contact_page.dart';
import 'package:sodeci_mobile/ui/contact/ecrivez_nous_page.dart';
import 'package:sodeci_mobile/ui/incident/incident_reseau_form_page.dart';
import 'package:sodeci_mobile/ui/incident/incident_reseau_page.dart';
import 'package:sodeci_mobile/ui/incident/signaler_incident_page.dart';
import 'package:sodeci_mobile/ui/infos_utiles/assistance_evenemen_page.dart';
import 'package:sodeci_mobile/ui/infos_utiles/cadre_institutionnel_page.dart';
import 'package:sodeci_mobile/ui/infos_utiles/infos_utile_content_page.dart';
import 'package:sodeci_mobile/ui/infos_utiles/infos_utiles_page.dart';
import 'package:sodeci_mobile/ui/mon_compteur/mon_compteur_info_page.dart';
import 'package:sodeci_mobile/ui/mon_compteur/mon_compteur_page.dart';
import 'package:sodeci_mobile/ui/reseau_agence/reseau_agence.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_facture_info_dialog.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_facture_page.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_page.dart';
import 'package:sodeci_mobile/ui/splash/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:catcher/catcher_plugin.dart';


void main() => runApp(MyApp());

/*void main() {
  CatcherOptions debugOptions =
  CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["thibaut.kouadio@smile.ci"])
  ]);

  Catcher(MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  List<Widget> pages = [
    SplashPage(),
    AccueilPage(),
    InfosUtilesPage(),
    InfosUtilesContentPage(),
    AssistanceEvenementPage(),
    CadreInstitutionnelPage(),
    LoginPage(),
    InscriptionPage(),
    MotDePasseOubliePage(),
    ContactPage(),
    EcrivezNousPage(),
    ReseauAgence(),
  ];

  List<Widget> pages2 = [
    SignalerIncidentPage(),
    IncidentReseauPage(),
    IncidentReseauFormPage(),
    SimulationPage(),
    SimulationFacturePage(),
    SimulationFactureInfoDialog(),
    MonCompteurPage(),
    MonCompteurInfoPage(),
  ];

  static Map<int, Color> color =
  {
    50:Color.fromRGBO(0,165,75, .1),
    100:Color.fromRGBO(0,165,75, .2),
    200:Color.fromRGBO(0,165,75, .3),
    300:Color.fromRGBO(0,165,75, .4),
    400:Color.fromRGBO(0,165,75, .5),
    500:Color.fromRGBO(0,165,75, .6),
    600:Color.fromRGBO(0,165,75, .7),
    700:Color.fromRGBO(0,165,75, .8),
    800:Color.fromRGBO(0,165,75, .9),
    900:Color.fromRGBO(0,165,75, 1),
  };

  MaterialColor colorCustom = MaterialColor(0xFF00A54B, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SODECI Mobile',
      navigatorKey: Catcher.navigatorKey,
      theme: ThemeData(
        primarySwatch: colorCustom,
        fontFamily: "Myriad"
      ),
      debugShowCheckedModeBanner: false,
      //home: AccueilConnectePage(),
      home: SplashPage(),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr','FR'), // English
        // ... other locales the app supports
      ],
    );
  }
}
