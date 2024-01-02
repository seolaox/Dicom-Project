import 'package:flutter/material.dart';

class InspectionButton extends StatefulWidget {
  final List<String> items;
  final String dropDownValue;
  final ValueChanged<String?> onChanged;

  const InspectionButton({
    Key? key,
    required this.items,
    required this.dropDownValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InspectionButton> createState() => _InspectionButtonState();
}

class _InspectionButtonState extends State<InspectionButton> {
  late List<String> items;
  late String dropDownValue;

  @override
  void initState() {
    super.initState();
    items = ['선택해주세요','AS', 'AU', 'BI', 'CD', 'CF','ㅁㅁ','AS', 'AU', 'BI', 'CD', 'CF','ㅁㅁ','AS', 'AU', 'BI', 'CD', 'CF','ㅁㅁ','AS', 'AU', 'BI', 'CD', 'CF','ㅁㅁ'];
    dropDownValue = items[0]; // items 리스트의 첫 번째 값을 초기값으로 설정
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
        icon: Padding(
          padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
          child: Icon(Icons.keyboard_arrow_down),
        ),
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
