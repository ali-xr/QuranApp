import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qurann/scheme/quran.dart';
import 'package:qurann/scheme/variables.dart';

class QuranApp extends StatefulWidget {
  static Variables variables = Variables();

  @override
  _QuranAppState createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> with TickerProviderStateMixin {
  late PageController pageController;
  var backcolor = Color.fromRGBO(229, 211, 185, 1);
  var backUncolor = Color.fromRGBO(239, 239, 239, 1);
  Color color = Color.fromRGBO(163, 129, 80, 1);
  Color uncolor = Color.fromRGBO(209, 209, 209, 1);

  @override
  void initState() {
    super.initState();
    QuranApp.variables.futureListItem = _malumotlarOlibKel();
    QuranApp.variables.tabController = TabController(
      vsync: this,
      length: 2,
    );

    _openFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: QuranApp.variables.pageList[QuranApp.variables.selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: buttombar(),
        ),
      ),
    );
  }

  Widget buttombar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 25.0,
                backgroundColor: QuranApp.variables.selectedIndex == 0
                    ? backcolor
                    : backUncolor,
                child: ImageIcon(
                  AssetImage(
                      "assets/images/holyquran.png"),
                  color:
                      QuranApp.variables.selectedIndex == 0 ? color : uncolor,
                )),
            label: 'Suralar'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
              radius: 25.0,
              backgroundColor: QuranApp.variables.selectedIndex == 1
                  ? backcolor
                  : backUncolor,
              child: Icon(
                CupertinoIcons.mic_fill,
                color: QuranApp.variables.selectedIndex == 1 ? color : uncolor,
              )),
          label: 'Audio',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
              radius: 25.0,
              backgroundColor: QuranApp.variables.selectedIndex == 2
                  ? backcolor
                  : backUncolor,
              child: Icon(
                CupertinoIcons.list_bullet,
                color: QuranApp.variables.selectedIndex == 2 ? color : uncolor,
              )),
          label: 'Sozlamalar',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: QuranApp.variables.selectedIndex,
      selectedItemColor: color,
      unselectedItemColor: uncolor,
      iconSize: 40,
      onTap: (index) {
        setState(() {
          QuranApp.variables.selectedIndex = index;
        });
      },
      elevation: 2,
    );
  }

  Future<List<Quran>> _malumotlarOlibKel() async {
    final response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/sutanlab/quran-api/master/data/quran.json"));
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return (map["data"] as List).map((e) => Quran.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load albom");
    }
  }

  _openFolder() async {
    final directory = Directory("storage/emulated/0/My Quran ");
    final PermissionStatus status = await Permission.storage.status;

    if (!status.isGranted) {
      await Permission.storage.request();
    }

    if (!(await directory.exists())) {
      directory.create();
    }

    List audioList = Directory(directory.path).listSync(recursive: true);
    for (var item in audioList) {
      QuranApp.variables.listAudioFile.add(item);
    }
  }
}
