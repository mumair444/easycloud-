import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:using_widgets/details.dart';
import 'package:using_widgets/tasks.dart';

class HomePageData extends StatefulWidget {
  final List<Tasks> list;

  const HomePageData({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<HomePageData> createState() => _HomePageDataState();
}

class _HomePageDataState extends State<HomePageData> {
  String res = 'incomplete';
  String? taskId;
  callBackFunc(result, id) {
    setState(() {
      taskId = id;
      res = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Tasks> tasks = widget.list;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (
          context,
          index,
        ) {
          return Card(
            elevation: 10,
            color: const Color.fromARGB(255, 245, 214, 245),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.arrow_circle_right,
                    color: Colors.black,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tasks[index].title,
                      ),
                      Text(
                        tasks[index].status == 'Completed' ||
                                tasks[index].status == 'Pending'
                            ? tasks[index].status
                            : tasks[index].title == taskId
                                ? res
                                : 'Incomplete',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     Fluttertoast.showToast(
                  //         msg: 'Deleted ${tasks[index].title}',
                  //         toastLength: Toast.LENGTH_SHORT,
                  //         gravity: ToastGravity.CENTER,
                  //         backgroundColor: Colors.black,
                  //         textColor: Colors.white,
                  //         fontSize: 16.0);
                  //     setState(() {
                  //       tasks.removeWhere(
                  //           (element) => element.title == tasks[index].title);
                  //     });
                  //   },
                  //   icon: const Icon(
                  //     Icons.delete,
                  //     color: Colors.black,
                  //   ),
                  //   tooltip: 'Delete',
                  // ),
                  subtitle: Text(
                    tasks[index].description,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreens(
                          task: tasks[index],
                          callBackFunc: callBackFunc,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          );
        },
        separatorBuilder: (
          context,
          int,
        ) =>
            const SizedBox(
          height: 4,
        ),
        itemCount: tasks.length,
      ),
    );
  }
}
