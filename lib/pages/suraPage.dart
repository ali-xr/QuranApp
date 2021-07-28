import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';
import 'package:qurann/scheme/quran.dart';
import 'package:qurann/widgets/borderNumber.dart';
import 'package:qurann/widgets/listItemWidget.dart';

class SuraPage extends StatefulWidget {
  @override
  _SuraPageState createState() => _SuraPageState();
}

class _SuraPageState extends State<SuraPage> {
  List listItemList = QuranApp.variables.korsat;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  toolbarHeight: 190.0,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Logo',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        height: 120.0,
                        margin: EdgeInsets.only(top: 18.0),
                        padding: EdgeInsets.all(25.0),
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          "Suralar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverAppBar(
                  backgroundColor: Colors.grey.shade100,
                  elevation: 0.0,
                  toolbarHeight: 70.0,
                  pinned: true,
                  title: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        border: InputBorder.none,
                        filled: true,
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                        hintText: "Suralarni qidirish",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      onChanged: _search,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(100.0, 40.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TabBar(
                          dragStartBehavior: DragStartBehavior.down,
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                          labelColor: Color.fromRGBO(197, 162, 110, 1),
                          unselectedLabelColor: Colors.grey.shade400,
                          indicatorColor: Color.fromRGBO(197, 162, 110, 1),
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(text: 'Surah'),
                            Tab(text: 'Pora'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                QuranApp.variables.korsat.length == 0
                    ? surahClass()
                    : surahOffClass(),
                poraClass(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget surahOffClass() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) {
        return ListItemWidget(item: listItemList[index]);
      },
      itemCount: listItemList.length,
    );
  }

  Widget surahClass() {
    return FutureBuilder<List<Quran>>(
        future: QuranApp.variables.futureListItem,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuranApp.variables.korsat = snapshot.data!;
            listItemList = QuranApp.variables.korsat;
            return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, index) {
                return ListItemWidget(item: listItemList[index]);
              },
              itemCount: listItemList.length,
            );
          } else {
            return Center(
              child: Container(
                child: CupertinoActivityIndicator(
                  radius: 20.0,
                ),
              ),
            );
          }
        });
  }

  Widget poraClass() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: BorderNumber(number: index + 1),
              title: Text("${index + 1} - Pora"),
              subtitle: Text("1 - 65 oyatlar"),
            ),
            Divider()
          ],
        );
      },
      itemCount: 30,
    );
  }

  _search(String? text) {
    listItemList = [];
    
    final List<Quran> searchedList = [];
    for (int i = 0; i < QuranApp.variables.korsat.length; i++) {
      Quran item = QuranApp.variables.korsat[i];
      if (item.name!.transliteration!.en
          .toLowerCase()
          .contains(text!.toLowerCase())) {
        searchedList.add(item);
      }
    }

    setState(() {
      listItemList = searchedList;
    });
  }
}
