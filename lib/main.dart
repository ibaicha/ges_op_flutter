import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/features.dart';
import 'pages/LoginMaintenancePage.dart';
import 'pages/MaintenancePage.dart';
import 'ui/exploitation/pages/EditExploitationPage.dart';

void main() {
  initialize();
  runApp(MyApp());
}

void initialize() {
  Get.lazyPut(
    () => AuthenticationController(Get.put(FakeAuthenticationService())),
  );
}

class MyApp extends GetWidget<AuthenticationController> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fluter GetX Auth',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () =>
                HomePage(user: (controller.state as Authenticated).user)),
        GetPage(
            name: '/exploitationPage', page: () => const ExploitationPage()),
        GetPage(
            name: '/editExploitationPage',
            page: () => const EditExploitationPage()),
        GetPage(name: '/maintenancePage', page: () => const MaintenancePage()),
        GetPage(
            name: '/loginMaintenancePage',
            page: () => const LoginMaintenancePage()),
      ],
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        if (controller.state is UnAuthenticated) {
          return const LoginPage();
        }

        if (controller.state is Authenticated) {
          Future.delayed(Duration.zero, () {
            if (ApiConstants.isRecentlyCreatedDB) {
              ApiConstants.isRecentlyCreatedDB = false;
              /*
              Get.dialog(
                AlertDialog(
                  title: const Text('Dialog'),
                  content: Text("La BD " + ApiConstants.nameDB + " est créé"),
                  actions: [
                    TextButton(
                      child: const Text("Close"),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              );
              */
            }
          });

          return HomePage(
            user: (controller.state as Authenticated).user,
          );
        }
        return SplashScreen();
      }),
    );
  }
}
