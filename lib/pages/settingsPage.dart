import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qurann/app/quranApp.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              AppBar(
                toolbarHeight: 190.0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                elevation: 0.0,
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
                              "assets/images/quranpage.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        "Sozlamalar",
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return LangAlertDiaolg();
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage(
                                  "assets/images/logo9.png"),
                              size: 25.0,
                              color: Color.fromRGBO(198, 162, 110, 1),
                            ),
                            SizedBox(width: 15.0),
                            Expanded(
                              child: Text(
                                "Tilni o’zgartirish",
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                size: 16.0, color: Colors.grey)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return LangAlertDiaolg();
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.bookmark_fill,
                                color: Color.fromRGBO(198, 162, 110, 1)),
                            SizedBox(width: 15.0),
                            Expanded(
                              child: Text(
                                "Saqlangar",
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                size: 16.0, color: Colors.grey)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LangAlertDiaolg();
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.send,
                                color: Color.fromRGBO(198, 162, 110, 1)),
                            SizedBox(width: 15.0),
                            Expanded(
                              child: Text(
                                "Telegram botga o'tish",
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                size: 16.0, color: Colors.grey)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      "Biz Haqimizda",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(65, 65, 65, 1)),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Ushbu ilova orqali siz muqaddas Qur’oni Karimdagi 114 suraning arabcha va o’zbekcha matnini o’qishingiz va audio qiroatini tinglashingiz mumkin. Ilovamizda 200 dan ortiq qorilarning qiroati keltirilgan. Siz ilovani 4 xil tilda ishlata olishingiz mumkin.",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          height: 1.5),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Ilova Pixer jamoasi tomonidan tuzildi",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade400),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LangAlertDiaolg extends StatefulWidget {
  const LangAlertDiaolg({ Key? key }) : super(key: key);

  @override
  LangAlertDiaolgState createState() => LangAlertDiaolgState();
}

class LangAlertDiaolgState extends State<LangAlertDiaolg> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 70.0,
        height: 230.0,
        padding: EdgeInsets.symmetric(
          // vertical: 25.0,
          horizontal: 25.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonLang(index: 0, name: "O'zbek tili"),
            Divider(color: Colors.grey.shade400),
            SizedBox(height: 10.0),
            buttonLang(index: 1, name: "Русский язык"),
            Divider(color: Colors.grey.shade400),
            SizedBox(height: 10.0),
            buttonLang(index: 2, name: "English"),
            Divider(color: Colors.grey.shade400),
            SizedBox(height: 10.0),
            buttonLang(index: 3, name: "Turkish"),
          ],
        ),
      ),
    );
  }

  Widget buttonLang({index, name}) {
    Color textColor = Colors.grey.shade400;
    Color iconColor = Colors.transparent;

    if (index == QuranApp.variables.currentLang) {
      textColor = Colors.black;
      iconColor = Colors.green;
    }

    return GestureDetector(
      onTap: (){
        setState(() {
          QuranApp.variables.currentLang = index;
        });
      },
      child: Row(
        children: [
          Expanded(
              child: Text("$name", style: TextStyle(color: textColor, fontSize: 17.0))),
          Icon(CupertinoIcons.checkmark_circle_fill, color: iconColor),
        ],
      ),
    );
  }
}
