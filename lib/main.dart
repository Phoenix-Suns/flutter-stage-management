import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_bloc/bloc_by_library/pizza_page.dart';
import 'package:test_bloc/bloc_by_stream_controller//remote_page.dart';
import 'package:test_bloc/mvvm_provider/movie_list_page.dart';
import 'package:test_bloc/mvvm_provider/movie_list_view_model.dart';

import 'package:test_bloc/bloc_by_library/models/pizza_bloc/pizza_bloc.dart';

/*void main() async {
  // tạo đối tượng bloc
  final bloc = RemoteBloc();

 // UI lắng nghe state thay đổi để update UI
  bloc.stateController.stream.listen((RemoteState state) {
    print('Âm lượng hiện tại: ${state.volume}');
  });

  // giả sử 1s sau, user click vào tăng âm lượng thêm 5
  await Future.delayed(Duration(seconds: 1));
  bloc.eventController.sink.add(IncrementEvent(5)); // từ UI push event đến bloc

  // giả sử 2s sau, user click vào giảm âm lượng đi 10
  await Future.delayed(Duration(seconds: 2));
  bloc.eventController.sink
      .add(DecrementEvent(10)); // từ UI push event đến bloc

  // giả sử 3s sau, user click vào mute luôn
  await Future.delayed(Duration(seconds: 3));
  bloc.eventController.sink.add(MuteEvent()); // từ UI push event đến bloc
}*/

// Normal Main
/*void main() {
  runApp(const MyApp());
}*/

// Main Provider
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieListViewModel()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: const MyApp(),
    ),
  );
}

// Normal App
/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/

// BLOC app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PizzaBloc()..add(LoadPizzaCounterEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('Simple Bloc (by Stream Controller)'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RemotePage(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text("Library Bloc"),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PizzaView(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text("Provider MVVM"),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieListPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
