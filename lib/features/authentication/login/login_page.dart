import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String title = 'A propos';

  bool isoffline = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          setState(() {
            title = 'Apropos';
          });
          break;
        case 1:
          setState(() {
            title = 'Login';
          });
          break;
        case 2:
          setState(() {
            title = 'Contact';
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

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 70.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.perm_identity, size: 30),
          Icon(Icons.list, size: 30),
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
          });
        },
        letIndexChange: (index) => true,
      ),
      body: GFTabBarView(controller: _tabController, children: <Widget>[
        Container(color: Colors.white),
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "GES'OP",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Suivi du Compte d'Exploitation",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Image.asset(
                      'lib/assets/images/agricash_simple.jpg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    child: _SignInForm(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Renseigner ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Votre Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(color: Colors.white)
      ]),
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final _controller = Get.put(LoginController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Form(
        key: _key,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  filled: true,
                  isDense: true,
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value == null) {
                    return 'Email is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  isDense: true,
                ),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null) {
                    return 'Password is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              /*
              ElevatedButton(
                onPressed: _controller.state is LoginLoading
                    ? () {}
                    : _onLoginButtonPressed,
                child: const Text('LOG IN'),
              ),

               */
              GFButton(
                onPressed: _controller.state is LoginLoading
                    ? () {}
                    : _onLoginButtonPressed,
                text: "LOGIN",
                shape: GFButtonShape.pills,
                fullWidthButton: true,
              ),
              const SizedBox(
                height: 20,
              ),
              if (_controller.state is LoginFailure)
                Text(
                  (_controller.state as LoginFailure).error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Get.theme.errorColor),
                ),
              if (_controller.state is LoginLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      );
    });
  }

  _onLoginButtonPressed() {
    if (_key.currentState!.validate()) {
      _controller.login(_emailController.text, _passwordController.text);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
