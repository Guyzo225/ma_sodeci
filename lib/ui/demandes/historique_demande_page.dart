import "package:flutter/material.dart";
import 'package:sodeci_mobile/constants/ColorConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/ui/demandes/historique_demande_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class HistoriqueDemandePage extends StatefulWidget {
  @override
  _HistoriqueDemandePageState createState() => _HistoriqueDemandePageState();
}

class _HistoriqueDemandePageState extends State<HistoriqueDemandePage> {
  HistoriqueDemandeBloc _bloc = new HistoriqueDemandeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          Utils.showDailogInfoError(context: context, msg: value.message);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        }
      }
    });

    _bloc.statusDemandeSubject.listen((value) {
      print(value);
      if (value != null &&
          _bloc.listDemandeSubject.value != null &&
          value.length == _bloc.listDemandeSubject.value.length) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: new Scaffold(
            appBar:
            SimpleMaterialAppBar(appTitle: "Liste des demandes", context: context),
            body: Column(
              children: <Widget>[
                buildHeader(
                    name: "Historique des demandes",
                    icon:
                        "assets/images/ESPACE_PERSONNEL/Demandes/historiques_vert.png"),
                new SizedBox(
                  height: 10,
                ),
                new Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    elevation: 5,
                    child: new TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "filtrer votre recherche",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15)
                      ),
                      onChanged: (value){
                        _bloc.filterList(value);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<String>>(
                      stream: _bloc.listDemandesStream,
                      builder: (context, snapshot) {
                        return snapshot.hasData &&
                                snapshot.data != null &&
                                snapshot.data.length > 0
                            ? RefreshIndicator(
                              onRefresh: refreshHistory,
                              child: new ListView.separated(
                                  itemBuilder: (context, index) {
                                    return new ListTile(
                                      title: new Text(
                                        snapshot.data[index],
                                        style: TextStyle(
                                            color: Color(color_primary),
                                            fontSize: 20),
                                      ),
                                      trailing: new Text(
                                          _bloc.statusDemandeSubject.value !=
                                                      null &&
                                                  _bloc.statusDemandeSubject.value
                                                          .length >
                                                      0
                                              ? _bloc.statusDemandeSubject
                                                  .value[index]
                                              : ""),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return new Divider();
                                  },
                                  itemCount: snapshot.data.length),
                            )
                            : Container(
                                child: new Center(
                                  child: new Text(
                                    "Aucune démande trouvé",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              );
                      }),
                ),
              ],
            )));
  }

  Future<void> refreshHistory() async{
    _bloc.isRefreshSubject.add(true);
    _bloc.getListDemande();
    await new Future.delayed(const Duration(seconds: 3));
  }
}
