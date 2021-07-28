import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';
import 'package:qurann/pages/qoriListPage.dart';
import 'package:qurann/scheme/quran.dart';
import 'package:qurann/scheme/quranAudio.dart';
import 'package:qurann/widgets/audioItemWidget.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
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
                            image: AssetImage(
                                "assets/images/music.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          "Audio",
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
                  pinned: true,
                  toolbarHeight: 70,
                  title: InkWell(
                    onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QoriListPage()))
                        .then((value) => setState(() {})),
                    child: Container(
                      height: 45.0,
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.wand_rays,
                            color: Color.fromRGBO(197, 162, 110, 1),
                            size: 18.0,
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: Text(
                              'Qorini tanlash',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Icon(
                            CupertinoIcons.forward,
                            color: Color.fromRGBO(197, 162, 110, 1),
                            size: 18.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(100.0, 40.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.mic_fill,
                                size: 16.0, color: Colors.grey.shade400),
                            SizedBox(width: 12.0),
                            Text(
                                '${QuranApp.variables.qorialar[QuranApp.variables.currentQoriIndex]}',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 14.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: QuranApp.variables.listAudio.length != 0 ? audioOffList() : audioFutureList(),
          ),
        ),
      ),
    );
  }

  Widget audioOffList() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) {
        return AudioItemWidget(index: index);
      },
      itemCount: QuranApp.variables.listAudio.length,
    );
  }

  Widget audioFutureList() {
    return FutureBuilder<List<Quran>>(
      future: QuranApp.variables.futureListItem,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          QuranApp.variables.korsat = snapshot.data!;
          QuranApp.variables.listAudio = List.generate(
            QuranApp.variables.korsat.length,
            (index) => QuranAudio(
              audioFile: QuranApp.variables.listAudioFile[index],
              name: QuranApp.variables.korsat[index].name!.transliteration!.en,
              id: index+1,
              description:
                  "${QuranApp.variables.korsat[index].revelation!.en} - ${QuranApp.variables.korsat[index].numberOfVerses} oyat",
              arabic: QuranApp.variables.korsat[index].name!.short!,
            ),
          );
          return ListView.builder(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            itemBuilder: (context, index) {
              return AudioItemWidget(index: index);
            },
            itemCount: QuranApp.variables.listAudio.length,
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
      },
    );
  }
}
