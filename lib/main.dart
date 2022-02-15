import 'package:cryptocurrency_app/ui/screens/transfer.dart';
import 'package:cryptocurrency_app/ui/screens/transfer_landscape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:cryptocurrency_app/controllers/bottom_nav_bar_binding.dart';
import 'package:cryptocurrency_app/controllers/transfer_binding.dart';
import 'package:cryptocurrency_app/ui/screens/home.dart';

import 'ui/screens/unknown_route_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.indigo,
        statusBarIconBrightness: Brightness.light),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute:
          GetPage(name: '/notfound', page: () => const UnknownRoutePage()),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Home(), binding: Binding()),
        GetPage(
            name: '/transfer',
            page: () => const Transfer(),
            binding: TransferBinding()),
        GetPage(
            name: '/transfer_landscape',
            page: () => const TransferLandscape(),
            binding: TransferBinding()),
      ],
      initialBinding: Binding(),
      title: "Cryptocurrency App",
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
