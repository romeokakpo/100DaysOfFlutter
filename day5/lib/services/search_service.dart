import 'package:flutter/material.dart';

import '../constants/suggestions.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var topic in suggestions..sort()) {
      if (topic.toLowerCase().contains(query.trim().toLowerCase())) {
        matchQuery.add(topic);
      }
    }
    if (matchQuery.isEmpty) {
      matchQuery.add("Search \"$query\"");
      return ListView.builder(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(matchQuery[index]),
            onTap: () {
              close(context, query);
            },
          );
        }),
        itemCount: 1,
      );
    }
    return ListView.builder(
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
          onTap: () {
            query = matchQuery[index];
            close(context, query);
          },
        );
      }),
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var topic in suggestions..sort()) {
      if (topic.toLowerCase().contains(query.trim().toLowerCase())) {
        matchQuery.add(topic);
      }
    }
    if (matchQuery.isEmpty) {
      matchQuery.add("Search \"$query\"");
      return ListView.builder(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(matchQuery[index]),
            onTap: () {
              close(context, query);
            },
          );
        }),
        itemCount: 1,
      );
    }
    return ListView.builder(
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
          onTap: () {
            query = matchQuery[index];
            close(context, query);
          },
        );
      }),
      itemCount: matchQuery.length,
    );
  }
}
