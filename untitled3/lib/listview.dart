import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: ListViewPage());
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  static const List<String> titleList = [
    '치과의사',
    '약사',
    '학교 선생님',
    'IT 관리자',
    '게임 개발자',
    '변호사',
    '헤어 디자이너',
    '의사',
    '웹 개발자',
    '비서',
  ];

  static const List<String> imageList = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
  ];

  static const List<String> description = [
    '1.There are different types of careers you can pursue in your life. Which one will it be?',
    '2.There are different types of careers you can pursue in your life. Which one will it be?',
    '3.There are different types of careers you can pursue in your life. Which one will it be?',
    '4.There are different types of careers you can pursue in your life. Which one will it be?',
    '5.There are different types of careers you can pursue in your life. Which one will it be?',
    '6.There are different types of careers you can pursue in your life. Which one will it be?',
    '7.There are different types of careers you can pursue in your life. Which one will it be?',
    '8.There are different types of careers you can pursue in your life. Which one will it be?',
    '9.There are different types of careers you can pursue in your life. Which one will it be?',
    '10.There are different types of careers you can pursue in your life. Which one will it be?',
  ];

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  void showPop(context, index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ListViewPage.imageList[index],
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                  ListViewPage.titleList[index],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    ListViewPage.description[index],
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Text("Close"),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ListView", style: TextStyle(color: Colors.grey[500])),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: ListViewPage.titleList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showPop(context, index);
            },
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(ListViewPage.imageList[index]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // 왼쪽 정렬
                      children: [
                        Text(
                          ListViewPage.titleList[index],
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: width,
                          child: Text(
                            ListViewPage.description[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
