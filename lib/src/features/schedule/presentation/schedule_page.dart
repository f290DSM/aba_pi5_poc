import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_simple.dart';
import 'widgets/user_simple_card.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key, required this.users});

  final List<SimpleUser> users;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Appointments',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return UserSimpleCard(simpleUser: user);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                indent: 16,
                endIndent: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
