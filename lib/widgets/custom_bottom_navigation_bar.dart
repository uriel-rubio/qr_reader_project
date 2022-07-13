import 'package:flutter/material.dart';
import 'package:qr_reader/providers/providers.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final int currentIndex = uiProvider.selectedScreen;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Ubicaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Links',
        ),
      ],
      onTap: (int i) => uiProvider.selectedScreen = i,
    );
  }
}
