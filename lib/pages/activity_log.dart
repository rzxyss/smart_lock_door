import 'package:flutter/material.dart';
import 'dashboard.dart';

class ActivityLogPage extends StatelessWidget {
  const ActivityLogPage({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          // Filter bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _FilterButton(selected: true),
                const SizedBox(width: 8),
                _FilterButton(),
                const SizedBox(width: 8),
                _FilterButton(),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB0BED1),
                      borderRadius: BorderRadius.circular(8),
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
          // List log dummy
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: index % 3 == 0
                        ? const Color(0xFF8B9CB0)
                        : const Color(0xFFD7DFE8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomNavBar(selectedIndex: 1),
    );
  }
}

// Duplicate _BottomNavBar and _NavBarIcon from dashboard.dart for navigation
class _BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  const _BottomNavBar({required this.selectedIndex});

  void _onTap(BuildContext context, int index) {
    if (index == selectedIndex) return;
    if (index == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } else if (index == 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ActivityLogPage()),
      );
    }
    // Tambah navigasi lain jika perlu
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

class _FilterButton extends StatelessWidget {
  final bool selected;
  const _FilterButton({this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 32,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF3976F6) : const Color(0xFFE3EAF3),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
