import 'package:aba_pi5_poc/src/core/constants.dart';
import 'package:aba_pi5_poc/src/features/schedule/domain/user_simple.dart';
import 'package:aba_pi5_poc/src/features/schedule/presentation/widgets/protocol_status_widget.dart';
import 'package:aba_pi5_poc/src/features/schedule/presentation/widgets/protocol_widget.dart';
import 'package:aba_pi5_poc/src/features/schedule/presentation/widgets/user_simple_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProtocolPage extends ConsumerWidget {
  const ProtocolPage({required this.user, super.key});

  final SimpleUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AvatarWidget(
              dataImage: kBase64Image,
              innerRadius: 95,
              outherRadius: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              user.name!,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Idade ${user.age!} anos',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 24,
              width: double.maxFinite,
            ),
            const Row(
              children: [
                ProtocolStatusCard(
                  quantity: 15,
                ),
                ProtocolStatusCard(
                  type: StatusType.aborted,
                  quantity: 5,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Protocols',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            Column(
              children: List.generate(5, (index) => const ProtocolWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
