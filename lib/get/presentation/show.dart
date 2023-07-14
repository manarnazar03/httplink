import 'package:flutter/material.dart';
import 'package:httplink/get/domain/sevice.dart';
import 'package:httplink/get/model/model.dart';
import 'package:httplink/post/presentation/view.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  List<User> user = [];
  @override
  void initState() {
    super.initState();
    fetching();
  }

  Future<void> fetching() async {
    final data = await Service().getdata();
    setState(() {
      user = data.cast<User>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GET"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ViewPage()));
            },
            child: const Icon(Icons.add)),
        body: ListView.builder(
            itemCount: user.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text(user[index].id.toString())),
                  title: Text(
                    user[index].name,
                    style: const TextStyle(fontSize: 40),
                  ),
                  subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          user[index].email,
                          style: const TextStyle(fontSize: 25),
                        ),
                        Text(
                          user[index].body,
                          style: const TextStyle(fontSize: 20),
                        )
                      ]),
                ),
              );
            }));
  }
}
