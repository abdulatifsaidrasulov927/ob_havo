import 'package:flutter/material.dart';

import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/ui/widgets/widgets/serch_result_screen.dart';

class ContactSearchView extends SearchDelegate {
  ContactSearchView({required this.suggestionList, required this.apiProvider});

  final List<String> suggestionList;
  final ApiProvider apiProvider;

  FutureBuilder<UniversalData>() async {
    await ApiProvider.getMainWeatherDataByQuery(query: "");
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = query;
          },
          icon: const Icon(Icons.close),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, query);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(
          suggestions.length,
          (index) => GestureDetector(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchResultScreen(),
                ));
              },
              trailing: const Icon(
                Icons.phone,
                size: 30,
                color: Colors.green,
              ),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[600]),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_3_rounded,
                        size: 30,
                        color: Colors.white,
                      )
                    ]),
              ),
              titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              title: Text(suggestions[index]),
            ),
            onTap: () {
              query = suggestions[index];
              // close(context, query);
            },
          ),
        ),
      ),
    );
  }
}
