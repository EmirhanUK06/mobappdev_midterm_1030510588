import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Prototip - Reorderable List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: ReorderableListUI(),
    );
  }
}

class ReorderableListUI extends StatefulWidget {
  @override
  _ReorderableListUIState createState() => _ReorderableListUIState();
}

class _ReorderableListUIState extends State<ReorderableListUI> {
  List<String> items = [
    'Görev 1: Tasarım yap',
    'Görev 2: Kodları düzenle',
    'Görev 3: Testleri çalıştır',
    'Görev 4: Geri bildirim al',
    'Görev 5: Yayına al',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Center(
    child: Text(
      'T.C.\nERCİYES ÜNİVERSİTESİ',
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    ),
  ),
  ),
  body: Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MÜHENDİSLİK FAKÜLTESİ\nBİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ\nMOBILE APPLICATION DEVELOPMENT DERSİ\nPROJE',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
            textAlign: TextAlign.center,        ),
        SizedBox(height: 16), // Boşluk
        Expanded(
          child: ReorderableListView(
            buildDefaultDragHandles: false,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex -= 1;
                final item = items.removeAt(oldIndex);
                items.insert(newIndex, item);
              });
            },
            children: List.generate(items.length, (index) {
              return Card(
                key: ValueKey(items[index]),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(items[index]),
                  leading: ReorderableDragStartListener(
                    index: index,
                    child: Icon(Icons.drag_indicator),
                  ),
                  trailing: Icon(Icons.check_circle_outline),
                ),
              );
            }),
          ),
        ),
      ],
    ),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Profile',
      ),
    ],
    backgroundColor: Colors.blueAccent,
  ),
  bottomSheet: Container(
    padding: EdgeInsets.all(8),
    color: Colors.blueAccent,
    height: 35,
    child: Center(
      child: Text(
        'Öğretim Üyesi Dr. Fehim Köylü, Öğrenci 1030510588 Emirhan Uğurlu',
        style: TextStyle(
          fontSize: 14,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
    ),
  ),
);
  }
}