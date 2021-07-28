import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';
import 'package:qurann/pages/audioPlayer.dart';
import 'package:qurann/scheme/quranAudio.dart';

import 'borderNumber.dart';

class AudioItemWidget extends StatefulWidget {
  const AudioItemWidget({ required this.index, Key? key}) : super(key: key);
  final int index;

  @override
  _AudioItemWidgetState createState() => _AudioItemWidgetState();
}

class _AudioItemWidgetState extends State<AudioItemWidget> {
  QuranAudio? item;

  @override
  void initState() {
    super.initState();
    item = QuranApp.variables.listAudio[widget.index];
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: BorderNumber(number: item!.id!),
      ),
      title: Text("${item!.name}", style: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      subtitle: Text("${item!.description}"),
      trailing: Text("${item!.arabic}", style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(163, 129, 80, 1),
          fontSize: 20.0),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuranAudioPlayer(index: widget.index))).then((value) => QuranApp.variables.audioPlayer.stop());
      },
    );
  }
}
