import 'package:client_manager/core/enums/form_mode.dart';
import 'package:client_manager/core/models/client_model.dart';
import 'package:client_manager/core/themes/app_colors.dart';
import 'package:client_manager/core/utils/success_messages.dart';
import 'package:client_manager/core/utils/tag_util.dart';
import 'package:client_manager/features/add_or_edit_client/widgets/form_widget.dart';
import 'package:client_manager/features/add_or_edit_client/widgets/tags_widget.dart';
import 'package:client_manager/features/home/home_controller.dart';
import 'package:client_manager/shared/widgets/custom_button.dart';
import 'package:client_manager/shared/widgets/snack_bar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddOrEditClient extends StatefulWidget {
  const AddOrEditClient({
    required this.mode,
    this.clientModel,
    required this.index,
    super.key,
  });

  final FormMode mode;
  final ClientModel? clientModel;
  final int? index;

  @override
  State<AddOrEditClient> createState() => _AddOrEditClientState();
}

class _AddOrEditClientState extends State<AddOrEditClient> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool get isAddMode => widget.mode == FormMode.add;

  String get title => isAddMode ? "Adicione um cliente" : "Edite um cliente";
  String get buttonText => isAddMode ? "Adicionar cliente" : "Editar cliente";
  late HomeController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<HomeController>(context);
  }

  @override
  void initState() {
    super.initState();
    if (!isAddMode) {
      final homeController = Provider.of<HomeController>(
        context,
        listen: false,
      );

      nameEC.text = widget.clientModel!.name;
      emailEC.text = widget.clientModel!.email;

      for (var category in TagUtil.categories.keys) {
        homeController.selectedTags[category] = widget.clientModel!.tags
            .where((tag) => TagUtil.categories[category]!.contains(tag))
            .toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.scaffoldColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
            controller.selectedTags.clear();
          },
        ),
        backgroundColor: AppColors.scaffoldColor,
        title: Text(title),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormWidget(
                    emailEC: emailEC,
                    nameEC: nameEC,
                    title: title,
                  ),
                  const TagsWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: buttonText,
                          onPressed: () async {
                            if (isAddMode) {
                              await _handleAddClient();
                            } else {
                              await _handleEditClient(
                                controller,
                                widget.index!,
                              );
                            }
                          },
                        ),
                      ),
                      if (!isAddMode) ...[
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                            buttonText: 'Deletar',
                            buttonColor: Colors.white,
                            textColor: const Color(0xff171717),
                            onPressed: () async {
                              showDeleteDialog(context, controller);
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDeleteDialog(BuildContext context, HomeController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deletar cliente?"),
          content: const Text(
            "Você tem certeza? Essa ação é irreversível.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "FECHAR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: const Color(0xff0A1D4D),
                shape: const LinearBorder(),
              ),
              child: const Text(
                "CONTINUAR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onPressed: () async => await _handleDeleteClient(controller),
            ),
          ],
        );
      },
    );
  }

  _handleDeleteClient(HomeController controller) async {
    final response = await controller.removeClient(widget.clientModel!.id!);

    controller.selectedTags.clear();
    if (!mounted) return;
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget.showSuccessSnackBar(SuccessMessages.deleteSuccess),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget.showErrorSnackBar(response.data),
      );
    }
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  _handleEditClient(HomeController controller, int index) async {
    final newName =
        nameEC.text.isEmpty ? controller.clients[index].name : nameEC.text;
    final newEmail =
        emailEC.text.isEmpty ? controller.clients[index].email : emailEC.text;
    final newTags = controller.getSelectedTags();

    if (_verifyOldClientData(controller, index, newName, newEmail, newTags)) {
      final newClient = ClientModel(
        name: newName,
        email: newEmail,
        tags: newTags,
      );
      final response = await controller.editClient(newClient, index);

      if (response.statusCode == 200) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.showSuccessSnackBar(SuccessMessages.editClient),
        );

        Navigator.of(context).pop();
        FocusScope.of(context).unfocus();
        controller.selectedTags.clear();
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.showErrorSnackBar(response.data),
        );
      }
    }
  }

  _handleAddClient() async {
    if (_formKey.currentState!.validate()) {
      final result = await context
          .read<HomeController>()
          .addClients(nameEC.text, emailEC.text);

      if (!mounted) return;
      if (result.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.showSuccessSnackBar(SuccessMessages.addClient),
        );

        FocusScope.of(context).unfocus();
        nameEC.clear();
        emailEC.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.showErrorSnackBar(result.data),
        );
      }
    }
  }

  _verifyOldClientData(HomeController controller, int index, String newName,
      String newEmail, List<String> newTags) {
    final oldName = controller.clients[index].name;
    final oldEmail = controller.clients[index].email;
    final oldTags = controller.clients[index].tags;

    final isSameOldValues = newName != oldName ||
        newEmail != oldEmail ||
        !listEquals(newTags, oldTags);

    if (!isSameOldValues) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget.showSuccessSnackBar(SuccessMessages.sameEditValues),
      );
      return false;
    }

    return true;
  }
}
