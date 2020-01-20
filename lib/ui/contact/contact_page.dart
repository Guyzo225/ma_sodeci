import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/ui/contact/ecrivez_nous_page.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool contactsInstitActive = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: appBarTitle(),
          ),
          leading: buildBackButton(context),
        ),
        body: Column(
          children: <Widget>[
            buildHeader(
                name: "Contact",
                icon: "assets/images/PAGE_ACCUEIL/contact_vert.png"),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: ListView(
                  children: <Widget>[
                    GestureDetector(
                      child: _buildInfoCell(
                          name: "Ecrivez-nous (formulaire)",
                          icon: "assets/images/CONTACTS/ecrivez_nous_vert.svg"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EcrivezNousPage()));
                      },
                    ),
                    GestureDetector(
                      child: _buildInfoCell(
                          name: "Appelez-nous (175)",
                          icon: "assets/images/CONTACTS/contacts_179_vert.svg"),
                      onTap: () => {launch("tel://175")},
                    ),
                    GestureDetector(
                      child: _buildInfoCell(
                          name: "Conctacts institutionnels",
                          last: true,
                          icon:
                              "assets/images/CONTACTS/contacts_institutionnels_vert.svg"),
                      onTap: () {
                        setState(() {
                          contactsInstitActive = !contactsInstitActive;
                        });
                      },
                    ),
                    !contactsInstitActive
                        ? Container()
                        : Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  buildContactsCell(
                                      left: "Siège Social",
                                      right:
                                          "1, Avenue Christiani, Treichville"),
                                  buildContactsCell(
                                      left: "Adresse Postale:",
                                      right: "01 BP 1843 Abidjan 01"),
                                  buildContactsCell(
                                      left: "Téléphone:",
                                      right: "(+225) 21 23 30 00",
                                      isTel: true),
                                  buildContactsCell(
                                      left: "Fax :", right: "(+225)"),
                                  buildContactsCell(
                                      left: " Email:",
                                      right:
                                          "centrederelationclient@sodeci.ci"),
                                  buildContactsCell(
                                      left: "Compte contribuable:",
                                      right: "0100984A"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.blueAccent,
                                        ),
                                        onTap: () {
                                          Utils.openUrl(
                                              "https://web.facebook.com/SODECI.CI");
                                        },
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.blue,
                                        ),
                                        onTap: () {
                                          Utils.openUrl(
                                              "https://www.youtube.com/channel/UCITM0Y8erUtl8dARYFd9SEw");
                                        },
                                      ),
                                      Icon(
                                        FontAwesomeIcons.linkedin,
                                        color: Colors.blueAccent,
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          FontAwesomeIcons.youtubeSquare,
                                          color: Colors.red,
                                        ),
                                        onTap: () {
                                          Utils.openUrl(
                                              "https://www.youtube.com/channel/UCITM0Y8erUtl8dARYFd9SEw");
                                        },
                                      ),
                                      GestureDetector(
                                          child: Icon(FontAwesomeIcons.instagram),
                                          onTap: (){
                                            Utils.openUrl("https://www.instagram.com/sodecinet/");
                                          },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Column buildContactsCell({String left, String right, bool isTel = false}) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: isTel == null
                  ? Text(
                      right,
                      textAlign: TextAlign.right,
                    )
                  : GestureDetector(
                      child: Text(
                        right,
                        textAlign: TextAlign.right,
                      ),
                      onTap: () => {launch("tel://$right")},
                    ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          color: Colors.black,
          height: 0.7,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildInfoCell({String name, bool last = false, String icon}) {
    return Padding(
      padding: !last ? const EdgeInsets.only(bottom: 10.0) : EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Color(color_primary), width: 2)),
                      child: new SvgPicture.asset(
                        icon,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        name == null ? "Tarifs" : name,
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstant.MenutextSize),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 3,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
