import 'package:flutter/material.dart';
import 'package:using_widgets/homepage.drawer.dart';
import 'package:using_widgets/status_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoreWidgets extends StatefulWidget {
  final Function addTask;
  MoreWidgets({Key? key, required this.addTask}) : super(key: key);

  String? selectedValue;
  @override
  State<MoreWidgets> createState() => _MoreWidgetsState();
}

class _MoreWidgetsState extends State<MoreWidgets> {
  myFunc(result) {
    setState(() {
      widget.selectedValue = result;
      print(widget.selectedValue);
    });
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Add More Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.black],
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
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: title,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                hintText: 'Title of your task',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: description,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                hintText: 'Description of your task',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            StatusDropdown(
                show: false,
                selectedValue: widget.selectedValue,
                selectStatus: myFunc),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                print(widget.selectedValue);
                if (title.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: 'Please add your title',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.grey,
                      textColor: Colors.black,
                      fontSize: 16.0);
                } else if (description.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: 'Please provide the description',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.grey,
                      textColor: Colors.black,
                      fontSize: 16.0);
                } else if (widget.selectedValue == null) {
                  Fluttertoast.showToast(
                      msg: 'Please select a value',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.grey,
                      textColor: Colors.black,
                      fontSize: 16.0);
                } else {
                  Navigator.of(context).pop(
                    widget.addTask(
                      title.text,
                      description.text,
                      widget.selectedValue,
                    ),
                  );
                }
              },
              child: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(
                    255,
                    118,
                    174,
                    219,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
