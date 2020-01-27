import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:datetime_picker_formfield/time_picker_formfield.dart';


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

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyForm(),
      ),
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

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyFormState extends State<MyForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  DateTime date;

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          addCityForm(),
          addGenreForm(),

          DateTimeField(
            format: dateFormat,
            decoration: InputDecoration(labelText: 'Date'),
            onChanged: (dt) => setState(() => date = dt), onShowPicker: (BuildContext context, DateTime currentValue) {},
          ),
          SizedBox(height: 16.0),
          Text('date.toString(): $date', style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 16.0),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
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
        }
      },
    );
  }

  addGenreForm() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: ImageIcon(
            AssetImage("images/genre.png")
        ),
        /*
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide()
              ),
               */
        hintText: 'Write an activity genre',
        labelText: 'Genre',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }
}