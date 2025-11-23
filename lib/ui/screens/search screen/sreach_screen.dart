import 'package:flutter/material.dart';


class SreachScreen extends StatefulWidget {
  const SreachScreen({super.key});
  static const String routeName = "Sreach Screen ";

  @override
  State<SreachScreen> createState() => _SreachScreenState();
}

class _SreachScreenState extends State<SreachScreen> {
  final TextEditingController controller = TextEditingController();
  List<String> results = [];

  void searchNews(String text) {
    setState(() {
      results = [
        "نتيجة بحث: $text",
        "خبر مشابه: $text 2",
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Search news...",
            border: InputBorder.none,
          ),
          onSubmitted: searchNews,
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(results[index]),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/article",
                  arguments: {
                    "url": "https://example.com/search-result"
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}




