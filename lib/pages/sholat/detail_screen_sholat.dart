import 'package:flutter/material.dart';

class JadwalSholatScreen extends StatelessWidget {
  final String imsyak;
  final String shubuh;
  final String dzuhur;
  final String tanggal;
  final String terbit;
  final String magrib;
  final String isya;
  final String dhuha;
  final String ashar;

  JadwalSholatScreen(
      {required this.imsyak,
      required this.shubuh,
      required this.dzuhur,
      required this.tanggal,
      required this.terbit,
      required this.magrib,
      required this.isya,
      required this.dhuha,
      required this.ashar});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(imsyak, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(shubuh, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(dzuhur, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(tanggal, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(terbit, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(magrib, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(isya, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(dhuha, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(ashar, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}