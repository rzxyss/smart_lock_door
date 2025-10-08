import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Location and status bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3EAF3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.location_on,
                    color: Color(0xFF7B8FA1),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B9CB0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // List setting dummy
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B9CB0),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 48,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3976F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          // Save button dummy
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF3976F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Container(
                  width: 60,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _BottomNavBar(selectedIndex: 3),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  const _BottomNavBar({required this.selectedIndex});

  void _onTap(BuildContext context, int index) {
    if (index == selectedIndex) return;
    if (index == 0) {
      Navigator.of(context).pushReplacementNamed('/');
    } else if (index == 1) {
      Navigator.of(context).pushReplacementNamed('/activity');
    } else if (index == 2) {
      Navigator.of(context).pushReplacementNamed('/user');
    } else if (index == 3) {
      Navigator.of(context).pushReplacementNamed('/setting');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE3EAF3), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarIcon(
            icon: Icons.home,
            selected: selectedIndex == 0,
            onTap: () => _onTap(context, 0),
          ),
          _NavBarIcon(
            icon: Icons.list_alt,
            selected: selectedIndex == 1,
            onTap: () => _onTap(context, 1),
          ),
          _NavBarIcon(
            icon: Icons.person,
            selected: selectedIndex == 2,
            onTap: () => _onTap(context, 2),
          ),
          _NavBarIcon(
            icon: Icons.settings,
            selected: selectedIndex == 3,
            onTap: () => _onTap(context, 3),
          ),
        ],
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _NavBarIcon({
    required this.icon,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected ? const Color(0xFF3976F6) : const Color(0xFFB0BED1),
          ),
          if (selected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF8B9CB0),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}
