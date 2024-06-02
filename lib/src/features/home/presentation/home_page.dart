import 'package:aba_pi5_poc/src/features/schedule/domain/user_simple.dart';
import 'package:aba_pi5_poc/src/features/schedule/presentation/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

buildFakeUsers() {
  return List.generate(3, (index) => SimpleUser.fake());
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    SchedulePage(users: buildFakeUsers()),
    Container(color: Colors.blue.shade200),
    Container(color: Colors.green.shade200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.calendarCheck),
            label: 'Agenda',
            selectedIcon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Perfil',
            selectedIcon: FaIcon(FontAwesomeIcons.solidUser),
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }
}
