import 'package:flutter/material.dart';

class AppConstant {
  static const USER_LINK = "utilisateur";
  static const USER_LOGIN = "utilisateur_login";
  static const isConnected = "utilisateur_isconnecté";
  static const LAST_SEARCH = "laast_search";
  static const USER_FAV = "utilisateur_fav";
  static const URL_LINK = "url_link";
  static const ALL_BON_REFLEX = "allbonreflexe";
  static const ALL_SERVICE = "allservice";

  static const USERTOCOMMERCANT = 1;
  static const COMMERCANTTOUSER = 2;
  static const USERTOAGENCIER = 3;
  static const AGENCIERTOUSER = 4;
  static const USERTOUSER = 5;

  static const MenutextSize = 15.0;

  static const TOKEN_LINK = "token";

  static const TYPE_ABONNEMENT = "abonnement";
  static const TYPE_REABONNEMENT = "reabonnement";
  static const TYPE_AB_REABONNEMENT = "ab/reabonnement";
  static const TYPE_RESILIATION = "resiliation";
  static const TYPE_BRANCHEMENT = "branchement";

  static const USER_INFO = "utilisateur_info";
  static const USER_INFO_TITLE_DIAMETRE_15 = "CLIENT TRIMESTRIELLE DIAMETRE 15";
  static const USER_INFO_CONTENT_DIAMETRE_15 = "Il s'agit d'un client qui reçoit une facture tous les trois (3) mois soit quatre (4) factures dans l'année. Le diamètre 15 est le plus petit tuyau utilisé pour le branchement des ménages.";
  static const USER_INFO_BOTTOM_DIAMETRE_15 = 'La détermination du montant de la facture à payer se fait sur la base du cubage consommé. Le cubage consommé se détermine par la différence entre "nouvel index" et "ancien index". Ainsi, selon la tranche du cubage (0-9 ou 9-18 ) un montant est fixé comme le montre le tableau ci-dessus';
  static const USER_INFO_TITLE_DIAMETRE_20 = "CLIENT TRIMENSTRIELS DIAMETRE > 20 et plus";
  static const USER_INFO_CONTENT_DIAMETRE_20 = "Il s'agit d'un client qui reçoit une facture tous les trois (3) mois soit qutre (4) factures dans l'année. Le diamètre 20 est installé à la demande du client lors du dépôt du dossier ou à la suite d'une demande de changement de diamètre.";
  static const USER_INFO_BOTTOM_DIAMETRE_20 = 'La détermination du montant de la facture à payer se fait sur la base du cubage consommé. Le cubage consommé se détermine par la différence entre "nouvel index" et "ancien index". Ainsi, selon la tranche du cubage (0-9 ou 9-18 ) un montant est fixé comme le montre le tableau ci-dessus.';

  static const ALL_FACTURE = "all_facture";

