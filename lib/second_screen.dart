import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/genres.dart';


class SecondScreen extends StatefulWidget{
  static String tag = 'main-view-controller';
  SecondScreen ({Key key}): super (key : key);

  @override
  _SecondScreen createState()=> new _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Ticketmaster Form';

    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyForm(),
      );
  }
}

// Crea un Widget Form
class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class Item {
  const Item(this.name,this.id, {Color color});
  final String name;
  final String id;
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyFormState extends State<MyForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!


  Item selectedUser;
  Item selectedSubGenre;

  List<Item> users = <Item>[
    const Item('Arts & Theatre', "KZFzniwnSyZfZ7v7na", color:  const Color(0xFF167F67),),
    const Item('Music', "KZFzniwnSyZfZ7v7nJ", color:  const Color(0xFF167F67),),
    const Item('Sports', "KZFzniwnSyZfZ7v7nE", color:  const Color(0xFF167F67),),
    const Item('Film', "KZFzniwnSyZfZ7v7nn" ,color:  const Color(0xFF167F67),),
    const Item('Undefined', "KZFzniwnSyZfZ7v7nl", color:  const Color(0xFF167F67),),
  ];

  List<Item> genresList = <Item>[];

  final _formKey = GlobalKey<FormState>();

  static const String API_KEY = "wr5ynMSsGG9XotdznZnMhXL53ArluVoE";
  static const BASE_EVENTS_API = "https://app.ticketmaster.com/discovery/v2/events.json?";
  static const BASE_GENRE_API = "https://app.ticketmaster.com/discovery/v2/classifications/";
  static const SIZE_API_FLAG = "&size=";
  static const API_FLAG = "&apikey=" + API_KEY;
  static const COUNTRY_API_FLAG = "&countryCode=";
  static String city;
  static String genre;
  static DateTime startDate;
  static DateTime endDate;

  static String selectedCat;

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //TODO: Padding dels tres camps de cerca, i un border pa que este bonito


          //KeyValuePairDropdown(),
          addCityForm(),
          genreDropDown(),
          subGenreDropDown(),

          addKeyWord(),
          addStartDateField(),
          addEndDateField(),

          Padding(

            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            child: RaisedButton(
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  midEventsApiCall();
                  callAPIEvents();
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  addCityForm() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: ImageIcon(
            AssetImage("images/city.png")
        ),
        contentPadding: EdgeInsets.all(10.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF212121)),

        ),



        /*
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide()
              ),
               */
        hintText: 'Write a city name',
        labelText: 'City',
      ),

      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }else{
          city = value;
        }
      },
    );
  }

  addKeyWord() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.search),
        /*
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide()
              ),
               */
        hintText: 'Write a keyword',
        labelText: 'Keyword',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }else{
          genre = value;
        }
      },
    );
  }

  addStartDateField() {
    final format = DateFormat("yyyy-MM-dd");
    return DateTimeField(
      decoration: const InputDecoration(
        icon: ImageIcon(
            AssetImage("images/calendar.png")
        ),
        /*
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide()
              ),
               */
        hintText: 'Select a date',
        labelText: 'Date',
      ),
      format: format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
      validator: (value) {
        if (value.isBefore(new DateTime.now())) {
          return 'Please enter some text';
        }else{
          startDate = value;
        }
      },
    );
  }

  addEndDateField() {
    final format = DateFormat("yyyy-MM-dd");
    return DateTimeField(
      decoration: const InputDecoration(
        icon: ImageIcon(
            AssetImage("images/calendar.png")
        ),
        /*
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide()
              ),
               */
        hintText: 'Select a date',
        labelText: 'Date',
      ),
      format: format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
      validator: (value) {
        if (value.isBefore(new DateTime.now())) {
          return 'Please enter some text';
        }else{
          endDate = value;
        }
      },
    );
  }

  genreDropDown() {
    return DropdownButton<Item>(
      hint:  Text("Category"),
      value: selectedUser,
      onChanged: (Item Value) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Processing Data')));
        selectedSubGenre = null;
        print("emptying genreslist");
        setState(() {
          selectedCat = Value.id;
          selectedUser = Value;
          midGenreApiCall();

        });
      },
      items: users.map((Item user) {
        return  DropdownMenuItem<Item>(
          value: user,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10,),
              Text(
                user.name,
                style:  TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  subGenreDropDown() {
    return DropdownButton<Item>(
      hint:  Text("Genre"),
      value: selectedSubGenre,
      onChanged: (Item Value) {
        setState(() {
          selectedSubGenre = Value;
        });
      },
      items: genresList.map((Item subgenre) {
        return  DropdownMenuItem<Item>(
          value: subgenre,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10,),
              Text(
                subgenre.name,
                style:  TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  dynamic callAPIEvents() async {
    String apiCall = BASE_EVENTS_API + SIZE_API_FLAG + "10" + API_FLAG + COUNTRY_API_FLAG + city;
    print(apiCall);
    var response = await http.get(
        Uri.encodeFull(apiCall),
        headers: {"Accept": "application/json"}
    );

    var data;
    setState(() {
      data = json.decode(response.body);
    });

    return data;
  }

  void midEventsApiCall() {
    callAPIEvents().then((value) {
      //print("data returned: ");
      //print(value);
      Navigator.pop(context, value);
      // Run extra code here
    }, onError: (error) {
      print(error);
    });
  }


  void midGenreApiCall() {
    callAPIGenres().then((value) {
      // Run extra code here
    }, onError: (error) {
      print(error);
    });
  }

  dynamic callAPIGenres() async {
    String apiCall = BASE_GENRE_API + selectedCat + ".json?" + API_FLAG;
    var response = await http.get(
        Uri.encodeFull(apiCall),
        headers: {"Accept": "application/json"}
    );

    var data;
    setState(() {
      data = json.decode(response.body);
    });

    var genreDecoder = GenresDecoder.fromJson(data);

    genresList = <Item>[];
    for (Genres g in genreDecoder.segment.eEmbedded.genres) {
      genresList.add(new Item(g.name, g.id));
    }

    return data;
  }

}