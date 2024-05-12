import 'package:flutter/material.dart';

import '../../models/expense.dart';

// ignore: must_be_immutable
class LandscapeCategoryDatePicker extends StatefulWidget {
  LandscapeCategoryDatePicker({
    super.key,
    required this.selectedCategory,
    required this.selectedDate,
    required this.onPresentDatePicker,
  });

  Category selectedCategory;
  final DateTime? selectedDate;
  final void Function() onPresentDatePicker;

  @override
  State<LandscapeCategoryDatePicker> createState() =>
      _LandscapeCategoryDatePickerState();
}

class _LandscapeCategoryDatePickerState
    extends State<LandscapeCategoryDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton(
            value: widget.selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                widget.selectedCategory = value;
              });
            }),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.selectedDate == null
                    ? "No date selected"
                    : formatter.format(widget.selectedDate!),
              ),
              IconButton(
                onPressed: widget.onPresentDatePicker,
                icon: const Icon(
                  Icons.calendar_month,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
