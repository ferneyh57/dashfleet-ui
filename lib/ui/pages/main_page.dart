import 'package:dashfleet_ui/ui/di/providers.dart';
import 'package:dashfleet_ui/ui/mocks.dart';
import 'package:dashfleet_ui/ui/pages/routes_page.dart';
import 'package:dashfleet_ui/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Pagina base
class MainBasePage extends ConsumerStatefulWidget {
  const MainBasePage({super.key});

  @override
  ConsumerState<MainBasePage> createState() => _MainBasePageState();
}

class _MainBasePageState extends ConsumerState<MainBasePage> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    const Text('MAS!'),
    const WelcomePage(),
    RoutesPage(
      routeComplete: mockRouteCompleted,
      routesToDo: mockRoutes,
    ),
    const Text('Dinero'),
    const Text('Configuration'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        toolbarHeight: 120,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              ref.read(userProvider).currentUser.name,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 12),
            const Text('Conductor'),
          ],
        ),
        leading: Row(
          children: [
            const SizedBox(width: 24),
            Flexible(
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                clipBehavior: Clip.antiAlias,
                child: const Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Text(
                'ACCIONES',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: const Text('Seccion de bienvenida'),
              onTap: () {
                _onItemTapped(1);
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Seccion de rutas'),
              onTap: () {
                _onItemTapped(2);
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Mas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Dinero',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Config',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
