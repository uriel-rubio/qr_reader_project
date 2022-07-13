import 'package:flutter/material.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/widgets/widgets.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => ScanTile(
        index: index,
        selectedType: 1,
      ),
    );
  }
}
