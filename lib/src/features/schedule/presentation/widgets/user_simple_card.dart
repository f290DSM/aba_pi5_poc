import 'dart:convert';

import 'package:aba_pi5_poc/src/core/constants.dart';
import 'package:aba_pi5_poc/src/features/schedule/domain/user_simple.dart';
import 'package:aba_pi5_poc/src/features/schedule/presentation/protocols_page.dart';
import 'package:flutter/material.dart';

class UserSimpleCard extends StatelessWidget {
  const UserSimpleCard({
    super.key,
    required this.simpleUser,
  });

  final SimpleUser simpleUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProtocolPage(
                user: simpleUser,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: AvatarWidget(
                dataImage: kBase64Image,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    simpleUser.name!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Idade ${simpleUser.age.toString()} anos.',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.innerRadius = 35.0,
    this.outherRadius = 37,
    required this.dataImage,
  });

  final double innerRadius;
  final double outherRadius;
  final String dataImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFF0DAB72),
      radius: outherRadius,
      child: CircleAvatar(
        radius: innerRadius,
        backgroundImage: MemoryImage(
          base64Decode(dataImage),
        ),
      ),
    );
  }
}
