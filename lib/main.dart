import 'package:bloc_practice_flutter/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'BLoC State Management'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print('Building widget tree');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(        
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              initialData: 0,
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },              
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {          
              counterBloc.eventSink.add(CounterAction.Increment);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () {          
              counterBloc.eventSink.add(CounterAction.Decrement);
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () {          
              counterBloc.eventSink.add(CounterAction.Reset);
            },
            tooltip: 'Reset',
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
