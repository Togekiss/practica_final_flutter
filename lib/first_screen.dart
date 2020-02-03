import 'package:flutter/material.dart';
import 'second_screen.dart';


class FirstScreen extends StatefulWidget{
  static String tag = 'main-view-controller';
  FirstScreen ({Key key}): super (key : key);

  @override
  _FirstScreen createState()=> new _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )
                ),

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
                        print(apiResults);
                      }
                    },
                  ),
                ],

              ),
              new SliverPadding(
                padding: new EdgeInsets.all(16.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate([
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                        new Tab(
                            icon: new Icon(Icons.lightbulb_outline),
                            text: "Tab 2"),
                      ],
                    ),
                  ]),
                ),
              ),
            ];
          },
          body: Center(
            child: Text("Sample text"),
          ),
        ),
      ),
    );
  }
}