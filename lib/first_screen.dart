import 'dart:math';

import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'model/EventsDecoder.dart';
import 'package:url_launcher/url_launcher.dart';

class EventData {
  EventData(this.name, this.URL, this.imageURL, this.date, this.time, this.location,
      this.fav,
      {Color color});

  final String imageURL;
  final String name;
  final String location;
  final String date;
  final String time;
  final String URL;
  bool fav;
}

class FirstScreen extends StatefulWidget {
  static String tag = 'main-view-controller';

  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreen createState() => new _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  List<EventData> eventList = <EventData>[];
  final List<EventData> favEvents = new List();
  var numFavs = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[600],
        accentColor: Colors.amberAccent,
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Text("Discover")),
                Tab(icon: Text("Favourites"))
              ],
            ),
            title: Text('Event Explorer'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Add new entry',
                onPressed: () async {
                  var apiResults = await Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new SecondScreen(),
                        fullscreenDialog: true,
                      ));
                  if (apiResults != null) {
                    //add task
                    print("First screen got the shit");
                    //print(apiResults);
                    var eventsDecoder = EventsDecoder.fromJson(apiResults);
                    eventList = <EventData>[];

                    for (Events e in eventsDecoder.eEmbedded.events) {
                      eventList.add(new EventData(
                          e.name,
                          e.url,
                          e.images[1].url,
                          e.dates.start.localDate,
                          e.dates.start.localTime,
                          e.eEmbedded.venues[0].name +
                              ", " +
                              e.eEmbedded.venues[0].city.name,
                          false));
                    }
                    setState(() {});
                  }
                },
              ),
            ],
          ),
          body: TabBarView(
            children: [
              //new aux(eventList),
              searchResultsTab(),
              favouritesTab(),
            ],
          ),
        ),
      ),
    );
  }

  searchResultsTab() {
    return eventList.length == 0 ? Center(child: Text("Use the search function to look for events!")) : Container(
      child: ListView.separated(

        //padding: const EdgeInsets.all(8),
        itemCount: eventList.length,
        itemBuilder: (context, int index) {
          return fillSingleCellCool(eventList[index], false);
            /*Container(
            //color: Colors.amber[colorCodes[index]],
            child: Center(
                child: Container(
                  child: fillSingleCell(eventList[index], false),
                )),
          );*/
        },//itembuilder
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }


  fillSingleCellCool(EventData event, bool fav) {
    return Container(
      height: 250,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: insertImage(event.imageURL, event.URL),
              )
          ),
            Positioned (
              top: 0,
              right: 0,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                gradient: RadialGradient(
                    radius: 1,
                    center: Alignment(1, -1),
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent
                    ]
                  ), //linear gradient
                ),
              ),
            ),

            Positioned(
                bottom: 0,

                child: GestureDetector(
                    onTap: () {
                      _launchURL(event.URL);
                    },
                    child:Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black
                              ]
                          ), //linear gradient
                        ), //decoration
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
                                      child: Text(
                                          insertText(event.name),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20
                                          ) //text style
                                      ) //text
                                  ), //text padding


                                  Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                          insertText(event.location),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ) //text style
                                      )
                                  ),//text

                                  Row(
                                    children: <Widget>[
                                      Text(
                                          insertText(event.date + "   "),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ) //text style
                                      ),
                                      Text(
                                          insertText(event.time),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ) //text style
                                      )
                                    ],
                                  )
                                  //text
                                ] //column children
                            ) //column
                        ) //column padding
                    )
                ), //container
            ), //info positioned
            Positioned(
                top: 0,
                right: 0,
                child: insertFav(fav, event)
            ) //fav positioned
          ], //stack children
        ) //big stack
    ); //container
  }



  fillSingleCell(EventData event, bool fav) {
    //TODO: Colocar cada element al lloc corresponent
    return Container(
        child: Column(
          children: <Widget>[
            insertImage(event.imageURL, event.URL),
            Text(insertText(event.name)),
            Text(insertText(event.location)),
            Text(insertText(event.date)),
            insertFav(fav, event),
          ],
        )
    );
  }




  insertImage(String imageURL, String url) {
    if (imageURL != null && url != null) {
      return GestureDetector(
        onTap: () {
          _launchURL(url);
        },
        child: Image.network(imageURL),
      );
    } else if (imageURL == null && url != null) {
      return Image.asset("images/default.png");
    } else if (imageURL != null && url == null) {
      return Image.network(imageURL);
    }
  }

  insertText(String text) {
    if (text != null) {
      return text;
    } else {
      return "No specific time";
    }
  }


  insertFav(bool fav, EventData event) {
    //esta en el array de favoritos
    if (fav) {
      return IconButton(
        icon: const Icon(Icons.delete, color: Colors.white),
        onPressed: () {
          if (event != null) {
            setState(() {
              favEvents.removeAt(favEvents.indexOf(event));
              eventList
                  .elementAt(eventList.indexOf(event))
                  .fav = false;
              numFavs--;
            });
          }
        },
      );
      //NO esta en el array de favoritos
    } else {
      if (event.fav) {
        return IconButton(
          icon: const Icon(Icons.favorite, color: Colors.white),
          onPressed: () {
            if (event != null) {
              setState(() {
                favEvents.removeAt(favEvents.indexOf(event));
                eventList
                    .elementAt(eventList.indexOf(event))
                    .fav = false;
                numFavs--;
              });
            }
          },
        );
      } else {
        return IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {
            if (event != null) {
              setState(() {
                EventData auxEvent = event;
                auxEvent.fav = !auxEvent.fav;
                favEvents.add(auxEvent);
                numFavs++;
              });
            }
          },
        );
      }
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  favouritesTab() {
    return Container(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: favEvents.length,
        itemBuilder: (context, int index) {
          return Container(
            //color: Colors.amber[colorCodes[index]],
            child: Center(
                child: Container(
                  child: fillSingleCellCool(favEvents[index], true),
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
