class EventsDecoder {
  Embedded eEmbedded;
  Links lLinks;
  Page page;

  EventsDecoder({this.eEmbedded, this.lLinks, this.page});

  EventsDecoder.fromJson(Map<String, dynamic> json) {
    eEmbedded = json['_embedded'] != null
        ? new Embedded  .fromJson(json['_embedded'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    return data;
  }
}

class Embedded {
  List<Events> events;

  Embedded({this.events});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = new List<Events>();
      json['events'].forEach((v) {
        events.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String name;
  String type;
  String id;
  bool test;
  String url;
  String locale;
  List<Images> images;
  Sales sales;
  Dates dates;
  List<Classifications> classifications;
  Segment promoter;
  List<Promoters> promoters;
  Seatmap seatmap;
  Links lLinks;
  Embedded2 eEmbedded;

  Events(
      {this.name,
        this.type,
        this.id,
        this.test,
        this.url,
        this.locale,
        this.images,
        this.sales,
        this.dates,
        this.classifications,
        this.promoter,
        this.promoters,
        this.seatmap,
        this.lLinks,
        this.eEmbedded});

  Events.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    id = json['id'];
    test = json['test'];
    url = json['url'];
    locale = json['locale'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    sales = json['sales'] != null ? new Sales.fromJson(json['sales']) : null;
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    if (json['classifications'] != null) {
      classifications = new List<Classifications>();
      json['classifications'].forEach((v) {
        classifications.add(new Classifications.fromJson(v));
      });
    }
    promoter = json['promoter'] != null
        ? new Segment.fromJson(json['promoter'])
        : null;
    if (json['promoters'] != null) {
      promoters = new List<Promoters>();
      json['promoters'].forEach((v) {
        promoters.add(new Promoters.fromJson(v));
      });
    }
    seatmap =
    json['seatmap'] != null ? new Seatmap.fromJson(json['seatmap']) : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    eEmbedded = json['_embedded'] != null
        ? new Embedded2.fromJson(json['_embedded'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['id'] = this.id;
    data['test'] = this.test;
    data['url'] = this.url;
    data['locale'] = this.locale;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.sales != null) {
      data['sales'] = this.sales.toJson();
    }
    if (this.dates != null) {
      data['dates'] = this.dates.toJson();
    }
    if (this.classifications != null) {
      data['classifications'] =
          this.classifications.map((v) => v.toJson()).toList();
    }
    if (this.promoter != null) {
      data['promoter'] = this.promoter.toJson();
    }
    if (this.promoters != null) {
      data['promoters'] = this.promoters.map((v) => v.toJson()).toList();
    }
    if (this.seatmap != null) {
      data['seatmap'] = this.seatmap.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded.toJson();
    }
    return data;
  }
}

class Promoters {
  String id;
  String name;


  Promoters({this.id, this.name});

  Promoters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Images {
  String ratio;
  String url;
  int width;
  int height;
  bool fallback;

  Images({this.ratio, this.url, this.width, this.height, this.fallback});

  Images.fromJson(Map<String, dynamic> json) {
    ratio = json['ratio'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    fallback = json['fallback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratio'] = this.ratio;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['fallback'] = this.fallback;
    return data;
  }
}

class Sales {
  Public public;

  Sales({this.public});

  Sales.fromJson(Map<String, dynamic> json) {
    public =
    json['public'] != null ? new Public.fromJson(json['public']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.public != null) {
      data['public'] = this.public.toJson();
    }
    return data;
  }
}

class Public {
  String startDateTime;
  bool startTBD;
  String endDateTime;

  Public({this.startDateTime, this.startTBD, this.endDateTime});

  Public.fromJson(Map<String, dynamic> json) {
    startDateTime = json['startDateTime'];
    startTBD = json['startTBD'];
    endDateTime = json['endDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDateTime'] = this.startDateTime;
    data['startTBD'] = this.startTBD;
    data['endDateTime'] = this.endDateTime;
    return data;
  }
}

class Dates {
  Start start;
  String timezone;
  Status status;
  bool spanMultipleDays;
  Access access;

  Dates(
      {this.start,
        this.timezone,
        this.status,
        this.spanMultipleDays,
        this.access});

  Dates.fromJson(Map<String, dynamic> json) {
    start = json['start'] != null ? new Start.fromJson(json['start']) : null;
    timezone = json['timezone'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    spanMultipleDays = json['spanMultipleDays'];
    access =
    json['access'] != null ? new Access.fromJson(json['access']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.start != null) {
      data['start'] = this.start.toJson();
    }
    data['timezone'] = this.timezone;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    data['spanMultipleDays'] = this.spanMultipleDays;
    if (this.access != null) {
      data['access'] = this.access.toJson();
    }
    return data;
  }
}

class Start {
  String localDate;
  String localTime;
  String dateTime;
  bool dateTBD;
  bool dateTBA;
  bool timeTBA;
  bool noSpecificTime;

  Start(
      {this.localDate,
        this.localTime,
        this.dateTime,
        this.dateTBD,
        this.dateTBA,
        this.timeTBA,
        this.noSpecificTime});

  Start.fromJson(Map<String, dynamic> json) {
    localDate = json['localDate'];
    localTime = json['localTime'];
    dateTime = json['dateTime'];
    dateTBD = json['dateTBD'];
    dateTBA = json['dateTBA'];
    timeTBA = json['timeTBA'];
    noSpecificTime = json['noSpecificTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localDate'] = this.localDate;
    data['localTime'] = this.localTime;
    data['dateTime'] = this.dateTime;
    data['dateTBD'] = this.dateTBD;
    data['dateTBA'] = this.dateTBA;
    data['timeTBA'] = this.timeTBA;
    data['noSpecificTime'] = this.noSpecificTime;
    return data;
  }
}

class Status {
  String code;

  Status({this.code});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}

class Access {
  String startDateTime;
  bool startApproximate;
  bool endApproximate;

  Access({this.startDateTime, this.startApproximate, this.endApproximate});

  Access.fromJson(Map<String, dynamic> json) {
    startDateTime = json['startDateTime'];
    startApproximate = json['startApproximate'];
    endApproximate = json['endApproximate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDateTime'] = this.startDateTime;
    data['startApproximate'] = this.startApproximate;
    data['endApproximate'] = this.endApproximate;
    return data;
  }
}

class Classifications {
  bool primary;
  Segment segment;
  Segment genre;
  Segment subGenre;
  bool family;

  Classifications(
      {this.primary, this.segment, this.genre, this.subGenre, this.family});

  Classifications.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    segment =
    json['segment'] != null ? new Segment.fromJson(json['segment']) : null;
    genre = json['genre'] != null ? new Segment.fromJson(json['genre']) : null;
    subGenre = json['subGenre'] != null
        ? new Segment.fromJson(json['subGenre'])
        : null;
    family = json['family'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    if (this.segment != null) {
      data['segment'] = this.segment.toJson();
    }
    if (this.genre != null) {
      data['genre'] = this.genre.toJson();
    }
    if (this.subGenre != null) {
      data['subGenre'] = this.subGenre.toJson();
    }
    data['family'] = this.family;
    return data;
  }
}

class Segment {
  String id;
  String name;

  Segment({this.id, this.name});

  Segment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Seatmap {
  String staticUrl;

  Seatmap({this.staticUrl});

  Seatmap.fromJson(Map<String, dynamic> json) {
    staticUrl = json['staticUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staticUrl'] = this.staticUrl;
    return data;
  }
}

class Links {
  Self self;
  List<Attractions> attractions;
  List<Venues> venues;

  Links({this.self, this.attractions, this.venues});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    if (json['attractions'] != null) {
      attractions = new List<Attractions>();
      json['attractions'].forEach((v) {
        attractions.add(new Attractions.fromJson(v));
      });
    }
    if (json['venues'] != null) {
      venues = new List<Venues>();
      json['venues'].forEach((v) {
        venues.add(new Venues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    if (this.attractions != null) {
      data['attractions'] = this.attractions.map((v) => v.toJson()).toList();
    }
    if (this.venues != null) {
      data['venues'] = this.venues.map((v) => v.toJson()).toList();
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

class Embedded2 {
  List<Venues> venues;
  List<Attractions> attractions;

  Embedded2({this.venues, this.attractions});

  Embedded2.fromJson(Map<String, dynamic> json) {
    if (json['venues'] != null) {
      venues = new List<Venues>();
      json['venues'].forEach((v) {
        venues.add(new Venues.fromJson(v));
      });
    }
    if (json['attractions'] != null) {
      attractions = new List<Attractions>();
      json['attractions'].forEach((v) {
        attractions.add(new Attractions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.venues != null) {
      data['venues'] = this.venues.map((v) => v.toJson()).toList();
    }
    if (this.attractions != null) {
      data['attractions'] = this.attractions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Venues {
  String name;
  String type;
  String id;
  bool test;
  String url;
  String locale;
  String postalCode;
  String timezone;
  City city;
  City state;
  Country country;
  Address address;
  Location location;
  UpcomingEvents upcomingEvents;
  Links2 lLinks;
  List<Images2> images;

  Venues(
      {this.name,
        this.type,
        this.id,
        this.test,
        this.url,
        this.locale,
        this.postalCode,
        this.timezone,
        this.city,
        this.state,
        this.country,
        this.address,
        this.location,
        this.upcomingEvents,
        this.lLinks,
        this.images});

  Venues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    id = json['id'];
    test = json['test'];
    url = json['url'];
    locale = json['locale'];
    postalCode = json['postalCode'];
    timezone = json['timezone'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    state = json['state'] != null ? new City.fromJson(json['state']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    upcomingEvents = json['upcomingEvents'] != null
        ? new UpcomingEvents.fromJson(json['upcomingEvents'])
        : null;
    lLinks = json['_links'] != null ? new Links2.fromJson(json['_links']) : null;
    if (json['images'] != null) {
      images = new List<Images2>();
      json['images'].forEach((v) {
        images.add(new Images2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['id'] = this.id;
    data['test'] = this.test;
    data['url'] = this.url;
    data['locale'] = this.locale;
    data['postalCode'] = this.postalCode;
    data['timezone'] = this.timezone;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.upcomingEvents != null) {
      data['upcomingEvents'] = this.upcomingEvents.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  String name;

  City({this.name});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Country {
  String name;
  String countryCode;

  Country({this.name, this.countryCode});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    return data;
  }
}

class Address {
  String line1;

  Address({this.line1});

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line1'] = this.line1;
    return data;
  }
}

class Location {
  String longitude;
  String latitude;

  Location({this.longitude, this.latitude});

  Location.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class UpcomingEvents {
  int iTotal;
  int mfxEs;
  int mfxBe;

  UpcomingEvents({this.iTotal, this.mfxEs, this.mfxBe});

  UpcomingEvents.fromJson(Map<String, dynamic> json) {
    iTotal = json['_total'];
    mfxEs = json['mfx-es'];
    mfxBe = json['mfx-be'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_total'] = this.iTotal;
    data['mfx-es'] = this.mfxEs;
    data['mfx-be'] = this.mfxBe;
    return data;
  }
}

class Links2 {
  Self self;

  Links2({this.self});

  Links2.fromJson(Map<String, dynamic> json) {
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

class Images2 {
  String ratio;
  String url;
  int width;
  int height;
  bool fallback;
  String attribution;

  Images2(
      {this.ratio,
        this.url,
        this.width,
        this.height,
        this.fallback,
        this.attribution});

  Images2.fromJson(Map<String, dynamic> json) {
    ratio = json['ratio'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    fallback = json['fallback'];
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratio'] = this.ratio;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['fallback'] = this.fallback;
    data['attribution'] = this.attribution;
    return data;
  }
}

class Attractions {
  String name;
  String type;
  String id;
  bool test;
  String url;
  String locale;
  ExternalLinks externalLinks;
  List<String> aliases;
  List<Images> images;
  List<Classifications2> classifications;
  UpcomingEvents2 upcomingEvents;
  Links3 lLinks;

  Attractions(
      {this.name,
        this.type,
        this.id,
        this.test,
        this.url,
        this.locale,
        this.externalLinks,
        this.aliases,
        this.images,
        this.classifications,
        this.upcomingEvents,
        this.lLinks});

  Attractions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    id = json['id'];
    test = json['test'];
    url = json['url'];
    locale = json['locale'];
    externalLinks = json['externalLinks'] != null
        ? new ExternalLinks.fromJson(json['externalLinks'])
        : null;
    aliases = null;
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['classifications'] != null) {
      classifications = new List<Classifications2>();
      json['classifications'].forEach((v) {
        classifications.add(new Classifications2.fromJson(v));
      });
    }
    upcomingEvents = json['upcomingEvents'] != null
        ? new UpcomingEvents2.fromJson(json['upcomingEvents'])
        : null;
    lLinks = json['_links'] != null ? new Links3.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['id'] = this.id;
    data['test'] = this.test;
    data['url'] = this.url;
    data['locale'] = this.locale;
    if (this.externalLinks != null) {
      data['externalLinks'] = this.externalLinks.toJson();
    }
    data['aliases'] = this.aliases;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.classifications != null) {
      data['classifications'] =
          this.classifications.map((v) => v.toJson()).toList();
    }
    if (this.upcomingEvents != null) {
      data['upcomingEvents'] = this.upcomingEvents.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

abstract class Source {
  String url;

  Source({this.url});

  Source.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Youtube extends Source{
  Youtube.fromJson(v);

}

class Twitter extends Source{
  Twitter.fromJson(v);

}

class Lastfm extends Source{
  Lastfm.fromJson(v);

}

class Facebook extends Source{
  Facebook.fromJson(v);

}

class Wiki extends Source{
  Wiki.fromJson(v);

}

class Homepage extends Source{
  Homepage.fromJson(v);

}

class Itunes extends Source{
  Itunes.fromJson(v);

}

class Instagram extends Source{
  Instagram.fromJson(v);

}

class ExternalLinks {
  List<Source> youtube;
  List<Twitter> twitter;
  List<Lastfm> lastfm;
  List<Facebook> facebook;
  List<Wiki> wiki;
  List<Musicbrainz> musicbrainz;
  List<Homepage> homepage;
  List<Itunes> itunes;
  List<Instagram> instagram;

  ExternalLinks(
      {this.youtube,
        this.twitter,
        this.lastfm,
        this.facebook,
        this.wiki,
        this.musicbrainz,
        this.homepage,
        this.itunes,
        this.instagram});

  ExternalLinks.fromJson(Map<String, dynamic> json) {
    if (json['youtube'] != null) {
      youtube = new List<Source>();
      json['youtube'].forEach((v) {
        youtube.add(new Youtube.fromJson(v));
      });
    }
    if (json['twitter'] != null) {
      twitter = new List<Twitter>();
      json['twitter'].forEach((v) {
        twitter.add(new Twitter.fromJson(v));
      });
    }
    if (json['lastfm'] != null) {
      lastfm = new List<Lastfm>();
      json['lastfm'].forEach((v) {
        lastfm.add(new Lastfm.fromJson(v));
      });
    }
    if (json['facebook'] != null) {
      facebook = new List<Facebook>();
      json['facebook'].forEach((v) {
        facebook.add(new Facebook.fromJson(v));
      });
    }
    if (json['wiki'] != null) {
      wiki = new List<Wiki>();
      json['wiki'].forEach((v) {
        wiki.add(new Wiki.fromJson(v));
      });
    }
    if (json['musicbrainz'] != null) {
      musicbrainz = new List<Musicbrainz>();
      json['musicbrainz'].forEach((v) {
        musicbrainz.add(new Musicbrainz.fromJson(v));
      });
    }
    if (json['homepage'] != null) {
      homepage = new List<Homepage>();
      json['homepage'].forEach((v) {
        homepage.add(new Homepage.fromJson(v));
      });
    }
    if (json['itunes'] != null) {
      itunes = new List<Itunes>();
      json['itunes'].forEach((v) {
        itunes.add(new Itunes.fromJson(v));
      });
    }
    if (json['instagram'] != null) {
      instagram = new List<Instagram>();
      json['instagram'].forEach((v) {
        instagram.add(new Instagram.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.youtube != null) {
      data['youtube'] = this.youtube.map((v) => v.toJson()).toList();
    }
    if (this.twitter != null) {
      data['twitter'] = this.twitter.map((v) => v.toJson()).toList();
    }
    if (this.lastfm != null) {
      data['lastfm'] = this.lastfm.map((v) => v.toJson()).toList();
    }
    if (this.facebook != null) {
      data['facebook'] = this.facebook.map((v) => v.toJson()).toList();
    }
    if (this.wiki != null) {
      data['wiki'] = this.wiki.map((v) => v.toJson()).toList();
    }
    if (this.musicbrainz != null) {
      data['musicbrainz'] = this.musicbrainz.map((v) => v.toJson()).toList();
    }
    if (this.homepage != null) {
      data['homepage'] = this.homepage.map((v) => v.toJson()).toList();
    }
    if (this.itunes != null) {
      data['itunes'] = this.itunes.map((v) => v.toJson()).toList();
    }
    if (this.instagram != null) {
      data['instagram'] = this.instagram.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Musicbrainz {
  String id;

  Musicbrainz({this.id});

  Musicbrainz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Classifications2 {
  bool primary;
  Segment segment;
  Segment genre;
  Segment subGenre;
  Segment type;
  Segment subType;
  bool family;

  Classifications2(
      {this.primary,
        this.segment,
        this.genre,
        this.subGenre,
        this.type,
        this.subType,
        this.family});

  Classifications2.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    segment =
    json['segment'] != null ? new Segment.fromJson(json['segment']) : null;
    genre = json['genre'] != null ? new Segment.fromJson(json['genre']) : null;
    subGenre = json['subGenre'] != null
        ? new Segment.fromJson(json['subGenre'])
        : null;
    type = json['type'] != null ? new Segment.fromJson(json['type']) : null;
    subType =
    json['subType'] != null ? new Segment.fromJson(json['subType']) : null;
    family = json['family'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    if (this.segment != null) {
      data['segment'] = this.segment.toJson();
    }
    if (this.genre != null) {
      data['genre'] = this.genre.toJson();
    }
    if (this.subGenre != null) {
      data['subGenre'] = this.subGenre.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    if (this.subType != null) {
      data['subType'] = this.subType.toJson();
    }
    data['family'] = this.family;
    return data;
  }
}

class UpcomingEvents2 {
  int iTotal;
  int mfxEs;
  int mfxBe;
  int mfxNl;
  int mfxAt;
  int tmr;
  int mfxDe;
  int ticketmaster;
  int mfxCz;
  int mfxCh;
  int mfxPl;

  UpcomingEvents2(
      {this.iTotal,
        this.mfxEs,
        this.mfxBe,
        this.mfxNl,
        this.mfxAt,
        this.tmr,
        this.mfxDe,
        this.ticketmaster,
        this.mfxCz,
        this.mfxCh,
        this.mfxPl});

  UpcomingEvents2.fromJson(Map<String, dynamic> json) {
    iTotal = json['_total'];
    mfxEs = json['mfx-es'];
    mfxBe = json['mfx-be'];
    mfxNl = json['mfx-nl'];
    mfxAt = json['mfx-at'];
    tmr = json['tmr'];
    mfxDe = json['mfx-de'];
    ticketmaster = json['ticketmaster'];
    mfxCz = json['mfx-cz'];
    mfxCh = json['mfx-ch'];
    mfxPl = json['mfx-pl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_total'] = this.iTotal;
    data['mfx-es'] = this.mfxEs;
    data['mfx-be'] = this.mfxBe;
    data['mfx-nl'] = this.mfxNl;
    data['mfx-at'] = this.mfxAt;
    data['tmr'] = this.tmr;
    data['mfx-de'] = this.mfxDe;
    data['ticketmaster'] = this.ticketmaster;
    data['mfx-cz'] = this.mfxCz;
    data['mfx-ch'] = this.mfxCh;
    data['mfx-pl'] = this.mfxPl;
    return data;
  }
}

class Links3 {
  Self first;
  Self self;
  Self next;
  Self last;

  Links3({this.first, this.self, this.next, this.last});

  Links3.fromJson(Map<String, dynamic> json) {
    first = json['first'] != null ? new Self.fromJson(json['first']) : null;
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    next = json['next'] != null ? new Self.fromJson(json['next']) : null;
    last = json['last'] != null ? new Self.fromJson(json['last']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.first != null) {
      data['first'] = this.first.toJson();
    }
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    if (this.next != null) {
      data['next'] = this.next.toJson();
    }
    if (this.last != null) {
      data['last'] = this.last.toJson();
    }
    return data;
  }
}

class Page {
  int size;
  int totalElements;
  int totalPages;
  int number;

  Page({this.size, this.totalElements, this.totalPages, this.number});

  Page.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['number'] = this.number;
    return data;
  }
}