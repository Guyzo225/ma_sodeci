import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/DataAgence.dart';
import 'package:sodeci_mobile/models/data_response.dart';
import 'package:sodeci_mobile/ui/reseau_agence/agence_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong/latlong.dart';

class ReseauAgence extends StatefulWidget {
  @override
  _ReseauAgenceState createState() => _ReseauAgenceState();
}

class _ReseauAgenceState extends State<ReseauAgence> {
  //Put something

  AgenceBloc bloc = new AgenceBloc();
  List<DataAgence> _listAgence = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getCurrentLocation();
    bloc.loading.listen((value) {});

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle(),
          leading: buildBackButton(context),
        ),
        body: Column(
          children: <Widget>[
            buildHeader(
                name: "Réseau d'agences",
                icon: "assets/images/PAGE_ACCUEIL/reseau_agence_vert.png"),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Ville, commune",
                                    border: InputBorder.none),
                                onChanged: (value) => bloc.search(value),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Agences à proximité",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: new StreamBuilder<List<DataAgence>>(
                            stream: bloc.agences, // a Stream<int> or null
                            initialData: null,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      return _agenceItem(snapshot.data[index]);
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Divider(),
                                    itemCount: snapshot.data.length);
                              } else {
                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return _placeholder();
                                  },
                                  itemCount: 20,
                                );
                              }
                            }))
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

  Widget _placeholder() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SkeletonAnimation(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300]),
                ),
              ),
              new SizedBox(
                width: 20,
              ),
              Flexible(
                  child: new Column(
                children: <Widget>[
                  SkeletonAnimation(
                    child: Container(
                      height: 20,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  SkeletonAnimation(
                    child: Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  SkeletonAnimation(
                    child: Container(
                      height: 30,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget _agenceItem(DataAgence item) {
    return new GestureDetector(
      onTap: () => {showAlert(item)},
      child: new Container(
        padding: EdgeInsets.all(5),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new SvgPicture.asset(
              "assets/images/RESEAUX_DAGENCES/map_circle.svg",
              color: Colors.blueAccent,
              width: 30,
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 8, top: 8, bottom: 8),
                child: new RichText(
                    text: TextSpan(
                        text: "${item.libelle} \n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                      TextSpan(
                          text: "${item.adresse}",
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ])),
              ),
            ),
            new SvgPicture.asset(
              "assets/images/RESEAUX_DAGENCES/info_round.svg",
              color: Color(color_primary),
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void showAlert(DataAgence item) {
    showDialog(context: context,builder: (BuildContext buildcontext) => getDialog(item));
  }

  Dialog getDialog(DataAgence item){
    return Dialog(
      child: Container(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: new Container(
                width: double.maxFinite,
                color: Colors.grey[200],
                padding: EdgeInsets.all(10),
                child: new Text("${item.libelle}", style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RichText(text: new TextSpan(text: "Télephone :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
              children: [
                TextSpan(text: "${item.contact}",style: TextStyle(fontWeight: FontWeight.normal))
              ])),
            ),
            Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new InkWell(
                    child: new Text("FERMER",style: TextStyle(color: Colors.black,fontSize: 15),),
                    onTap: ()=>{Navigator.of(context).pop()},
                    splashColor: Color(color_primary),
                  ),
                  new SizedBox(width: 20,),
                  new InkWell(
                    child: new Text("ITINERAIRE",style: TextStyle(color: Colors.black,fontSize: 15),),
                    splashColor: Color(color_primary),
                    onTap: (){
                      Utils.openMap(bloc.currentPositionStream.value, new LatLng(item.latitude,item.longitude));
                    },
                  ),
                  new SizedBox(width: 20,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildContactsCell() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Siege social",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                "1, Avenue Christiani Treichville",
                textAlign: TextAlign.center,
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

  Widget _buildFormEditRow(String label, String hintText,
      {bool info = false, Function onTap}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: hintText, border: InputBorder.none),
                ),
              ),
              !info
                  ? Container()
                  : GestureDetector(
                      child: Icon(
                        Icons.help,
                        color: Colors.green,
                      ),
                      onTap: onTap,
                    )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.stopListening();
    super.dispose();

  }
}
