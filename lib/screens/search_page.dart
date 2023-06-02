import 'package:flutter/material.dart';
import 'package:job_portal_app/models/job_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<JobModel> displayList;

  @override
  void initState() {
    super.initState();
    displayList = List.from(job_list);
  }

  void updateList(String value) {
    setState(() {
      displayList = job_list
          .where((element) =>
              element.companyName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => updateList(value),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search Jobs",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    displayList[index].companyName!,
                    style: const TextStyle(color: Colors.cyan, fontSize: 15),
                  ),
                  subtitle: Text(
                    displayList[index].position!,
                    style:
                        const TextStyle(fontSize: 10, color: Colors.redAccent),
                  ),
                  trailing: Text(displayList[index].salary!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
