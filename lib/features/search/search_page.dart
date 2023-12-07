import 'package:derma_handbook/features/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../core/constants.dart';
import '../settings/settings.dart';
import 'search_bar.dart';
import 'search.dart';
import '../diseases/pages/searched_diseases_list.dart';

class SearchPage extends ReactiveStatelessWidget {
  const SearchPage({super.key});
  Icon searchIcon(SearchMode searchMode) {
    switch (searchMode) {
      case SearchMode.contains:
        return const Icon(Icons.search);
      case SearchMode.startsWith:
        return const Icon(Icons.start);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appTitle.text(settingsManager.settings.headlineTextSize),
        actions: [
          PopupMenuButton<SearchMode>(
            tooltip: 'Search Mode',
            initialValue: searchBloc.searchModel.searchMode,
            icon: searchIcon(searchBloc.searchModel.searchMode),
            onSelected: searchBloc.setSearchMode,
            itemBuilder: (_) {
              return SearchMode.values.map(
                (eachSearchMode) {
                  return PopupMenuItem(
                    value: eachSearchMode,
                    enabled:
                        searchBloc.searchModel.searchMode != eachSearchMode,
                    child: eachSearchMode.name.text(),
                  );
                },
              ).toList();
            },
          ).pad()
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: const [
          SearchBarWidget(),
          SearchedDiseasesList(),
        ],
      ),
    );
  }
}
