import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/DataReflex.dart';
import 'package:sodeci_mobile/models/DataService.dart';
import 'package:sodeci_mobile/models/props.dart';
import 'package:sodeci_mobile/ui/infos_utiles/infos_utile_content_page.dart';
import 'package:sodeci_mobile/ui/pdfview/Pdfview_page.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoUtilMenuPage extends StatefulWidget {
  final int menuId;
  final String title;
  final IconData icon;
  final String nomIcon;
  final List<Props> propsList;
  final List<DataReflex> listAllReflex;
  final List<DataService> listAllService;

  InfoUtilMenuPage({key,
    @required this.menuId,
    @required this.title,
    this.icon,
    @required this.propsList,
    this.listAllReflex,
    @required this.listAllService,
    @required this.nomIcon})
      : super(key: key);

  @override
  _InfoUtilMenuPageState createState() => _InfoUtilMenuPageState();
}

class _InfoUtilMenuPageState extends State<InfoUtilMenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(widget.icon == null ? FontAwesomeIcons.info : widget.icon),
              SizedBox(
                width: 10,
              ),
              Text("Infos utiles")
            ],
          ),
          leading: new InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () => {Navigator.pop(context)},
          ),
        ),
        body: Column(
          children: <Widget>[
            buildHeader(name: widget.title, icon: widget.nomIcon),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildSubInfoCell(index: index);
                  },
                  itemCount: widget.propsList.length,
                ),
              ),
            ),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubInfoCell({String name, int index}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              gradient: LinearGradient(colors: [
                Colors.grey[300],
                Colors.grey[100],
                Colors.grey[300]
              ])),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.green),
                            borderRadius:
                            BorderRadius.all(Radius.circular(3.0)),
                            color: Colors.white),
                        padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.propsList[index].libelle,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstant.MenutextSize),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 6,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfosUtilesContentPage()));
        switch (widget.menuId) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    InfosUtilesContentPage(
                      id:widget.propsList[index].id,
                      idMenu: widget.menuId,
                      showNavButton: true,
                    )));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    InfosUtilesContentPage(
                      showNavButton: true,
                      id: widget.propsList[index].id,
                      idMenu: widget.menuId,
                      listReflexe: widget.listAllReflex,
                    )));
            break;
          default:
            if (widget.propsList[index].id == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      InfosUtilesContentPage(
                        showNavButton: true,
                        id: widget.propsList[index].id,
                        idMenu: widget.menuId,
                        lisService: widget.listAllService,
                      )));
            }else if(widget.propsList[index].id == 2){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      InfosUtilesContentPage(
                        showNavButton: true,
                        id: widget.propsList[index].id,
                        idMenu: widget.menuId,
                        lisService: widget.listAllService,
                      )));
            }
            else {
              if (widget.propsList[index].id == 4) {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            PdfViewPage(
                              assetLink: "assets/image_service.png",))
                );
              }
              if (widget.propsList[index].id == 3) {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            PdfViewPage(
                              assetLink: "assets/images/INFOS_UTILES/cadreinstitutionnel.jpg",))
                );
              }
            }
        }
      },
    );
  }


}
