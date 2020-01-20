import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/AppConstant.dart';
import 'package:sodeci_mobile/models/props.dart';
import 'package:sodeci_mobile/models/saphirV3/Contactbases.dart';
import 'package:sodeci_mobile/ui/demandes/nouvelle_demande_page.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DemandeMenuDetail extends StatefulWidget {


  final int menuId;
  final String title;
  final IconData icon;
  final String nomIcon;
  final List<Props> propsList;
  final Contactbases userInfo;

  DemandeMenuDetail({key,
    @required this.menuId,
    @required this.title,
    this.icon,
    @required this.nomIcon,
    @required this.propsList,
    @required this.userInfo
  })
      : super(key: key);


  @override
  _DemandeMenuDetailState createState() => _DemandeMenuDetailState();
}

class _DemandeMenuDetailState extends State<DemandeMenuDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Icon(widget.icon == null ? FontAwesomeIcons.info : widget.icon),
              SizedBox(
                width: 10,
              ),
              Text("Menu des Demandes")
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
        /*switch (widget.menuId) {

        }*/
        if(widget.propsList[index].id == 1 || widget.propsList[index].id == 3 ||widget.propsList[index].id == 2){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NouvelleDemandePage(userInfo: widget.userInfo,typeDemande: widget.propsList[index].type,id: widget.propsList[index].id,)),
          );
        }

      },
    );
  }
}
