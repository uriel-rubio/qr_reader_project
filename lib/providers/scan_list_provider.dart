import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';
  Future<ScanModel> newScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(nuevoScan);
    nuevoScan.id = id;
    if (selectedType == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  loadScansByType(String tipo) async {
    final scans = await DBProvider.db.getScansByType(tipo);
    this.scans = [...?scans];
    selectedType = tipo;
    notifyListeners();
  }

  deleteall() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteById(int id) async {
    await DBProvider.db.deleteScanById(id);
    loadScansByType(selectedType);
    notifyListeners();
  }
}
