import 'package:flutter/material.dart';

class StatusDropdown extends StatefulWidget {
  StatusDropdown(
      {Key? key,
      this.selectedValue,
      required this.selectStatus,
      required this.show})
      : super(key: key);
  final Function selectStatus;
  String? selectedValue;
  final bool show;
  List<String> statusList = ['Completed', 'Incomplete', 'Pending', 'All'];
  @override
  State<StatusDropdown> createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  @override
  void initState() {
    super.initState();
    if (widget.show) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 214, 245),
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black, width: 3)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text(
            '   Select Filters',
            style: TextStyle(fontSize: 16),
          ),
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.black,
          ),
          iconSize: 34,
          dropdownColor: const Color.fromARGB(255, 245, 214, 245),
          value: widget.selectedValue,
          isExpanded: true,
          onChanged: (newValue) {
            setState(() {
              widget.selectedValue = newValue;
            });
            widget.selectStatus(widget.selectedValue);
          },
          items: widget.statusList.map(
            (String status) {
              return DropdownMenuItem(
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                value: status == 'All' ? '' : status,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
