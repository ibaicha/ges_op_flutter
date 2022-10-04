import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import '../features/authentication/login/login_controller.dart';
import '../features/features.dart';
import '../models/models.dart';


class LoginMaintenancePage extends StatefulWidget {
  static const String routeName = '/loginMaintenancePage';
  const LoginMaintenancePage({Key? key}) : super(key: key);




  @override
  State<LoginMaintenancePage> createState() => _LoginMaintenancePageState();
}
class _LoginMaintenancePageState extends State<LoginMaintenancePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _controller = Get.put(LoginController());

  // final _getLogin = Get.put(getLogin());

  //late List<LoginModel>? _loginModel = [];
  Future<LoginModel>? _futureLoginModel;

  @override
  void initState() {
    super.initState();
  }

  void _getLogin() async {
    if(emailController.text =='admin' && passwordController.text == 'admin' ){
      Get.toNamed('/maintenancePage',
          arguments: { "utilisateur": ApiConstants.utilisateur});
    }

    }


  // final DBHelper dbHelper= new DBHelper();

  // final UtilisateurCrud utilisateurCrud= UtilisateurCrud();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Maintenance"),

      ),
      drawer: NavDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: Image.asset('lib/assets/images/agricash_simple.jpg',
                    width: 150,
                    height: 150,),
                ),
                const SizedBox(height: 15,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Compte",
                      labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
                const SizedBox(height: 15,),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Mot de passe",
                      labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),

                const SizedBox(height: 15,),

                GFButton(
                  onPressed: () {

                    /*
                    dbHelper.initDB().whenComplete(() async {
                      dbHelper.getLogin(emailController.text, passwordController.text);
                    });

                     */

                    // utilisateurCrud.getLogin(emailController.text, passwordController.text);

                    final userBox = ObjectBox.userObject;
                    final query =  userBox?.query(
                    UserObject_.email.equals(emailController.text).and(
                    UserObject_.password.equals(passwordController.text))).build();

                    if (query!.count()>0) {
                      final monUser = query
                          .find()
                          .first;

                      Get.toNamed('/maintenancePage',
                          arguments: { "utilisateur": monUser});
                    }
                    else{
                      throw ("Hi there. I am an error Encore");
                    }
                  },
                  text: "LOGIN",
                  shape: GFButtonShape.pills,
                  fullWidthButton: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                if (ApiConstants.maintenance)
                  Text(
                    'Erreur Compte ou password',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Get.theme.errorColor),
                  ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}