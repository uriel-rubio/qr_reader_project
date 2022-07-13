import 'package:flutter/cupertino.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

launchURL(BuildContext context, ScanModel scan) async {
  String url = scan.valor;
  if (scan.tipo == 'http') {
    //TODO Comprobar link
    // if (await canLaunch(url)) {
    //   await launchUrlString(url, mode: LaunchMode.inAppWebView);
    // } else {
    //   throw 'Could not launch $url';
    // }
    await launchUrlString(url, mode: LaunchMode.inAppWebView);
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
