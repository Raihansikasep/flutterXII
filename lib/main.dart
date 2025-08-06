// import 'package:flutter/material.dart';
// import 'package:xii_rpl_3/pages/sholat/detail_screen_sholat.dart';
// import 'package:xii_rpl_3/models/latihan_jadwal_sholat_model.dart';
// import 'package:xii_rpl_3/services/sholat_services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Jadwal Sholat',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[100],
//         textTheme: const TextTheme(
//           bodyMedium: TextStyle(fontSize: 16),
//         ),
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('🕌 Jadwal Sholat Hari Ini'),
//         centerTitle: true,
//         backgroundColor: Colors.teal[600],
//       ),
//       body: const JadwalSholatWidget(),
//     );
//   }
// }

// class JadwalSholatWidget extends StatelessWidget {
//   const JadwalSholatWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<JadwalSholat>>(
//       future: SholatService.fetchAlbum(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error ?? '-'}'));
//         }

//         final jadwalList = snapshot.data ?? [];

//         return ListView.builder(
//           padding: const EdgeInsets.all(12),
//           itemCount: jadwalList.length,
//           itemBuilder: (context, index) {
//             final data = jadwalList[index];

//             return Card(
//               elevation: 4,
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               color: Colors.white,
//               child: ListTile(
//                 contentPadding: const EdgeInsets.all(16),
//                 leading: const Icon(Icons.calendar_today, color: Colors.teal),
//                 title: Text(
//                   'Tanggal: ${data.tanggal ?? '-'}',
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text('Terbit: ${data.terbit ?? '-'}'),
//                 trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => JadwalSholatScreen(
//                         imsyak: data.imsak ?? '-',
//                         shubuh: data.subuh ?? '-',
//                         dzuhur: data.dzuhur ?? '-',
//                         tanggal: data.tanggal ?? '-',
//                         terbit: data.terbit ?? '-',
//                         magrib: data.maghrib ?? '-',
//                         isya: data.isya ?? '-',
//                         dhuha: data.dhuha ?? '-',
//                         ashar: data.ashar ?? '-',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:xii_rpl_3/pages/auth/login_screen.dart';
// import 'package:xii_rpl_3/pages/home_screen.dart';
// import 'services/auth_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final authService = AuthService();
//   final isLoggedIn = await authService.isLoggedIn();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: isLoggedIn ? HomeScreen() : LoginScreen(),
//   ));
// }


import 'package:flutter/material.dart';
import 'package:xii_rpl_3/pages/auth/login_screen.dart';
import 'package:xii_rpl_3/pages/home_screen.dart';
import 'package:xii_rpl_3/services/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Example',
      home: AuthCheck(), 
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final AuthService _authService = AuthService();
  late Future<bool> _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = _authService.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData && snapshot.data == true) {
          return HomeScreen(); 
        } else {
          return LoginScreen(); 
        }
      },
    );
  }
}