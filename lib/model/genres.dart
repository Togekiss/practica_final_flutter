class GenresDecoder {
  bool family;
  Links lLinks;
  Segment segment;

  GenresDecoder({this.family, this.lLinks, this.segment});

  GenresDecoder.fromJson(Map<String, dynamic> json) {
    family = json['family'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    segment =
    json['segment'] != null ? new Segment.fromJson(json['segment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['family'] = this.family;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    if (this.segment != null) {
      data['segment'] = this.segment.toJson();
    }
    return data;
  }
}

class Links {
  Self self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Segment {
  String id;
  String name;
  String locale;
  String primaryId;
  Links lLinks;
  Embedded eEmbedded;

  Segment(
      {this.id,
        this.name,
        this.locale,
        this.primaryId,
        this.lLinks,
        this.eEmbedded});

  Segment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    locale = json['locale'];
    primaryId = json['primaryId'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    eEmbedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['locale'] = this.locale;
    data['primaryId'] = this.primaryId;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded.toJson();
    }
    return data;
  }
}

class Embedded {
  List<Genres> genres;

  Embedded({this.genres});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genres {
  String id;
  String name;
  String locale;
  Links lLinks;
  EmbeddedSub eEmbedded;

  Genres({this.id, this.name, this.locale, this.lLinks, this.eEmbedded});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    locale = json['locale'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    eEmbedded = json['_embedded'] != null
        ? new EmbeddedSub.fromJson(json['_embedded'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['locale'] = this.locale;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded.toJson();
    }
    return data;
  }
}

class EmbeddedSub {
  List<Subgenres> subgenres;

  EmbeddedSub({this.subgenres});

  EmbeddedSub.fromJson(Map<String, dynamic> json) {
    if (json['subgenres'] != null) {
      subgenres = new List<Subgenres>();
      json['subgenres'].forEach((v) {
        subgenres.add(new Subgenres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subgenres != null) {
      data['subgenres'] = this.subgenres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subgenres {
  String id;
  String name;
  String locale;
  Links lLinks;

  Subgenres({this.id, this.name, this.locale, this.lLinks});

  Subgenres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    locale = json['locale'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['locale'] = this.locale;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}