import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../components/disease_tile.dart';
import '../../search/search.dart';

class SearchedDiseasesList extends ReactiveStatelessWidget {
  const SearchedDiseasesList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: searchBloc.searchModel.searchedDiseases.length,
      itemBuilder: (context, index) {
        final eachDisease = searchBloc.searchModel.searchedDiseases[index];
        return DiseaseTile(id: eachDisease.id);
      },
    );
  }
}
