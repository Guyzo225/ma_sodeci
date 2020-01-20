import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sodeci_mobile/constants/StyleConstant.dart';
import 'package:sodeci_mobile/models/Loading.dart';
import 'package:sodeci_mobile/ui/simulation/simulation_bloc.dart';
import 'package:sodeci_mobile/utils/utils.dart';
import 'package:sodeci_mobile/widgets/footer.dart';
import 'package:sodeci_mobile/widgets/header.dart';
import 'package:sodeci_mobile/widgets/widget_utils.dart';

class SimulationFacturePage extends StatefulWidget {
  final String refContract;

  SimulationFacturePage({key, @required this.refContract}) : super(key: key);

  @override
  _SimulationFacturePageState createState() => _SimulationFacturePageState();
}

class _SimulationFacturePageState extends State<SimulationFacturePage> {
  SimulationBloc _bloc = new SimulationBloc();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _controllerLAstIndex = new TextEditingController();
  TextEditingController _controllerNewIndex = new TextEditingController();

  final focusLastIndex = FocusNode();
  final focusNewIndex = FocusNode();

  BuildContext _context;

  bool _lastIndex = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("bbbbb");
    print(widget.refContract.trim());
    //_bloc.getIdContrat();

    _bloc.contractIdSubject.listen((value) {
      print("xxxxxxxx");
      for (var i = 0; i < value.length; i++) {
        print(value[i].jfaReferencecontrat);
        print(widget.refContract.trim());
        if (value[i].jfaReferencecontrat == widget.refContract.trim()) {
          print(value[i].contractid);
          print("yyyyy");
          _bloc.currentContractIdSubject.add(value[i]);
          break;
        }
      }
    });

    _bloc.loading.listen((Loading value) {
      if (value.loading == true) {
        Utils.showLoading(value.message, context);
      } else {
        if (value.hasError == true) {
          Utils.showDailogInfoError(context: context,msg: value.message);
        } else {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        }
      }
    });
    _bloc.simulationSubject.listen((String value) {
      print(value);
      if (value != null) {
        //Utils.showSimpleToast(value, _context);
        Utils.showDailogInfoWithoutPop(
            context, Utils.formatRedable(value), "Montant facture",(){});
      }
    });

    _bloc.dernierIndexSubject.listen((int value) {
      _controllerLAstIndex.text = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Simulation de facture",
              style: new TextStyle(fontSize: 15),
            ),
          ),
          leading: buildBackButton(context),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //buildHeader(name: "Simulation", iconInfo: Icons.info,icon: ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      """
                      ATTENTION : Cette estimation est faite sur la base des informations saisies. Des paramètres propres à votre Abonnement peuvent modifier le montant obtenu lors de la simulation sur cette plateforme.
Aussi nous vous informons que la simulation de la facture n’est pas contractuelle et que le montant qui s'affiche est hors frais de timbre .
                      """,
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new CheckboxListTile(
                      value: _lastIndex,
                      onChanged: (value) {
                        setState(() {
                          _lastIndex = value;
                          if(value){
                            _bloc.getLastIndex(widget.refContract);
                          }
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      title: Text(
                        "Cocher ici pour simuler la facture à partir de votre dernier index connu :",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    new SizedBox(
                      height: 10,
                    ),
                    new Form(
                      key: _formKey,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 150,
                            child: TextFormField(
                              expands: false,
                              decoration: InputDecoration(
                                labelText: "Ancien index",
                              ),
                              style: TextStyle(color: Colors.black),
                              controller: _controllerLAstIndex,
                              focusNode: focusLastIndex,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (v) {
                                Utils.fieldFocusChange(
                                    context, focusLastIndex, focusNewIndex);
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Champ obligatoire";
                                } else
                                  return null;
                              },
                            ),
                          ),
                          Container(
                            width: 150,
                            child: TextFormField(
                              expands: false,
                              decoration:
                                  InputDecoration(labelText: "Nouvel index"),
                              style: TextStyle(color: Colors.black),
                              controller: _controllerNewIndex,
                              focusNode: focusNewIndex,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.go,
                              onFieldSubmitted: (v) {
                                simulate();
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Champ obligatoire";
                                } else
                                  return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*Expanded(
                      child: Container(),
                    ),*/
                    new SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        MaterialButton(
                          color: Colors.grey,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              "ANNULER",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        MaterialButton(
                          color: Colors.blueAccent.withOpacity(0.5),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              "SIMULER",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            simulate();
                          },
                        )
                      ],
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

  void simulate() {
    if (_formKey.currentState.validate()) {
      int diff = int.parse(_controllerNewIndex.value.text) -
          int.parse(_controllerLAstIndex.value.text);
      if (diff > 0) {
        _bloc.simulate(diff);
      } else {
        Utils.showErrorToast(
            "L'ancien index ne peut-être supérieur au nouvel index !", context);
      }
    }
  }
}
