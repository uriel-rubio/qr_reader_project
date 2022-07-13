import 'package:flutter/material.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final int currentIndex = uiProvider.selectedScreen;
    final ScanListProvider scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentIndex == 0 ? 'Historial de ubicaciones' : 'Historial de links',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
            ),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false).deleteall();
            },
          ),
        ],
      ),
      body: _HomePageBody(
        currentIndex: currentIndex,
        scanListProvider: scanListProvider,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  final int currentIndex;
  final ScanListProvider scanListProvider;

  const _HomePageBody(
      {Key? key, required this.currentIndex, required this.scanListProvider})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const LocationsScreen();

      case 1:
        scanListProvider.loadScansByType('http');
        return const UrlsScreen();

      default:
        return const LocationsScreen();
    }
  }
}
