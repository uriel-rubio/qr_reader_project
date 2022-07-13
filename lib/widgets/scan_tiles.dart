import 'package:flutter/material.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTile extends StatelessWidget {
  final int index;
  final int selectedType;
  const ScanTile({Key? key, required this.index, required this.selectedType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red.shade700,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('Eliminar',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(width: 10),
            Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 10)
          ],
        ),
      ),
      onDismissed: (DismissDirection direction) {
        Provider.of<ScanListProvider>(context, listen: false)
            .deleteById(scans[index].id!.toInt());
      },
      child: ListTile(
        leading: Icon(
          selectedType == 1 ? Icons.location_pin : Icons.link_rounded,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[index].valor),
        subtitle: Text(scans[index].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right_rounded),
        onTap: () {
          launchURL(context, scans[index]);
        },
      ),
    );
  }
}
