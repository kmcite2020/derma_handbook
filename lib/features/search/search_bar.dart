import 'package:derma_handbook/features/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../settings/settings.dart';
import 'search.dart';

final searchTxt = RM.injectTextEditing(text: searchBloc.searchModel.search);

class SearchBarWidget extends ReactiveStatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(Icons.search).pad(),
      focusNode: searchTxt.focusNode,
      hintText: 'Enter name to search',
      controller: searchTxt.controller,
      onChanged: searchBloc.setSearchText,
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            settingsManager.settings.borderRadius,
          ),
        ),
      ),
    ).pad();
  }
}
