import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List & Grids',
      theme: ThemeData(
        useMaterial3: true
         ),
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
  
}

const List<String> top20langages = [
  'Java',
  'JavaScript',
  'Python',
  'C#',
  'C++',
  'PHP',
  'Swift',
  'TypeScript',
  'Ruby',
  'Go',
  'Kotlin',
  'Rust',
  'Dart',
  'SQL',
  'Ada',
  'Pascal',
  'Objective-C',
  'R',
  'Modula',
  'Perl'
];

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Live demo list grid"),
      ),
      //body: SingleChildScrollView (
      body: ListView.separated (
       itemBuilder: (context, index) => languageItem(top20langages[index]),
       separatorBuilder: (context,index) => Divider(
        endIndent: 20,
        indent: 20,
        thickness: 2,
       ),
       itemCount: top20langages.length,
    ),
   );
  }

Widget languageItem(String s) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(s, style: const TextStyle(fontSize: 28)),
            const Icon(Icons.check_box_outline_blank)
          ]
        )
      );
  }

List<Widget> languageListWidget() {
    List<Widget> rows = [];
    for(String lg in top20langages) {
      final row = Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(lg, style: const TextStyle(fontSize: 28)),
            const Icon(Icons.check_box_outline_blank)
          ]
        )
      );
      rows.add(row);
    }
    return rows;
  }

}
