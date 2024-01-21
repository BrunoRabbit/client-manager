import 'package:client_manager/core/enums/form_mode.dart';
import 'package:client_manager/core/models/client_model.dart';
import 'package:client_manager/core/routes/routes.dart';
import 'package:client_manager/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    super.key,
    required this.client,
    required this.index,
  });

  final ClientModel client;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client.name,
                        style: TextStyles.sectionTitleHeadline2Primary,
                      ),
                      Text(
                        client.email,
                        style: TextStyles.sectionTitleHeadline1Secondary
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.edit,
                      color: Color(0xffFFA726),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.addOrEdit,
                      arguments: {
                        "mode": FormMode.edit,
                        "client_model": client,
                        "index": index,
                      },
                    );
                  },
                ),
              ],
            ),
            client.tags.isNotEmpty
                ? Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: client.tags.where((tag) => tag != "").map((tag) {
                      return Card(
                        color: const Color(0xff474A51),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
