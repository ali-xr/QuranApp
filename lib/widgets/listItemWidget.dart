import 'package:flutter/material.dart';
import 'package:qurann/pages/itemShowPage.dart';
import 'package:qurann/scheme/quran.dart';

import 'borderNumber.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({ required this.item, Key? key}) : super(key: key);
  final Quran item;

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: BorderNumber(number: widget.item.number!),
      ),
      title: Text(widget.item.name!.transliteration!.en, style: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      subtitle: Text("${widget.item.revelation!.en} - ${widget.item.numberOfVerses} oyat"),
      trailing: Text(widget.item.name!.short!, style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(163, 129, 80, 1),
          fontSize: 20.0),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemshowPage(itemlar: widget.item,)));
      },
    );
  }
}