  static const URL_FACTURE_DOWNLOAD =
      "https://apinmpfea.sodeci.ci/SODECIEAGENCE_WebApiConsultationDevis/api/devis/Openfacture?NumFacture=";
  static const CONDITION_UTILISATION = """
  TERMES ET CONDITIONS D’UTILISATION DE LA « eAgence SODECI »
TERMES ET CONDITIONS D’UTILISATION DE LA « e-AGENCE SODECI »

Conditions d’accès
En envoyant un courrier électronique à la Société de Distribution d’Eau de la Côte d’Ivoire dénommée ci-après (SODECI) ou en accédant et/ou en utilisant le site web « e-AGENCE SODECI », chaque personne physique ou morale, dénommée ci-après « l'Utilisateur », déclare et garantit qu'elle a pris préalablement connaissance des présentes conditions d’accès, c'est-à-dire des informations légales, des règles applicables à la protection des données à caractère personnel et des conditions d'utilisation et qu'elle en accepte les termes et conditions sans réserve, modification ou restriction.

 

II.      Informations légales

Le présent site web, accessible à partir de l'adresse https : // eagence-sodeci.eu-gb.mybluemix.net/index.php ci-après dénommé « e-AGENCE SODECI » est édité par la Société de Distribution d’Eau de la Côte d’Ivoire,  Société Anonyme avec conseil d’administration dénommée ci-après SODECI et identifiée comme suit :

Abidjan, commune de Treichville 1, Avenue Christiani

01 BP 1843 Abidjan 01 Côte d'Ivoire

RCCM Abidjan n°: CI-ABJ-1962-B-984, CC 01.00.984 A

Capital social : 4 500 000 000 Francs CFA

Téléphone : (+225) 21 23 30 00  

Email : sodeci@sodeci.ci

III.     Protection des données personnelles

Nous recueillons des informations lorsque vous vous inscrivez sur notre site, lorsque vous vous connectez à votre compte, lorsque vous vous connectez à notre site et/ou lorsque vous vous déconnectez. Les informations recueillies incluent votre nom, adresse e-mail, numéro de téléphone, adresse géographique, références client, références contrat, date de naissance, lieu d’établissement de la pièce d’identité, pays d’établissement, raison sociale s’il s’agit d’une société, etc.

En outre, nous recevons et enregistrons automatiquement des informations à partir de votre terminal et de votre navigateur, y compris votre adresse IP, la page que vous demandez.

Toutes les informations que nous recueillons auprès de vous, peuvent être utilisées pour :

· Améliorer le service client et vos besoins de prise en charge ;

· Améliorer notre site Web ;

· Vous contacter par e-mail, téléphone, sms, …

Ces informations sont nécessaires à la SODECI afin de traiter les requêtes des utilisateurs.

Dans l’hypothèse où ceux-ci ne fourniraient pas ces informations, la SODECI ne serait pas en mesure de traiter leurs requêtes.

Vos informations personnelles ne seront pas commercialisées, échangées, transférées, ou données à une autre société pour aucune raison, sans votre consentement, en dehors :

· de ce qui est nécessaire pour répondre aux transactions d’achat d’eau ou de règlement de facture avec les tierces parties de confiance ayant des contrats de confidentialité avec nous et qui nous aident à mener nos affaires ;

· Du respect d’une obligation légale à laquelle la SODECI est soumise ;

· D’une communication aux sociétés du Groupe de la SODECI dans le cadre de leurs affaires.

L’utilisateur dispose de la faculté de s’opposer à cette communication en écrivant à l’adresse centrederelationclient@sodeci.ci.  

Soucieuse de la protection de votre vie privée, la SODECI s'engage à assurer le meilleur niveau de protection de vos données personnelles conformément à la loi n°2013-450 du 19 juin 2013 relative à la protection des données à caractère personnel.

Chaque utilisateur justifiant de son identité peut exiger, dans la limite des obligations légales, que soient, selon les cas, rectifiées, complétées, mises à jour ou effacées les données à caractère personnel le concernant, qui sont inexactes, incomplètes, équivoques, périmées, ou dont l'utilisation ou la conservation serait interdite. Les droits de chaque utilisateur rappelés ci-dessus peuvent s’exercer à l'adresse suivante :

Société de Distribution d’Eau de la Côte d’Ivoire (SODECI)

Centre de  Relation Client au 175 ou à centrederelationclient@sodecici.  

Vous pouvez à tout moment vous désinscrire et ne plus bénéficier de l’ensemble des services des utilisateurs du site web « e-AGENCE SODECI ».

IV. Propriété intellectuelle

Le site web « e-AGENCE SODECI » et chacun des éléments qui le compose, et notamment les textes, articles, lettres d'information, communiqués, présentations, brochures, illustrations, photographies, vidéos, programmes informatiques, animations, etc., sont la propriété intellectuelle exclusive de la SODECI à l'exception des marques de tiers qui pourraient être citées.

La SODECI est propriétaire et détient les droits sur la structure générale du site web « e-AGENCE SODECI », notamment l’arborescence, les logiciels, les textes, les images animées ou non, les graphismes, les sons, et plus généralement tout élément composant le site web de « e-AGENCE SODECI ».

Toute reproduction, représentation, modification, publication, transmission, dénaturation, totale ou partielle du site web de la « e-AGENCE SODECI » ou de son contenu, par quelque procédé que ce soit, et sur quelque support que ce soit est interdite.

Toute exploitation non autorisée du site ou de son contenu ainsi que des informations qui y sont divulguées serait illicite et engagerait la responsabilité de l’utilisateur tel que prévu par les articles 37 et suivants de l'annexe III de l'accord de Bangui du 02 mars 1977, révisé le 24 février 1999, ou tout texte subséquent.

La marque de la SODECI ainsi que les logos figurant sur le site sont des marques déposées. Toute reproduction ou représentation totale ou partielle de ces marques ou de ces logos, seules ou intégrées à d’autres éléments, sans l'autorisation expresse et préalable de la SODECI est prohibée, et engagerait la responsabilité de l’utilisateur.

L’utilisateur s’engage, sous peine de voir sa responsabilité civile et/ou pénale engagée, à ne pas :

· Transmettre par quelque procédé que ce soit (e-mail ou autres), tout contenu incluant des programmes, des codes, des virus, etc. destinés à détruire ou limiter les fonctionnalités du site web « e-AGENCE SODECI » ;

· Transmettre par quelque procédé que ce soit (e-mail ou autres) dans les services interactifs proposés sur le site web « e-AGENCE SODECI », et notamment dans les forums, tout contenu illicite ou nuisible, et notamment des messages à caractère injurieux, insultant, diffamant, dénigrant, dégradant, pornographique ou sans rapport avec les thèmes proposés ;

· Transmettre, par quelque procédé que ce soit, tout contenu violant les droits de propriété intellectuelle, industrielle, les droits de la personnalité, etc.

 · Utiliser le site web à des fins malveillantes et répréhensibles.

La SODECI se réserve le droit, dans le cadre de ses services interactifs, de supprimer immédiatement et sans mise en demeure préalable, tout contenu de quelle que nature que ce soit, et notamment tout message, texte, image ou graphique qui contreviendrait aux lois et règlements en vigueur, notamment les réglementations rappelées ci-dessus.

Dans l’hypothèse où un utilisateur souhaiterait exploiter un des contenus du site web (texte, image, etc.), il s’engage à requérir l’autorisation préalable et écrite de la SODECI, en écrivant ou en utilisant le formulaire de contact.

Néanmoins, la reproduction des textes sur un support papier est notamment autorisée dans le cadre d’information, sous réserve du respect des 3 conditions suivantes :

· Gratuité de la diffusion ;

· Respect de l'intégrité des documents reproduits (pas de modification ni d’altération) ;

· Citation claire et lisible de la source sous la forme suivante : " Ce document provient du site web « e-AGENCE SODECI », propriété de la SODECI ".

Les droits de reproduction sont réservés et strictement limités.

 

V. Liens hypertextes

Les liens hypertextes mis en place dans le cadre du site web « e-AGENCE SODECI » en direction d'autres ressources présentes sur le réseau Internet, notamment vers des partenaires, ont fait l'objet d'une autorisation préalable, et expresse.

Toutefois, la SODECI n’étant pas l’éditeur de ces sites, elle ne peut en contrôler le contenu. En conséquence, la SODECI ne pourra en aucun cas être tenue pour responsable du contenu des sites ainsi accessibles, ou des éventuelles collectes et transmissions de données personnelles, installation de cookies ou tout autre procédé tendant aux mêmes fins, effectués par ces sites.

Les utilisateurs et visiteurs du site web « e-AGENCE SODECI » ne peuvent en aucun cas mettre en place un lien hypertexte en direction du site web « e-AGENCE SODECI », sans l'autorisation écrite et préalable de la SODECI. Toute demande tendant à cette fin doit être adressée via le formulaire de contact.

  VI. Cookies

Le site web « e-AGENCE SODECI » utilise des cookies de base qui enregistrent automatiquement des informations à partir de votre terminal et votre navigateur, y compris votre adresse IP, ainsi que la page que vous demandez pour :

· Mémoriser des informations de vos données de navigation à travers les pages auxquelles vous accédez ;

· Mémoriser des informations relatives à vos sessions de navigation.

Un cookie est un fichier texte stocké sur le terminal de l’utilisateur et géré par son navigateur lors de la visite d'un site internet.

Les cookies du site web « e-AGENCE SODECI » dont l’activation a fait l’objet d’acceptation par l’utilisateur sont exploités pour :

· Permettre d'accéder à des espaces réservés et personnels du site web, tels que le compte d’accès ;

· Mettre en œuvre des mesures de sécurité, par exemple lorsqu'il est demandé de se connecter à nouveau à un contenu ou à un service après un certain laps de temps ;

· Adapter la présentation du site aux préférences d'affichage du terminal (résolution d'affichage, système d'exploitation utilisé, etc.) selon les matériels et les logiciels de visualisation ou de lecture ;

· Établir des statistiques permettant d'améliorer l'intérêt et l'ergonomie des services (volumes de fréquentation et d'utilisation des divers éléments composant le site (rubriques et contenus visités, parcours)) ;

· Mémoriser des informations relatives à un formulaire rempli sur le site (inscription ou compte d’accès) ou à des produits, services ou informations sélectionnés sur le site (service souscrit, etc.).

VII. Identifiants et mots de passe sécurisés

Pour accéder aux espaces sécurisés du site web « e-AGENCE SODECI », saisir le compte d’accès et votre mot de passe. Les données échangées entre le terminal de l’utilisateur et le serveur du site web « e-AGENCE SODECI » font l’objet d’un cryptage et d’un processus d’authentification basés sur la technologie SSL, qui assure l'authentification, la confidentialité et l'intégrité des données.

 VIII. Responsabilité

En tant qu’utilisateur du site web « e-AGENCE SODECI », vous reconnaissez :

· Disposer de la compétence et des moyens nécessaires pour accéder et utiliser ce site ;

· Avoir été informé que le site web « e-AGENCE SODECI » est accessible 24h/24h et 7 jours/7 jours, à l’exception des cas de force majeure.

Pour des raisons de maintenance, la SODECI pourra interrompre le fonctionnement de son site. Elle s’efforcera d’en avertir préalablement les utilisateurs. La SODECI n’est pas responsable des retards, difficulté d’utilisation, ou de l’incompatibilité entre le présent site et votre navigateur ou tout autre programme d’accès au site.

La SODECI ne pourra en aucun cas être tenue responsable de tout dommage direct ou indirect résultant ou consécutif à la diffusion par une personne tierce d’un virus par l’intermédiaire du site, et susceptible d’infecter votre système informatique à la suite de votre connexion, de l’utilisation ou de la navigation sur ce Site.

La SODECI garantit le fonctionnement régulier du site.

IX. Clauses d’ordre général

Toute cession, ou autre transfert des droits conférés par les présentes conditions est strictement interdit.

Si, pour quelque raison que ce soit, une juridiction compétente venait à considérer qu’une disposition des présentes Conditions est invalide, l’invalidité de cette disposition n’affectera en aucune façon la validité des autres conditions, qui demeureront en vigueur.

L’absence d’exercice par l’une des parties d’un droit ou d’une action en justice aux termes des présentes conditions ne pourra être considérée comme une renonciation à un tel droit ou à une telle action.

 

 X. Paiement en ligne

La SODECI s’est associée avec des fournisseurs de moyens de paiement électronique pour permettre aux particuliers et professionnels ayant souscrit un contrat par voie électronique de régler leurs factures de consommation d’électricité et autres prestations liées au service public de l’eau confié à la SODECI par Internet aux conditions prévues à l’article V.

XI. Modification des termes et conditions

La SODECI se réserve le droit de modifier, à tout moment et sans préavis, tout ou partie de ces termes et conditions. En conséquence, vous êtes prié de bien vouloir vous référer régulièrement à la dernière version desdites règles, disponible en permanence sur le présent site. Les modifications entrent en vigueur à la date de leur mise en ligne et sont immédiatement applicables et opposables à tous, sauf dispositions contraires. L'utilisation de notre site implique la pleine et entière acceptation de toute révision ou modification desdites règles.

La SODECI se réserve le droit de modifier les présent termes et conditions à tout moment. L’utilisateur s’engage donc à les consulter régulièrement.

XII. Respect de la législation en vigueur

La SODECI informe les utilisateurs du site web « e-AGENCE SODECI » que l’ensemble des lois et règlements en vigueur en Côte d’Ivoire sont applicables à ce site.

Les utilisateurs doivent donc s'abstenir de toute entrave aux dites dispositions légales, et notamment s'agissant des données personnelles auxquelles ils accèdent, de toute collecte, de toute utilisation détournée, et d'une manière générale, de tout acte susceptible de porter atteinte à la vie privée ou à la réputation des personnes.

XIII. Notification

Tous les avis, demandes, exigences, renonciations et autres communications requises ou autorisées à être données en vertu des présents termes et conditions pourront être également envoyés par écrit aux adresses suivantes :

· Société de Distribution d’Eau de la Côte d’Ivoire (SODECI),  Centre de Relation Client : centrederelationclient@sodeci.ci

· Appel téléphonique au : 175.

XIV. Règlement de Litiges - Droit applicable

XIV.1 Contacter d'abord le service clientèle

Si un litige survient dans le cadre de l’utilisation du site, notre objectif est de comprendre et de résoudre vos préoccupations. Les litiges concernant l’utilisation du site peuvent être signalés en ligne au service clientèle ou en composant le numéro de téléphone du service clientèle affiché sur le site.

XIV.2 Droit applicable et juridiction compétente

Les présents termes et conditions sont régis par le Droit en vigueur en République de Côte d’Ivoire. En cas de litige, et après une tentative de conciliation demeurée infructueuse, compétence expresse est attribuée aux Tribunaux Ivoiriens, nonobstant la pluralité de défendeurs ou l’appel en garantie, même pour les procédures d'urgence ou les procédures conservatoires, en référé ou à la requête.
  """;


}
