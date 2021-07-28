import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:qurann/pages/audioPage.dart';
import 'package:qurann/pages/settingsPage.dart';
import 'package:qurann/pages/suraPage.dart';
import 'package:qurann/scheme/quran.dart';
import 'package:qurann/scheme/quranAudio.dart';
class Variables{
  TabController? tabController;
  AudioPlayer audioPlayer = AudioPlayer();

  Future<List<Quran>>? futureListItem;
  Future<List<QuranAudio>>? futureAudioListItem;

  List juz = [];
  List<Quran> korsat = [];
  List<QuranAudio> listAudio = [];
  List<File> listAudioFile = [];

  int selectedIndex = 0;
  int currentQoriIndex = 0;
  int currentLang = 0;

  List pageList = [SuraPage(), AudioPage(), SettingsPage()];

  List<String> qorialar = [
  "Maher al Maeqli",
  "Abdulbasit Abdulsamad",
  "Raad al Kurdi",
  "Abdulrahman Alsudaes",
  "Mohammed Siddiq Al-Minshawi",
  "Mishary bin Rashid Alafasy",
  "Mahmoud Khalil Al-Husary",
  "Omar Hisham Al Arabi",
  "Ibrahim Walk",
  "Muhammad Ayyoub",
  "Saad Al-Ghamdi",
  "Salah Bukhatir",
];
}
