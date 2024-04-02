import 'package:flutter/material.dart';

class ComicTextBox extends StatelessWidget {
  const ComicTextBox({
    super.key,
    this.title,
    this.content,
  });

  final Widget? title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) title!,
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1.6,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: content ?? const SizedBox(),
        ),
      ],
    );
  }
}
