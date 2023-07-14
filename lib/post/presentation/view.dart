import 'package:flutter/material.dart';
import 'package:httplink/post/domain/service.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController slogan = TextEditingController();
  TextEditingController headQuaters = TextEditingController();
  TextEditingController established = TextEditingController();

  Future<void> fetchingdata(context) async {
    try {
      final data = await PostService().posting(
          name: name.text,
          country: country.text,
          establishment: established.text,
          slogan: slogan.text,
          headquarters: headQuaters.text);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("error"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("ok"))
              ],
            );
          });
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("user added successfully"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("ok"))
              ],
            );
          });
    }
    clear();
  }

  void clear() {
    name.clear();
    country.clear();
    slogan.clear();
    established.clear();
    headQuaters.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextField(
                      controller: name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("name")),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextField(
                      controller: country,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("country")),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextField(
                      controller: slogan,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("slogan")),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextField(
                      controller: headQuaters,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("head_quarters")),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextField(
                      controller: established,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("establishment")),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          fetchingdata(context);
                        },
                        child: const Text("SAVE")),
                  )
                ])),
      ),
    );
  }
}
