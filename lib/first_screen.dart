import 'dart:math';

import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'model/EventsDecoder.dart';
import 'package:url_launcher/url_launcher.dart';


class EventData {
  EventData(this.name, this.URL, this.imageURL, this.dateTime, this.location, this.fav, {Color color});
  final String imageURL;
  final String name;
  final String location;
  final String dateTime;
  final String URL;
  bool fav;
}

class FirstScreen extends StatefulWidget{
  static String tag = 'main-view-controller';
  FirstScreen ({Key key}): super (key : key);

  @override
  _FirstScreen createState()=> new _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {

  List<EventData> eventList = <EventData>[];
  final List<EventData> favEvents = new List();
  var numFavs = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Text("Search results")),
                Tab(icon: Text("Favourite searches"))
              ],
            ),
            title: Text('Flutter Tabs Example'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Add new entry',
                onPressed: () async {
                  var apiResults = await Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new SecondScreen(),
                    fullscreenDialog: true,)
                  );
                  if (apiResults != null){
                    //add task
                    print("First screen got the shit");
                    //print(apiResults);
                    var eventsDecoder = EventsDecoder.fromJson(apiResults);
                    eventList = <EventData>[];

                    for (Events e in eventsDecoder.eEmbedded.events) {
                      eventList.add(new EventData(e.name, e.url, e.images[1].url, e.dates.start.dateTime, e.eEmbedded.venues[0].name + ", " + e.eEmbedded.venues[0].city.name, false));
                    }
                    setState(() {

                    });
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
    return Container(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: eventList.length,
        itemBuilder: (context, int index) {
          return Container(
            //color: Colors.amber[colorCodes[index]],
            child: Center(child: Container(
              child: fillSingleCell(eventList[index], false),
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  fillSingleCell(EventData event, bool fav) {
    //TODO: Colocar cada element al lloc corresponent
    return Container(
        child: Column(
          children: <Widget>[
            insertImage(event.imageURL, event.URL),
            insertText(event.name),
            insertText(event.location),
            insertText(event.dateTime),
            insertFav(fav, event),
          ],
        )
    );
  }

  insertImage(String imageURL, String url) {
    if(imageURL != null && url != null){
      return GestureDetector(
        onTap: (){
          _launchURL(url);
        },
        child: Image.network(imageURL),
      );
    }else if (imageURL == null && url != null){
      return Text("Image not available. Event URL: " + url);
    }else if (imageURL != null && url == null){
      return Image.network(imageURL);
    }
  }

  insertText(String text){
    if (text != null){
      return Text(text);
    }else{
      return (Text("Missing information."));
    }
  }

  insertFav(bool fav, EventData event){
    //esta en el array de favoritos
    if(fav) {
      return Container(
          color: Colors.white // This is optional
      );
      //NO esta en el array de favoritos
    }else{
      if(event.fav){
        return IconButton(
          icon: const Icon(Icons.favorite), onPressed: () {
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
      }else{
        return IconButton(
          icon: const Icon(Icons.favorite_border), onPressed: () {
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
            child: Center(child: Container(
              child: fillSingleCell(favEvents[index], true),
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

}
