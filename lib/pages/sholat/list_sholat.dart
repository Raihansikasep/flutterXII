import 'package:flutter/material.dart';
import 'package:xii_rpl_3/models/latihan_jadwal_sholat_model.dart';
import 'package:xii_rpl_3/pages/sholat/detail_screen_sholat.dart';
import 'package:xii_rpl_3/services/sholat_services.dart';
// import 'package:xii_rpl_3/pages/produk/create_product.dart';

class SholatListScreen extends StatelessWidget {
  const SholatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("jadwal sholat")),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (_) => ProductCreateScreen()));
      //   },
      // ),
      body: FutureBuilder<List<JadwalSholat>>(
        future: SholatService.fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasData && snapshot.data!.isEmpty)
            return Center(child: Text("No products"));

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final sholat = snapshot.data![index];
              return ListTile(
                leading: Image.network(
                    "http://127.0.0.1:8000/storage/${sholat.tanggal}",
                    width: 50),
                subtitle: Text("Rp ${sholat.terbit}"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => 
                    JadwalSholatScreen(
                      imsyak: sholat.imsak!,
                      shubuh: sholat.subuh!,
                      dzuhur: sholat.dzuhur!,
                      tanggal: sholat.tanggal!,
                      terbit: sholat.terbit!,
                      magrib: sholat.maghrib!,
                      isya: sholat.isya!,
                      dhuha: sholat.dhuha!,
                      ashar: sholat.ashar!,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
