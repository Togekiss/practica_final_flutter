import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
/*
class KeyValuePairDropdown extends StatefulWidget {
  //Add key-value pair data here
  @override
  second_screen_widgets createState() {
    return new second_screen_widgets();
  }
}*/

class aaa {
  static String city;
  static String genre;
  static DateTime startDate;
  static DateTime endDate;

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  getCity(){
    return city;
  }

  getGenre(){
    return genre;
  }

  getStartDate(){
    return startDate;
  }

  getEndDate(){
    return endDate;
  }

}