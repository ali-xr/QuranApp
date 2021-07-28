import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';
import 'package:qurann/widgets/borderNumber.dart';

class QoriListPage extends StatefulWidget {
  const QoriListPage({Key? key}) : super(key: key);

  @override
  _QoriListPageState createState() => _QoriListPageState();
}

class _QoriListPageState extends State<QoriListPage> {
  List<String> listItemList = QuranApp.variables.qorialar;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                toolbarHeight: 200.0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey.shade200,
                        ),
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.black,
                        ),
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
                          image: AssetImage("assets/images/qorilar.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        "Qorilar",
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
                automaticallyImplyLeading: false,
                backgroundColor: Colors.grey.shade100,
                elevation: 0.0,
                toolbarHeight: 70.0,
                pinned: true,
                title: Container(
                  height: 60.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
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
                      hintText: "Qorilarni qidirish",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onChanged: _search,
                  ),
                ),
              ),
            ];
          },
          body: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            itemBuilder: (context, index) {
              return makeListTile(index: index);
            },
            itemCount: listItemList.length,
          ),
        ),
      ),
    );
  }

  makeListTile({index}) {
    String qori = listItemList[index];
    Color dividerColor = Colors.grey.shade300;
    Color currentColor = Colors.transparent;
    Color textColor = Colors.grey.shade400;

    if (QuranApp.variables.currentQoriIndex == index) {
      dividerColor = Colors.grey;
      currentColor = Colors.green;
      textColor = Colors.black;
    }

    return InkWell(
      onTap: () {
        setState(() {
          QuranApp.variables.currentQoriIndex = index;
        });
      },
      child: Column(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            leading: BorderNumber(number: index + 1),
            title: Text(
              "$qori",
              style: TextStyle(color: textColor),
            ),
            trailing: Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: currentColor,
              size: 18.0,
            ),
          ),
          Divider(
            color: dividerColor,
            height: 0.0,
          ),
        ],
      ),
    );
  }

  _search(String? text) {
    listItemList = [];

    final List<String> searchedList = [];
    for (int i = 0; i < QuranApp.variables.qorialar.length; i++) {
      String item = QuranApp.variables.qorialar[i];
      if (item.toLowerCase().contains(text!.toLowerCase())) {
        searchedList.add(item);
      }
    }

    setState(() {
      listItemList = searchedList;
    });
  }
}
