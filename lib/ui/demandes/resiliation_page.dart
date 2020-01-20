import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/models/TabEagence.dart';
import 'package:sodeci_mobile/models/saphirV3/DataRefContract.dart';
import 'package:sodeci_mobile/ui/demandes/resiliation_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class ResiliationPage extends StatefulWidget {
  @override
  _ResiliationPageState createState() => _ResiliationPageState();
}

class _ResiliationPageState extends State<ResiliationPage> {
  ResiliationBloc _bloc = new ResiliationBloc();

  DataRefContract _contrat = null;
  TabEagence _motif = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          //Utils.showErrorDialog("Erreur", value.message, context);
          Utils.showDailogInfoError(context: context,msg: value.message);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          if(value.message != null){
            Utils.showDailogInfoWithoutPop(context,value.message,"Information",(){});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: new Scaffold(
      appBar:
      SimpleMaterialAppBar(appTitle: "Résiliation de contract", context: context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RichText(
                    text: TextSpan(
                        text: "Référence contrat",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        text: "*",
                        style: new TextStyle(color: Colors.red),
                      )
                    ])),
                Container(
                    height: 40,
                    width: 200,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: StreamBuilder<List<DataRefContract>>(
                        stream: _bloc.refContractStream,
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? DropdownButtonHideUnderline(
                                  child: new DropdownButton<DataRefContract>(
                                      items: snapshot.data.map<
                                              DropdownMenuItem<
                                                  DataRefContract>>(
                                          (DataRefContract value) {
                                        return DropdownMenuItem<
                                                DataRefContract>(
                                            value: value,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                value.jfaReferencecontrat,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ));
                                      }).toList(),
                                      isExpanded: true,
                                      value: _contrat,
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (DataRefContract newValue) {
                                        setState(() {
                                          _contrat = newValue;
                                        });
                                      }),
                                )
                              : Container();
                        }))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RichText(
                    text: TextSpan(
                        text: "Motif",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        text: "*",
                        style: new TextStyle(color: Colors.red),
                      )
                    ])),
                Container(
                    height: 40,
                    width: 200,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: StreamBuilder<List<TabEagence>>(
                        stream: _bloc.motifStream,
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? DropdownButtonHideUnderline(
                                  child: new DropdownButton<TabEagence>(
                                      items: snapshot.data
                                          .map<DropdownMenuItem<TabEagence>>(
                                              (TabEagence value) {
                                        return DropdownMenuItem<TabEagence>(
                                            value: value,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                value.lib,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ));
                                      }).toList(),
                                      isExpanded: true,
                                      value: _motif,
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (TabEagence newValue) {
                                        setState(() {
                                          _motif = newValue;
                                        });
                                      }),
                                )
                              : Container();
                        }))
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.maxFinite,
              child: new RaisedButton(
                onPressed: () {
                  verifyField();
                },
                child: new Text("Soumettre",style: button_send_style,),
                color: Colors.blue.withOpacity(0.5),
                splashColor: Color(color_primary),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void verifyField() {
    if(_motif == null){
      Utils.showErrorToast("Veuillez choisir un motif svp", context);
      return;
    }

    if(_contrat == null){
      Utils.showErrorToast("Veuillez choisir une référence contrat svp", context);
      return;
    }

    String data = "V3_RefContrat=${_contrat.jfaReferencecontrat}";
    data += "&Id_Indiv=${_bloc.userSimpleSubject.value.idUser}";
    data += "&Value_V3_Motif_Resil=${_motif.ref}";
    data += "&gs2eContratid=${_contrat.contractId}";
    data += "&gs2eModeledecontratclientid=${_contrat.gs2EModeledecontratclientid}";
    data += "&Nbr_Doc=0";
    data += "&attempt=0";
    _bloc.sendResiliation(data);
  }
}
