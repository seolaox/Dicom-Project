import 'package:flutter/material.dart';

class DeciperButton extends StatefulWidget {
   final List<String> items;
  final String dropDownValue;
  final ValueChanged<String?> onChanged;
  const DeciperButton({
    Key? key,
    required this.items,
    required this.dropDownValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DeciperButton> createState() => _DeciperButtonState();
}

class _DeciperButtonState extends State<DeciperButton> {
 late List<String> items;
  late String dropDownValue;

  @override
  void initState() {
    super.initState();
    items = [ '판독 상태', '읽지 않음', '열람중', '예비 판독', '판독'];
    dropDownValue = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: DropdownButton(
        dropdownColor: Theme.of(context).colorScheme.primaryContainer,
        // iconEnabledColor: Theme.of(context).colorScheme.secondaryContainer,
        iconEnabledColor: Colors.black,
        value: dropDownValue,
        icon: Icon(Icons.keyboard_arrow_down),
        
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              // style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              dropDownValue = newValue;
            });
            widget.onChanged(newValue);
          }
        },
      ),
    );
  }
}
