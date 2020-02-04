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

class FirstScreen extends StatelessWidget {

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

                    for (Events e in eventsDecoder.eEmbedded.events) {
                      eventList.add(new EventData(e.name, e.url, e.images[1].url, e.dates.start.dateTime, e.eEmbedded.venues[0].name + ", " + e.eEmbedded.venues[0].city.name, false));
                    }
                    print("event name: " + eventList[0].name);
                  }
                },
              ),
            ],
          ),
          body: TabBarView(
            children: [
              FirstTab(),
              SecondTab(),
            ],
          ),
        ),
      ),
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

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Tab 1 Layout'),
      ),
    );
  }
}