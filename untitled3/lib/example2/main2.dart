import 'package:flutter/material.dart';
import 'package:untitled3/example2/animal.dart';
import 'package:untitled3/example2/animal_data_source.dart';
import 'package:untitled3/example2/animal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => MyPage(),
        "/animal_page": (context) => AnimalPage(),
      },
      // home: MyPage()
    );
  }
}

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Animal> animalData = List.generate(
    AnimalDataSource.animalName.length,
        (index) => Animal(
      name: AnimalDataSource.animalName[index],
      imagePath: AnimalDataSource.animalImagePath[index],
      location: AnimalDataSource.animalLocation[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(animalData[index].imagePath),
              ),
              title: Text(animalData[index].name),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/animal_page",
                  arguments: animalData[index],
                );
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => AnimalPage(animal: animalData[index]),
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
