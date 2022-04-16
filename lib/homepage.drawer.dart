import 'package:flutter/material.dart';
import 'package:using_widgets/status_dropdown.dart';

class HomepageDrawer extends StatefulWidget {
  final Function selectedFilter;
  const HomepageDrawer({Key? key, required this.selectedFilter})
      : super(key: key);

  @override
  State<HomepageDrawer> createState() => _HomepageDrawerState();
}

class _HomepageDrawerState extends State<HomepageDrawer> {
  String? selectedValue;
  myFunc(result) {
    setState(() {
      selectedValue = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 200, 234),
      appBar: AppBar(
        title: const Text(
          'FILTERS',
          style: TextStyle(color: Colors.black),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            StatusDropdown(
                show: true, selectedValue: selectedValue, selectStatus: myFunc),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                widget.selectedFilter(selectedValue);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
