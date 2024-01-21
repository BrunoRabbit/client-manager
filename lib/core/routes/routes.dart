import 'package:client_manager/core/enums/form_mode.dart';
import 'package:client_manager/core/models/client_model.dart';
import 'package:client_manager/features/add_or_edit_client/add_or_edit_client.dart';
import 'package:client_manager/features/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String addOrEdit = '/add-or-edit';
}

class AppRouter {
  static Map<String, Widget Function(BuildContext)> paths = {
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.addOrEdit: (context) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final mode = arguments['mode'] as FormMode;
      final index = mode == FormMode.edit
          ? arguments['index'] as int
          : null;
      final clientModel = mode == FormMode.edit
          ? arguments['client_model'] as ClientModel
          : null;

      return AddOrEditClient(
        mode: mode,
        clientModel: clientModel,
        index: index,
      );
    },
  };
}
