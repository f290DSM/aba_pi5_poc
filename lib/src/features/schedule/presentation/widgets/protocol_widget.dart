import 'package:aba_pi5_poc/src/core/constants.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProtocolWidget extends StatelessWidget {
  const ProtocolWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: themeColor,
      child: ListTile(
        title: Text(
          'Protocol: ${faker.randomGenerator.integer(100)}',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.white),
        ),
        subtitle: Text(
          faker.conference.name(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        trailing: const FaIcon(
          FontAwesomeIcons.penToSquare,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
