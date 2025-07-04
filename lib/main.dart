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

  List<Langage> langages = [];

@override
  void initState() {
    for(String lg in top20langages) {
      langages.add(Langage(lg));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Live demo list grid"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Card(
          elevation: 4,
          color: Colors.lightGreen,
          child: Center(
            child: Text(langages[index].name, style: TextStyle(fontSize: 24)),
          )
        ),
        itemCount: langages.length,
      )
   );
  }


  ListTile langageTile(int index) {
    return ListTile(
          title: Text(langages[index].name, style: const TextStyle(fontSize: 28)),
          leading: Text(index.toString(), style: const TextStyle(fontSize: 20)),
          // use actual Checkbox instead of Icon
          trailing: Checkbox(
            value: langages[index].known,
            onChanged: (value) => setState(() => langages[index].known = value ?? false)
          ),
          onTap: () => debugPrint('appui sur item $index'),
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

class Langage {
  String name;
  bool known = false;

  // CTor
  Langage(this.name, {known = false});

  toggle() => known = !known;

}
