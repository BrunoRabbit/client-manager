// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client_manager/core/utils/email_regex.dart';
import 'package:flutter/material.dart';

import 'package:client_manager/core/themes/text_styles.dart';
import 'package:client_manager/shared/widgets/text_field_widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.title,
    required this.nameEC,
    required this.emailEC,
  });

  final String title;
  final TextEditingController nameEC;
  final TextEditingController emailEC;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.sectionTitleHeadline1Primary,
        ),
        _TitleAndForm('Nome', nameEC),
        const SizedBox(
          height: 18,
        ),
        _TitleAndForm('Email', emailEC),
      ],
    );
  }
}

class _TitleAndForm extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const _TitleAndForm(this.title, this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(
            title,
            style: TextStyles.sectionTitleHeadline1Secondary,
          ),
        ),
        TextFieldWidget(
          controller: controller,
          hintText: "Insira o ${title.toLowerCase()}",
          validator: (text) {
            if (text!.isEmpty) {
              return "$title não pode ser vazio!";
            }

            if (title == "Email" && !EmailRegex.emailRegex(text)) {
              return "Email incorreto!";
            }
            return null;
          },
        ),
      ],
    );
  }
}
