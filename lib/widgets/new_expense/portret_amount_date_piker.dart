import 'package:flutter/material.dart';

import '../../models/expense.dart';

class PortretAmountDatePicker extends StatefulWidget {
  const PortretAmountDatePicker({
    super.key,
    required this.amountController,
    this.selectedDate,
    required this.onPresentDatePicker,
  });

  final TextEditingController amountController;
  final DateTime? selectedDate;
  final void Function() onPresentDatePicker;

  @override
  State<PortretAmountDatePicker> createState() =>
      _PortretAmountDatePickerState();
}

class _PortretAmountDatePickerState extends State<PortretAmountDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "\$ ",
              label: Text('Amount'),
            ),
          ),
        ),
        const SizedBox(width: 16),
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
