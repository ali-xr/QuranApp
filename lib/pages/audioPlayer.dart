import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';
import 'package:qurann/scheme/quranAudio.dart';

class QuranAudioPlayer extends StatefulWidget {
  final int index;
  QuranAudioPlayer({required this.index});

  @override
  _QuranAudioPlayerState createState() => _QuranAudioPlayerState();
}

class _QuranAudioPlayerState extends State<QuranAudioPlayer> {
  int index = 0;
  QuranAudio? item;
  Duration currentValue = Duration(milliseconds: 0);
  Duration maxValue = Duration(milliseconds: 0);
  bool audioPlayerOnOff = false;

  @override
  void initState() {
    super.initState();
    index = widget.index;
    item = QuranApp.variables.listAudio[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: InkWell(
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bookmark, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined, color: Colors.black),
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 40.0),
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
                        "${item!.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 26.0,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "${QuranApp.variables.qorialar[QuranApp.variables.currentQoriIndex]}",
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.white),
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
                        "${item!.description}",
                        style: TextStyle(
                          fontSize: 16.0,
                            fontWeight: FontWeight.w400, color: Colors.white),
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
            Column(
              children: [
                ProgressBar(
                  progress: currentValue,
                  total: maxValue,
                  thumbColor: Color.fromRGBO(197, 162, 110, 1),
                  baseBarColor: Colors.grey.shade300,
                  thumbGlowColor: Color.fromRGBO(197, 162, 110, 1),
                  bufferedBarColor: Colors.blue,
                  buffered: Duration(milliseconds: 1200),
                  progressBarColor: Color.fromRGBO(197, 162, 110, 1),
                  thumbGlowRadius: 8.0,
                  thumbRadius: 5.0,
                  barHeight: 4.0,
                  timeLabelLocation: TimeLabelLocation.none,
                  timeLabelTextStyle: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  onSeek: _seeked,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatDuration(currentValue),
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w300)),
                    Text(_formatDuration(maxValue),
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: _back,
                      child: Icon(CupertinoIcons.backward_end_fill, size: 20.0),
                    ),
                    InkWell(
                      child: Icon(CupertinoIcons.arrow_counterclockwise),
                      onTap: _arrow_to_back,
                    ),
                    InkWell(
                      onTap: _play,
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(197, 162, 110, 1),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                            audioPlayerOnOff
                                ? CupertinoIcons.pause_solid
                                : CupertinoIcons.play_fill,
                            size: 25.0,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: _arrow_to_next,
                      child: Icon(CupertinoIcons.arrow_clockwise),
                    ),
                    InkWell(
                      onTap: _next,
                      child: Icon(CupertinoIcons.forward_end_fill, size: 20.0),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                // ListView.builder(itemBuilder: )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _play() async {
    int result;
    if (audioPlayerOnOff) {
      result = await QuranApp.variables.audioPlayer.pause();
      setState(() {
        audioPlayerOnOff = !audioPlayerOnOff;
      });
    } else {
      result = await QuranApp.variables.audioPlayer.play(item!.audioFile.path, isLocal: true);
      setState(() {
        audioPlayerOnOff = !audioPlayerOnOff;
      });
    }

    QuranApp.variables.audioPlayer.onAudioPositionChanged.listen(
      (event) {
        setState(
          () {
            currentValue = event;
          },
        );
      },
    );

    QuranApp.variables.audioPlayer.onPlayerCompletion.listen((event) async {
      await QuranApp.variables.audioPlayer.stop();
      if (widget.index + 1 == QuranApp.variables.listAudio.length) {
        setState(() {
          index = 0;
          item = QuranApp.variables.listAudio[index];
        });
      } else {
        setState(() {
          index++;
          item = QuranApp.variables.listAudio[index];
        });
      }

      await QuranApp.variables.audioPlayer.play(item!.audioFile.path, isLocal: true);
    });

    QuranApp.variables.audioPlayer.onDurationChanged.listen(
      (event) {
        setState(
          () {
            maxValue = event;
          },
        );
      },
    );

    return result;
  }

  _next() async {
    if (index + 1 == QuranApp.variables.listAudio.length) {
      index = 0;
      setState(() {
        item = QuranApp.variables.listAudio[index];
      });
    } else {
      index++;
      setState(() {
        item = QuranApp.variables.listAudio[index];
      });
    }
    if (audioPlayerOnOff) {
      setState(() {
        audioPlayerOnOff = !audioPlayerOnOff;
      });
    }
    
    await _play();
  }

  _back() async {
    if (index - 1 == -1) {
      setState(() {
        index = QuranApp.variables.listAudio.length - 1;
        item = QuranApp.variables.listAudio[index];
      });
    } else {
      setState(() {
        index--;
        item = QuranApp.variables.listAudio[index];
      });
    }

    if (!audioPlayerOnOff) {
      setState(() {
        audioPlayerOnOff = !audioPlayerOnOff;
      });
    }

    await QuranApp.variables.audioPlayer.play(item!.audioFile.path, isLocal: true);
  }

  // ignore: non_constant_identifier_names
  _arrow_to_next() async {
    Duration duration;

    if (!(currentValue.inSeconds + 30 >= maxValue.inSeconds)) {
      duration = Duration(seconds: currentValue.inSeconds + 30);
    } else {
      duration = Duration(seconds: maxValue.inSeconds);
    }

    await QuranApp.variables.audioPlayer.seek(duration);
    setState(() {
      currentValue = duration;
    });
  }

  // ignore: non_constant_identifier_names
  _arrow_to_back() async {
    Duration duration;

    if (currentValue.inSeconds - 30 <= 0) {
      duration = Duration(seconds: 0);
    } else {
      duration = Duration(seconds: currentValue.inSeconds - 30);
    }

    await QuranApp.variables.audioPlayer.seek(duration);
    setState(() {
      currentValue = duration;
    });
  }

  _seeked(duration) async {
    print(duration);
    await QuranApp.variables.audioPlayer.seek(duration);
    setState(() {
      currentValue = duration;
    });
  }

  static String _formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds~/Duration.secondsPerDay;
    seconds -= days*Duration.secondsPerDay;
    final hours = seconds~/Duration.secondsPerHour;
    seconds -= hours*Duration.secondsPerHour;
    final minutes = seconds~/Duration.secondsPerMinute;
    seconds -= minutes*Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('$days');
    }
    if (tokens.isNotEmpty || hours != 0){
      tokens.add('$hours');
    }
    if (!tokens.isNotEmpty) {
      tokens.add('$minutes');
    }
    tokens.add('${seconds.toString().length == 1 ? "0" + seconds.toString() : seconds.toString()}');

    return tokens.join(':');
  }
}
