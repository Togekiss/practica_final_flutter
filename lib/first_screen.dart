import 'dart:math';

import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'model/EventsDecoder.dart';

class EventData {
  const EventData(this.name, this.URL, this.imageURL, this.dateTime, this.location, this.fav, {Color color});
  final String name;
  final String URL;
  final String imageURL;
  final String dateTime;
  final String location;
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

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit))
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

                    print("events: ");
                    print(eventsDecoder.eEmbedded.events);
                    for (Events e in eventsDecoder.eEmbedded.events) {
                      eventList.add(new EventData(e.name, e.url, e.images[1].url, e.dates.start.dateTime, e.eEmbedded.venues[0].name + ", " + e.eEmbedded.venues[0].city.name, false));
                    }
                    print("event name: " + eventList[0].name);
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

              fill(),
              SecondTab(),
            ],
          ),
        ),
      ),
    );
  }

  fill() {
    print("fill");
    return Container(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: eventList.length,
        itemBuilder: (context, int index) {
          return Container(
            //color: Colors.amber[colorCodes[index]],
            child: Center(child: Container(
              child: fillSingleCell(index),
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  fillSingleCell(int index) {
    print("filling cell");
    return Container(
        child: Text(eventList[index].name)
    );
  }



}



class aux extends StatefulWidget {
  List<EventData> eventList;

  aux(List<EventData> eventList){
    this.eventList = eventList;
  }

  @override
  State<StatefulWidget> createState() {
    aaaaa createState() => new aaaaa(eventList);
  }
}

class aaaaa extends State<aux>{

  int numElements = 0;
  List<EventData> eventList;

  aaaaa(List<EventData> eventList){
    this.eventList = eventList;
  }


  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Dynamic Demo"),),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: new TextEditingController(),
              onSubmitted: (text) {
                setState(() {});
              },
            ),
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: 10,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return new Text("ad");
                    }
                )
            )
          ],
        )
    );
    /*
    return Container(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: eventList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //color: Colors.amber[colorCodes[index]],
            child: Center(child: Container(
              child: fillSingleCell(index),
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );

     */
  }

  fillSingleCell(int index) {
    print("filling cell");
    return Container(
      child: Text(eventList[index].name)
    );
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
