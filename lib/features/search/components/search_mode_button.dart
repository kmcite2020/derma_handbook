import 'package:derma_handbook/features/core/extensions.dart';
import 'package:derma_handbook/features/search/components/search_mode_icon.dart';
import 'package:derma_handbook/features/search/search.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SearchModeButton extends ReactiveStatelessWidget {
  const SearchModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SearchMode>(
      tooltip: 'Search Mode',
      initialValue: searchModel.searchMode,
      icon: SearchModeIcon(),
      onSelected: setSearchMode,
      itemBuilder: (_) {
        return SearchMode.values.map(
          (eachSearchMode) {
            return PopupMenuItem(
              value: eachSearchMode,
              enabled: searchModel.searchMode != eachSearchMode,
              child: eachSearchMode.name.text(),
            );
          },
        ).toList();
      },
    ).pad();
  }
}
