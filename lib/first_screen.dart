import 'dart:math';

import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'model/EventsDecoder.dart';
import 'package:url_launcher/url_launcher.dart';


class EventData {
  const EventData(this.name, this.URL, this.imageURL, this.dateTime, this.location, this.fav, {Color color});
  final String imageURL;
  final String name;
  final String location;
  final String dateTime;
  final String URL;
  final bool fav;
}

class FirstScreen extends StatefulWidget{
  static String tag = 'main-view-controller';
  FirstScreen ({Key key}): super (key : key);

  @override
  _FirstScreen createState()=> new _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {

  List<EventData> eventList = <EventData>[];
  final List<bool> favEvents = new List();
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
              firstTab(),
              SecondTab(),
            ],
          ),
        ),
      ),
    );
  }

  firstTab() {
    return Container(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: eventList.length,
        itemBuilder: (context, int index) {
          return Container(
            //color: Colors.amber[colorCodes[index]],
            child: Center(child: Container(
              child: fillSingleCell(eventList[index]),
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  fillSingleCell(EventData event) {
    //TODO: Colocar cada element al lloc corresponent
    return Container(
        child: Column(
          children: <Widget>[
            ifFilled(event.imageURL, 0),
            ifFilled(event.name, 1),
            ifFilled(event.location, 1),
            ifFilled(event.dateTime, 1),
            ifFilled(event.URL, 1),
            ifFilled(event.fav.toString(), 2),
          ],
        )
    );
  }

  ifFilled(String text, int type){
    if (text != null && type == 0){
      return Image.network(text);

    }else if (text != null && type == 1){
      return GestureDetector(
        onTap: (){
          _launchURL();
          print("tabby boi");
        },
        child: Text(text),
      );
    }else if(text != null && type == 2){
      return Icon(Icons.favorite_border);
    }else {
      return IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () async {
          setState(() {
            print("got pressed v2");
          });
          print("Got pressed");
          /*
          var task = await Navigator.push(context, new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(),
            fullscreenDialog: true,)
          );
          if (task != null){
            //add task
            print("task: ");
            print(task);
            favEvents.add(task);
            numFavs++;
          }

           */
        },
      );
    }
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}


class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Tab 2 Layout'),
      ),
    );
  }
}
