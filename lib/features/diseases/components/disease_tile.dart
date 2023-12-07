import 'dart:typed_data';
import 'package:derma_handbook/features/core/extensions.dart';
import 'package:derma_handbook/features/diseases/components/disease_builder.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/router.dart';
import '../../settings/settings.dart';
import '../diseases_providers.dart';
import '../pages/disease.dart';

class DiseaseTile extends ReactiveStatelessWidget {
  const DiseaseTile({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return DiseaseBuilder(
      id: id,
      builder: (context, disease) {
        return Card(
          child: ListTile(
            title: disease.name.text(),
            // subtitle: disease.id.textify(),
            onTap: () {
              navigator.to(DiseasePage(id: disease.id));
            },
            leading: CircleAvatar(
              child: (disease).image == null
                  ? null
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(
                          settingsManager.settings.borderRadius),
                      child: Image.memory(
                        (disease).image as Uint8List,
                        fit: BoxFit.fill,
                        height: 40,
                        width: 40,
                      ),
                    ),
            ),
            trailing: IconButton(
              onPressed: () => DiseasesMutations.removeDisease(disease),
              icon: const Icon(Icons.delete_forever),
            ),
          ),
        );
      },
    );
  }
}
