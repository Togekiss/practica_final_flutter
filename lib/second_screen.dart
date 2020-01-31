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
  DateTime date;

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //TODO: Padding dels tres camps de cerca, i un border pa que este bonito
          addCityForm(),
          addGenreForm(),
          addDateField(),

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

  addDateField() {
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
    );
  }
}