// ignore_for_file: prefer_const_constructors
import '/web/screens/catalog_screen.dart';
import '/web/screens/contact_screen.dart';
import '/web/screens/employment.dart';
import '/web/screens/video_view_screen.dart';
import '/web/widget/overview.dart';
import 'package:flutter/material.dart';
import '../widget/appbar_view.dart';
// import 'package:';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    OverView(),
    CatalogScreen(),
    VideoViewScreen(),
    Contactcreen(),
    Employment(),
  ];
  @override
  Widget build(BuildContext context) {
    // final _index = Provider.of<AppBarView>(context).index;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: primaryColor,
        title: AppBarView(),
        toolbarHeight: 120,
      ),
      body: OverView(),
    );
  }
}
