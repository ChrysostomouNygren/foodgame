import 'package:flutter/material.dart';

class InstructionItem extends StatefulWidget {
  InstructionItem({
    super.key,
    this.instruction = '',
    required this.added,
    this.onChanged,
  });
  final String instruction;
  bool added;
  Function(bool?)? onChanged;
  @override
  State<InstructionItem> createState() => _InstructionItemState();
}

class _InstructionItemState extends State<InstructionItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color.fromARGB(255, 3, 39, 52)),
          child: Checkbox(
            value: widget.added,
            onChanged: (bool? value) {
              setState(() {
                widget.added = value!;
              });
            },
            activeColor: const Color.fromARGB(255, 3, 39, 52),
            checkColor: Colors.white,
          ),
        ),
        // ändra typsnittsstorlek
        Flexible(child: Text(widget.instruction)),
      ],
    ));
  }
}
