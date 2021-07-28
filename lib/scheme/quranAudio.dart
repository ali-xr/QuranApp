import 'dart:io';

class QuranAudio {
  File audioFile;
  String? name;
  String? description;
  String? arabic;
  int? id;

  QuranAudio({required this.audioFile, this.name, this.id, this.description, this.arabic});
}