import 'package:day4/providers/models_providers.dart';
import 'package:day4/request/request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/list_model.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? currentModel;
  late Future<ListModel> futureModel;

  @override
  void initState() {
    futureModel = Request.getModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final modelsProvider = Provider.of<ModelsProviders>(context, listen: false);
    currentModel = modelsProvider.getCurrentModel;

    return FutureBuilder(
        future: futureModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FittedBox(
              child: DropdownButton(
                  dropdownColor: colors.primary,
                  items: List<DropdownMenuItem>.generate(
                      snapshot.data!.list.length,
                      (index) => DropdownMenuItem(
                          value: snapshot.data!.list[index],
                          child: Text(
                            snapshot.data!.list[index],
                            style: TextStyle(color: colors.onPrimary),
                          ))),
                  value: currentModel,
                  onChanged: ((value) {
                    setState(() {
                      currentModel = value.toString();
                    });
                    modelsProvider.setCurrentModel(value.toString());
                  })),
            );
          }
          return SizedBox.shrink();
        });
  }
}
