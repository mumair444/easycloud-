import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:using_widgets/homepage.drawer.dart';
import 'package:using_widgets/homepagedata.dart';
import 'package:using_widgets/main.dart';
import 'package:using_widgets/morewidgets.dart';
import 'package:using_widgets/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status = '';
  getStatus(String result) {
    setState(() {
      status = result;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Tasks> mylist = [
    Tasks(
      'TASK 1',
      'Learn Dart Programming Language',
      'Completed',
    ),
    Tasks(
      'TASK 2',
      'Practice Dart Programming Language',
      'Completed',
    ),
    Tasks(
      'TASK 3',
      'Learn Flutter Course',
      'Completed',
    ),
    Tasks(
      'TASK 4',
      'Practice Flutter Course',
      'Completed',
    ),
    Tasks(
      'TASK 5',
      'Build a Sample App',
      'Completed',
    ),
    Tasks(
      'TASK 6',
      'Use More Widgets ',
      'Completed',
    ),
    Tasks(
      'TASK 7',
      'Build Personal Apps',
      'Incomplete',
    ),
    Tasks(
      'TASK 8',
      'Manage Clients',
      'Incomplete',
    ),
  ];

  void newtask(
    String t,
    String d,
    String s,
  ) {
    final newTask = Tasks(
      t,
      d,
      s,
    );

    setState(
      () {
        mylist.add(
          newTask,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 95, 178, 214),
      key: _key,
      drawerEnableOpenDragGesture: false,
      drawer: HomepageDrawer(selectedFilter: getStatus),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(Icons.filter_list),
        ),
        title: const Text(
          'TODO List',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Umair(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: HomePageData(
        list: status == ''
            ? mylist
            : mylist.where((element) => element.status == status).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(
          255,
          118,
          174,
          219,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoreWidgets(
                addTask: newtask,
              ),
            ),
          );
        },
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.black,
            width: 4,
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
