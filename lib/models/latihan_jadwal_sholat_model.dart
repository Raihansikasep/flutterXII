class JadwalSholat {
  final String? imsak;
  final String? subuh;
  final String? dzuhur;
  final String? ashar;
  final String? maghrib;
  final String? isya;
  final String? dhuha;
  final String? tanggal;
  final String? terbit;

  JadwalSholat({
    this.imsak,
    this.subuh,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.dhuha,
    this.tanggal,
    this.terbit,
  });

  factory JadwalSholat.fromJson(Map<String, dynamic> json) {
    return JadwalSholat(
      imsak: json['imsak'] ?? '-',
      subuh: json['subuh'] ?? '-',
      dzuhur: json['dzuhur'] ?? '-',
      ashar: json['ashar'] ?? '-',
      maghrib: json['maghrib'] ?? '-',
      isya: json['isya'] ?? '-',
      dhuha: json['dhuha'] ?? '-',
      tanggal: json['tanggal'] ?? '-',
      terbit: json['terbit'] ?? '-', 
    );
  }
}
