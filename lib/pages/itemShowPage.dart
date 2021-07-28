import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';
import 'package:qurann/scheme/quran.dart';

class ItemshowPage extends StatefulWidget {
  const ItemshowPage({required this.itemlar, Key? key}) : super(key: key);
  final Quran itemlar;

  @override
  _ItemshowPageState createState() => _ItemshowPageState();
}

class _ItemshowPageState extends State<ItemshowPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Quran? item;

  @override
  void initState() {
    super.initState();
    item = widget.itemlar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
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
            SizedBox(width: 20.0),
            Text(
              "${item!.name!.transliteration!.en}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 21.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search, color: Colors.grey),
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              toolbarHeight: 260.0,
              title: Container(
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/vector.png"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${item!.name!.transliteration!.en} surasi",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 26.0,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "${QuranApp.variables.qorialar[QuranApp.variables.currentQoriIndex]}",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15.0),
                      Divider(
                        indent: 40,
                        endIndent: 40,
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "${item!.revelation!.en} - ${item!.numberOfVerses} oyat",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        height: 48.0,
                        width: 214.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/lolo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 20.0),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromRGBO(163, 129, 80, 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 16.0,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.share_outlined, color: Colors.grey),
                              SizedBox(width: 20.0),
                              Icon(CupertinoIcons.play_arrow,
                                  color: Colors.grey),
                              SizedBox(width: 15.0),
                              Icon(CupertinoIcons.bookmark, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      widget.itemlar.verses![index].text!.arab!,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.itemlar.verses![index].translation!.en,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(
                  height: 10,
                  thickness: 2.0,
                ),
                SizedBox(height: 10.0),
              ],
            );
          },
          itemCount: widget.itemlar.verses!.length,
        ),
      ),
    );
  }

  play(index) async {
    print(widget.itemlar.verses![index].audio!.secondary![1]);
    int result = await audioPlayer
        .play(widget.itemlar.verses![index].audio!.secondary![1]);
    return result;
  }
}
