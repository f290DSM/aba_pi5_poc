import 'package:flutter/material.dart';

class ProtocolStatusCard extends StatelessWidget {
  const ProtocolStatusCard({
    super.key,
    this.quantity = 0,
    this.type = StatusType.completed,
  });

  final int quantity;
  final StatusType type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: type == StatusType.completed
            ? Colors.green.shade700
            : Colors.red.shade700,
        elevation: 8,
        shadowColor: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white),
              ),
              Text(
                type == StatusType.completed ? 'Completed' : 'Aborted',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum StatusType {
  completed,
  aborted;
}
