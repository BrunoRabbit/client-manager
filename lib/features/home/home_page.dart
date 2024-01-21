import 'package:client_manager/core/enums/form_mode.dart';
import 'package:client_manager/core/routes/routes.dart';
import 'package:client_manager/core/themes/app_colors.dart';
import 'package:client_manager/core/themes/text_styles.dart';
import 'package:client_manager/features/home/home_controller.dart';
import 'package:client_manager/features/home/widgets/client_card.dart';
import 'package:client_manager/shared/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final findEC = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<HomeController>(context);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().loadAllClients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldColor,
        surfaceTintColor: AppColors.scaffoldColor,
        title: const Text('Client Manager'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed(
              AppRoutes.addOrEdit,
              arguments: {'mode': FormMode.add},
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Encontre um cliente',
                      style: TextStyles.sectionTitleHeadline2Primary,
                    ),
                    TextFieldWidget(
                      controller: findEC,
                      icon: const Icon(Icons.search),
                      onChanged: (text) async {
                        controller.searchClient(text);
                      },
                    ),
                  ],
                ),
              ),
              controller.searchResult.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controller.searchResult.length,
                        itemBuilder: (context, index) {
                          final client = controller.searchResult[index];

                          return ClientCard(client: client, index: index);
                        },
                      ),
                    )
                  : Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyles
                                            .sectionTitleHeadline1Secondary
                                            .copyWith(fontSize: 18),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${controller.searchResult.length} resultados encontrados para ',
                                          ),
                                          TextSpan(
                                            text: findEC.text,
                                            style: const TextStyle(
                                              color: Color(0xff474A51),
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Por favor, tente uma nova busca',
                                      style: TextStyles
                                          .sectionTitleHeadline1Secondary
                                          .copyWith(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
