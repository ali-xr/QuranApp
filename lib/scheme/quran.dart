class Quran {

  int? number;
  int? sequence;
  int? numberOfVerses;
  Name? name;
  Revelation? revelation;
  QuranTafsir? tafsir;
  dynamic preBismillah;
  List<Verse>? verses;

  Quran.fromJson(Map<String, dynamic> json):
        number = json["number"],
        sequence = json["sequence"],
        numberOfVerses = json["numberOfVerses"],
        name = Name.fromJson(json["name"]),
        revelation = Revelation.fromJson(json["revelation"]),
        tafsir = QuranTafsir.fromJson(json["tafsir"]),
        preBismillah = json["preBismillah"],
        verses = List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x)));
}

class Name {

  String? short;
  String? long;
  Translation? transliteration;
  Translation? translation;

  Name.fromJson(Map<String, dynamic> json):
        short = json["short"],
        long = json["long"],
        transliteration = Translation.fromJson(json["transliteration"]),
        translation = Translation.fromJson(json["translation"]);
}

class Translation {

  String en;
  String id;

  Translation.fromJson(Map<String, dynamic> json):
        en = json["en"],
        id = json["id"];
}

class Revelation {

  String? arab;
  String? en;
  String? id;

  Revelation.fromJson(Map<String, dynamic> json):
        arab = json["arab"],
        en = json["en"],
        id = json["id"];
}

class QuranTafsir {

  String? id;

  QuranTafsir.fromJson(Map<String, dynamic> json):
        id = json["id"];
}

class Verse {

  Number? number;
  Meta? meta;
  Text2? text;
  Translation? translation;
  Audio? audio;
  VerseTafsir? tafsir;

  Verse.fromJson(Map<String, dynamic> json):
        number = Number.fromJson(json["number"]),
        meta = Meta.fromJson(json["meta"]),
        text = Text2.fromJson(json["text"]),
        translation = Translation.fromJson(json["translation"]),
        audio = Audio.fromJson(json["audio"]),
        tafsir = VerseTafsir.fromJson(json["tafsir"]);
}

class Audio {

  String? primary;
  List<String>? secondary;

  Audio.fromJson(Map<String, dynamic> json):
        primary = json["primary"],
        secondary = List<String>.from(json["secondary"].map((x) => x));
}

class Meta {

  int? juz;
  int? page;
  int? manzil;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;

  Meta.fromJson(Map<String, dynamic> json):
        juz = json["juz"],
        page = json["page"],
        manzil = json["manzil"],
        ruku = json["ruku"],
        hizbQuarter = json["hizbQuarter"],
        sajda = Sajda.fromJson(json["sajda"]);
}

class Sajda {

  bool? recommended;
  bool? obligatory;

  Sajda.fromJson(Map<String, dynamic> json):
        recommended = json["recommended"],
        obligatory = json["obligatory"];
}

class Number {

  int? inQuran;
  int? inSurah;

  Number.fromJson(Map<String, dynamic> json):
        inQuran = json["inQuran"],
        inSurah = json["inSurah"];
}

class VerseTafsir {

  Id? id;

  VerseTafsir.fromJson(Map<String, dynamic> json):
        id = Id.fromJson(json["id"]);
}

class Id {

  String? short;
  String? long;

  Id.fromJson(Map<String, dynamic> json):
        short = json["short"],
        long = json["long"];
}

class Text2 {

  String? arab;
  Transliteration? transliteration;

  Text2.fromJson(Map<String, dynamic> json):
        arab = json["arab"],
        transliteration = Transliteration.fromJson(json["transliteration"]);
}

class Transliteration {

  String? en;

  Transliteration.fromJson(Map<String, dynamic> json) :
        en = json["en"];
}
