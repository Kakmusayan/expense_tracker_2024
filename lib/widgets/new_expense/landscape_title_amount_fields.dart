import 'package:flutter/material.dart';

class LandscapeTitleAmountFields extends StatelessWidget {
  const LandscapeTitleAmountFields({
    super.key,
    required this.titleController,
    required this.amountController,
  });

  final TextEditingController titleController;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "\$ ",
              label: Text('Amount'),
            ),
          ),
        ),
      ],
    );
  }
}
