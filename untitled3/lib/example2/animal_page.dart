import 'package:flutter/material.dart';
import 'package:untitled3/example2/animal.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key}); // ,required this.animal

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  late final Animal animal;
  bool isLiked = false;
  int likeCount = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    animal = ModalRoute.of(context)?.settings.arguments as Animal;
    if (animal.likeCount > 0) {
      isLiked = true;
    }
    likeCount = animal.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(animal.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(animal.imagePath),
            ),
            SizedBox(height: 20),
            Text(
              "It lives in ${animal.location}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = true;
                      likeCount++;
                      animal.likeCount++;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 40,
                  ),
                ),
                Text(
                  "$likeCount",
                  style: TextStyle(fontSize: 25, color: Colors.purple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
