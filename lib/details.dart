import 'package:flutter/material.dart';
import 'package:using_widgets/tasks.dart';

class DetailsScreens extends StatefulWidget {
  final Tasks task;
  final Function callBackFunc;

  const DetailsScreens(
      {Key? key, required this.task, required this.callBackFunc})
      : super(key: key);

  @override
  State<DetailsScreens> createState() => _DetailsScreensState();
}

class _DetailsScreensState extends State<DetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 200, 234),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 52, 179, 238),
                Color.fromARGB(255, 231, 133, 195),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: const Color.fromARGB(255, 245, 214, 245),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.arrow_circle_right,
                      color: Colors.black,
                    ),
                    title: Text(
                      widget.task.title,
                    ),
                    subtitle: Text(
                      widget.task.description,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
            widget.task.status == 'Incomplete' ||
                    widget.task.status == 'Pending'
                ? InkWell(
                    onTap: () {
                      setState(() {
                        widget.task.status = 'Completed';
                        widget.callBackFunc(
                            widget.task.status, widget.task.title);
                      });
                    },
                    child: const Chip(
                      side: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      backgroundColor: Color.fromARGB(255, 174, 165, 234),
                      label: Text(
                        'Completed',
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
