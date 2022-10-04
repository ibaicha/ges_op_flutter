import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:get/get.dart';
import '../features.dart';

class HomePage extends StatelessWidget {
  final User user;
  final _controller = Get.put(HomeController());

  // late ObjectBox objectbox;

  @override
  void initState() {
    print(
        ' ----- ApiConstants.utilisateurObject.profil_name : ${ApiConstants.utilisateurObject.profil_name} -----------');
  }

  @override
  void dispose() {
    ObjectBox.close();
  }

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        drawer: NavDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, top: 60, bottom: 20),
              child: Text(
                'USER CONNECTED',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Welcome, ${user.email}',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      if (ApiConstants.utilisateurObject.profil_name ==
                          'Producteur')
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Producteur',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                '${ApiConstants.utilisateurObject.producteur_prenom} ${ApiConstants.utilisateurObject.producteur_nom}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        )),
                      if (ApiConstants.utilisateurObject.profil_name == 'Op')
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Responsable OP',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                '${ApiConstants.utilisateurObject.op_name}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        )),
                      Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                _controller.signOut();
                              },
                              child: const Text('Logout'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
