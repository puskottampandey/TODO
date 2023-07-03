import 'package:flutter/material.dart';
import 'package:statemanagement/screens/model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ))),
        title: const Center(
          child: Text(
            "HomePage",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
            valueListenable: ContactBook(),
            builder: (item, value, child) {
              final items = value;
              return items.isEmpty
                  ? const Center(
                      child: Text(
                        "Add Item",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final contact = items[index];
                        return Dismissible(
                          onDismissed: (direction) {
                            ContactBook().remove(item: contact);
                          },
                          key: ValueKey(contact.id),
                          child: Card(
                            elevation: 6.0,
                            child: ListTile(
                              subtitle: Text(
                                DateTime.now().toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  contact.name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-items');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
