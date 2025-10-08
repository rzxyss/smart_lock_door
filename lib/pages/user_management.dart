import 'package:flutter/material.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({Key? key}) : super(key: key);

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
          const SizedBox(height: 16),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFFB0BED1)),
                  const SizedBox(width: 8),
                  Container(
                    width: 100,
                    height: 12,
                    color: const Color(0xFFB0BED1),
                  ),
                  const Spacer(),
                  Container(
                    width: 32,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3EAF3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Color(0xFF7B8FA1),
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // List user dummy
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(12),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD7DFE8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Color(0xFF8B9CB0),
                          size: 32,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                height: 12,
                                color: const Color(0xFF8B9CB0),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 80,
                                height: 10,
                                color: const Color(0xFFD7DFE8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: Color(0xFF7B8FA1),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomNavBar(selectedIndex: 2),
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
