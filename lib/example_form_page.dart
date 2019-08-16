import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple/bloc/counter/counter_bloc.dart';
import 'package:simple/bloc/counter/counter_event.dart';

class ExampleFormPage extends StatefulWidget {
  @override
  _ExampleFormPageState createState() => _ExampleFormPageState();
}

class _ExampleFormPageState extends State<ExampleFormPage> {
  final _form = GlobalKey<FormState>();
  final DateFormat _dateFormat = DateFormat("dd/MM/y");
  File _image;

  Future selectImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this._image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder(
      bloc: _bloc,
      builder: (context, counter) => buildScaffold(_bloc, counter),
    );
  }

  Scaffold buildScaffold(CounterBloc bloc, int counter) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Form"),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            Text('$counter'),
            RaisedButton(
              child: Text("decement"),
              onPressed: () {
                bloc.dispatch(CounterEvent.decement);
              },
            ),
            buildDateField(),
            Container(
              child: _image == null
                  ? Text("No image selectd")
                  : Image.file(_image),
            )
          ],
        ),
      ),
      floatingActionButton: buildImagePickerButton(),
    );
  }

  FloatingActionButton buildImagePickerButton() {
    return FloatingActionButton(
      child: Icon(Icons.camera),
      onPressed: () {
        print("on image picker press");
        selectImage();
      },
    );
  }

  DateTimePickerFormField buildDateField() {
    return DateTimePickerFormField(
      format: _dateFormat,
      inputType: InputType.date,
    );
  }
}
