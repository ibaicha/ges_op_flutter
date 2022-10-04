import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../Models/ObjectBox/objectBoxModels.dart';

import 'package:get/get.dart';

import '../features/features.dart';
import '../objectbox.g.dart';

class MaintenancePage extends StatefulWidget {
  static const String routeName = '/mantenancePage';

  // const MaintenancePage({Key? key, required this.title}) : super(key: key);
  const MaintenancePage({Key? key}) : super(key: key);
  // final String title;

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String title = 'Base Données';
  late int countUser = 0;
  late Color colorsUser = Colors.amber;
  late int countProducteur = 0;
  late Color colorsProducteur = Colors.amber;
  late int countExploitation = 0;
  late Color colorsExploitation = Colors.amber;
  late int countAnnee = 0;
  late Color colorsAnnee = Colors.amber;
  late int countSaison = 0;
  late Color colorsSaison = Colors.amber;
  late int countVariete = 0;
  late Color colorsVariete = Colors.amber;
  late int countTypeCharge = 0;
  late Color colorsTypeCharge = Colors.amber;
  late int countTypeOp = 0;
  late Color colorsTypeOp = Colors.amber;
  late int countOp = 0;
  late Color colorsOp = Colors.amber;
  late int countCharge = 0;
  late Color colorsCharge = Colors.amber;
  late int countFamilleExploitation = 0;
  late Color colorsFamilleExploitation = Colors.amber;
  late int countExploitationChargeExploitation = 0;
  late Color colorsExploitationChargeExploitation = Colors.amber;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);

    final userObject = ObjectBox.userObject;
    countUser = userObject!.query().build().count();
    if (countUser > 0) {
      colorsUser = Colors.greenAccent;
    } else {
      colorsUser = Colors.amber;
    }

    final producteurBox = ObjectBox.producteurBox;
    countProducteur = producteurBox!.query().build().count();
    if (countProducteur > 0) {
      colorsProducteur = Colors.greenAccent;
    }

    final exploitationBox = ObjectBox.exploitationsBox;
    countExploitation = exploitationBox!.query().build().count();
    if (countExploitation > 0) {
      colorsExploitation = Colors.greenAccent;
    } else {
      colorsExploitation = Colors.amber;
    }

    final anneeBox = ObjectBox.anneesBox;
    countAnnee = anneeBox!.query().build().count();
    if (countAnnee > 0) {
      colorsAnnee = Colors.greenAccent;
    } else {
      colorsAnnee = Colors.amber;
    }

    final saisonBox = ObjectBox.saisonsBox;
    countSaison = saisonBox!.query().build().count();
    if (countSaison > 0) {
      colorsSaison = Colors.greenAccent;
    } else {
      colorsSaison = Colors.amber;
    }

    final varieteBox = ObjectBox.varietesBox;
    countVariete = varieteBox!.query().build().count();
    if (countVariete > 0) {
      colorsVariete = Colors.greenAccent;
    } else {
      colorsVariete = Colors.amber;
    }

    final chargeExploitationsBox = ObjectBox.chargeExploitationsBox;
    countCharge = chargeExploitationsBox!.query().build().count();
    if (countCharge > 0) {
      colorsCharge = Colors.greenAccent;
    } else {
      colorsCharge = Colors.amber;
    }

    final typeChargeExploitationsBox = ObjectBox.typeChargeExploitationsBox;
    countTypeCharge = typeChargeExploitationsBox!.query().build().count();
    if (countTypeCharge > 0) {
      colorsTypeCharge = Colors.greenAccent;
    } else {
      colorsTypeCharge = Colors.amber;
    }

    final typeOpsBox = ObjectBox.typeOpsBox;
    countTypeOp = typeOpsBox!.query().build().count();
    if (countTypeOp > 0) {
      colorsTypeOp = Colors.greenAccent;
    } else {
      colorsTypeOp = Colors.amber;
    }

    final opsBox = ObjectBox.opsBox;
    countOp = opsBox!.query().build().count();
    if (countOp > 0) {
      colorsOp = Colors.greenAccent;
    } else {
      colorsOp = Colors.amber;
    }

    final familleChargeExploitationsBox =
        ObjectBox.familleChargeExploitationsBox;
    countFamilleExploitation =
        familleChargeExploitationsBox!.query().build().count();
    if (countFamilleExploitation > 0) {
      colorsFamilleExploitation = Colors.greenAccent;
    } else {
      colorsFamilleExploitation = Colors.amber;
    }

    final exploitationChargeExploitationBox =
        ObjectBox.exploitationChargeExploitationBox;
    countExploitationChargeExploitation =
        exploitationChargeExploitationBox!.query().build().count();
    if (countExploitationChargeExploitation > 0) {
      colorsExploitationChargeExploitation = Colors.greenAccent;
    } else {
      colorsExploitationChargeExploitation = Colors.amber;
    }
  }

  @override
  updateBox(String myBox) {
    if (myBox == 'userObject') {
      Box<UserObject>? userObject;
      userObject?.removeAll();
      ObjectBox.getUserData();
    }
    if (myBox == 'producteursBox') {
      final producteursBox = ObjectBox.producteurBox;
      producteursBox!.removeAll();

      final exploitationsBox = ObjectBox.anneesBox;
      exploitationsBox!.removeAll();

      ObjectBox.getProducteurData();
    }
    if (myBox == 'anneesBox') {
      final anneesBox = ObjectBox.anneesBox;
      anneesBox!.removeAll();
      ObjectBox.getAnneeData();
    }
    if (myBox == 'saisonsBox') {
      final saisonsBox = ObjectBox.saisonsBox;
      saisonsBox!.removeAll();
      ObjectBox.getSaisonData();
    }
    if (myBox == 'varietesBox') {
      final varietesBox = ObjectBox.varietesBox;
      varietesBox!.removeAll();
      ObjectBox.getVarieteData();
    }
    if (myBox == 'typeChargeExploitationsBox') {
      final typeChargeExploitationsBox = ObjectBox.typeChargeExploitationsBox;
      typeChargeExploitationsBox!.removeAll();
      ObjectBox.getTypeChargeExploitationData();
    }
    if (myBox == 'typeOpsBox') {
      final typeOpBox = ObjectBox.typeOpsBox;
      typeOpBox!.removeAll();
      ObjectBox.getTypeOpData();
    }
    if (myBox == 'opsBox') {
      final opsBox = ObjectBox.opsBox;
      opsBox!.removeAll();
      ObjectBox.getOpData();
    }
    if (myBox == 'chargeExploitationsBox') {
      print('--------------------- BON --------------------------------');
      final chargeExploitationsBox = ObjectBox.chargeExploitationsBox;
      chargeExploitationsBox!.removeAll();
      ObjectBox.getChargeExploitationData();
    }
    if (myBox == 'familleChargeExploitationsBox') {
      final familleChargeExploitationsBox =
          ObjectBox.familleChargeExploitationsBox;
      familleChargeExploitationsBox!.removeAll();
      ObjectBox.getFamilleExploitationData();
    }
    if (myBox == 'exploitationsBox') {
      final exploitationsBox = ObjectBox.exploitationsBox;
      // exploitationsBox!.removeAll();
      // ObjectBox.getExploitationData();
    }
    if (myBox == 'exploitationChargeExploitationBox') {
      final exploitationChargeExploitationBox =
          ObjectBox.exploitationChargeExploitationBox;
      exploitationChargeExploitationBox!.removeAll();
      ObjectBox.getExploitationChargeExploitationData();
    }
    if (myBox == 'chargeExploitationBoxx') {
      final chargeExploitationBox = ObjectBox.chargeExploitationsBox;
      chargeExploitationBox!.removeAll();
      ObjectBox.getChargeExploitationData();
    }
  }

  @override
  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          setState(() {
            title = 'Base Données';
          });
          break;
        case 1:
          setState(() {
            title = 'Utilisateur';
          });
          break;
        case 2:
          setState(() {
            title = 'Serveur';
          });
          break;
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.account_tree_outlined, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
          Icon(Icons.ad_units_outlined, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
            _tabController.index = index;
            print(' ------- index ------- ${index}');
            if (index == 0) {}
            if (index == 1) {
              Get.toNamed('/');
            }
            if (index == 2) {}
          });
        },
        letIndexChange: (index) => true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      body: GFTabBarView(controller: _tabController, children: <Widget>[
        Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Card(
                  color: colorsExploitation,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("EXPLOITATION"),
                    subtitle:
                        Text('Nombre enregistrements: ${countExploitation} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('exploitationsBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsExploitationChargeExploitation,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("EXPLOITATION CHARGE"),
                    subtitle: Text(
                        'Nombre enregistrements: ${countExploitationChargeExploitation} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('exploitationChargeExploitationBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsCharge,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("CHARGE EXPLOITATION"),
                    subtitle: Text('Nombre enregistrements: ${countCharge} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('chargeExploitationsBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsTypeCharge,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("TYPE CHARGE"),
                    subtitle:
                        Text('Nombre enregistrements: ${countTypeCharge} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('typeChargeExploitationsBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsTypeOp,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("TYPE OP"),
                    subtitle: Text('Nombre enregistrements: ${countTypeOp} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('typeOpsBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsOp,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("OP"),
                    subtitle: Text('Nombre enregistrements: ${countOp} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('opsBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsFamilleExploitation,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("FAMILLE CHARGE"),
                    subtitle: Text(
                        'Nombre enregistrements: ${countFamilleExploitation} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('familleChargeExploitationsBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsVariete,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("VARIETE"),
                    subtitle: Text('Nombre enregistrements: ${countVariete} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('varietesBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsSaison,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("SAISON"),
                    subtitle: Text('Nombre enregistrements: ${countSaison} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('saisonsBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsAnnee,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("ANNEE"),
                    subtitle: Text('Nombre enregistrements: ${countAnnee} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('anneesBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsProducteur,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("PRODUCTEURS"),
                    subtitle:
                        Text('Nombre enregistrements: ${countProducteur} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateBox('producteursBox');
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: colorsUser,
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("UTILISATEUR"),
                    subtitle: Text('Nombre enregistrements: ${countUser} '),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add_box)),
                      ],
                    ),
                  ),
                ),
              ],
              shrinkWrap: true,
              reverse: true,
              padding: EdgeInsets.all(10),
              itemExtent: 100,
            )),
        Container(color: Colors.green),
        Container(color: Colors.blue)
      ]),
    );
  }
}
