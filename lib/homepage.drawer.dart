import 'package:flutter/material.dart';
import 'package:using_widgets/status_dropdown.dart';

class HomepageDrawer extends StatefulWidget {
  final Function selectedFilter;
  const HomepageDrawer({Key? key, required this.selectedFilter})
      : super(key: key);

  @override
  State<HomepageDrawer> createState() => _HomepageDrawerState();
}

String? selectedValue;

class _HomepageDrawerState extends State<HomepageDrawer> {
  myFunc(result) {
    setState(() {
      selectedValue = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FILTERS',
        ),
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
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(
                    255,
                    118,
                    174,
                    219,
                  ),
                ),
              ),
              onPressed: () {
                widget.selectedFilter(selectedValue);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
