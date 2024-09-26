import 'package:flutter/material.dart';
import 'dart:math';

class TabMenu extends StatefulWidget {
  const TabMenu({super.key});

  @override
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isDarkMode = false; // Variabel untuk menyimpan status mode gelap

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.star, 'label': 'Star'},
    {'icon': Icons.settings, 'label': 'Settings'},
    {'icon': Icons.person, 'label': 'Person'},
    {'icon': Icons.phone, 'label': 'Phone'},
    {'icon': Icons.email, 'label': 'Email'},
    {'icon': Icons.camera, 'label': 'Camera'},
    {'icon': Icons.map, 'label': 'Map'},
    {'icon': Icons.lock, 'label': 'Lock'},
    {'icon': Icons.shopping_cart, 'label': 'Cart'},
    {'icon': Icons.school, 'label': 'School'},
    {'icon': Icons.work, 'label': 'Work'},
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
    Colors.amber,
    Colors.lime,
    Colors.indigo,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Menu'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode; // Toggle mode gelap
              });
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: _isDarkMode
                ? const LinearGradient(colors: [Colors.black, Colors.black])
                : const LinearGradient(colors: [Colors.purple, Colors.purple]),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          tabs: const [
            Tab(
              icon: Icon(Icons.home, color: Colors.white),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.settings, color: Colors.white),
              text: "Settings",
            ),
            Tab(
              icon: Icon(Icons.info, color: Colors.white),
              text: "Info",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildHomeTab(),
          _buildSettingsTab(),
          _buildInfoTab(),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return Container(
      decoration: BoxDecoration(
        gradient: _isDarkMode
            ? const LinearGradient(colors: [Colors.black, Colors.black])
            : const LinearGradient(colors: [Colors.white, Colors.white]),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final random = Random();
          final item = menuItems[index];
          final color = colors[random.nextInt(colors.length)];

          return Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'], size: 50, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  item['label'],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsTab() {
    return Container(
      decoration: BoxDecoration(
        gradient: _isDarkMode
            ? const LinearGradient(colors: [Colors.black, Colors.black])
            : const LinearGradient(colors: [Colors.white, Colors.white]),
      ),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              leading: Icon(Icons.wifi,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Wi-Fi Settings',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: _isDarkMode ? Colors.white : Colors.black),
              onTap: () {},
            ),
            Divider(color: _isDarkMode ? Colors.white : Colors.black),
            ListTile(
              leading: Icon(Icons.bluetooth,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Bluetooth Settings',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: _isDarkMode ? Colors.white : Colors.black),
              onTap: () {},
            ),
            Divider(color: _isDarkMode ? Colors.white : Colors.black),
            ListTile(
              leading: Icon(Icons.notifications,
                  color: _isDarkMode ? Colors.white : Colors.black),
              title: Text('Notification Settings',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black)),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: _isDarkMode ? Colors.white : Colors.black),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTab() {
    return Container(
      decoration: BoxDecoration(
        gradient: _isDarkMode
            ? const LinearGradient(colors: [Colors.black, Colors.black])
            : const LinearGradient(colors: [Colors.white, Colors.white]),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info,
                  size: 100,
                  color: _isDarkMode ? Colors.purple : Colors.purple),
              const SizedBox(height: 20),
              Text(
                'App Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:
                      _isDarkMode ? Colors.white : Colors.black, // Warna teks
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Version: 1.0.0\nDeveloped by Flutter Enthusiasts',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: _isDarkMode
                        ? Colors.white
                        : Colors.black), // Warna teks
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.system,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    home: const TabMenu(),
  ));
}
