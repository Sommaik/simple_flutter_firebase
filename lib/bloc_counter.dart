import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/bloc/counter/counter_bloc.dart';
import 'package:simple/bloc/counter/counter_event.dart';

class BlocCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter'),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, int counter) {
          return Center(
            child: Text("$counter"),
          );
        },
      ),
      floatingActionButton: buildAddButton(_bloc),
    );
  }

  FloatingActionButton buildAddButton(CounterBloc bloc) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        bloc.dispatch(CounterEvent.increment);
      },
    );
  }
}
