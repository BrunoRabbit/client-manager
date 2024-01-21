import 'package:client_manager/core/themes/text_styles.dart';
import 'package:client_manager/core/utils/tag_util.dart';
import 'package:client_manager/features/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18.0, bottom: 10),
          child: Text(
            'Selecione as Tags do cliente (opcional)',
            style: TextStyles.sectionTitleHeadline1Secondary,
          ),
        ),
        Wrap(
          children: TagUtil.categories.entries.map((entry) {
            String category = entry.key;
            List<String> tags = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyles.sectionTitleHeadline2Primary,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Wrap(
                    children: tags.map((tag) {
                      bool isSelected =
                          controller.selectedTags[category]?.contains(tag) ??
                              false;

                      return GestureDetector(
                        onTap: () => controller.selectTag(category, tag),
                        child: Card(
                          color: !isSelected
                              ? Colors.white
                              : const Color(0xff474A51),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: !isSelected
                                    ? const Color(0xff474A51)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
