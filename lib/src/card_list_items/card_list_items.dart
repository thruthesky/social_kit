import 'package:flutter/material.dart';

class CardListItem {
  final String label;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onTap;

  const CardListItem({
    required this.label,
    this.leading,
    this.trailing,
    required this.onTap,
  });
}

class CardListItems extends StatelessWidget {
  const CardListItems({
    super.key,
    this.textStyle,
    required this.items,
    this.divider = false,
  });

  final TextStyle? textStyle;
  final List<CardListItem> items;
  final bool divider;

  List<Widget> get cardListItems {
    final list = items.map(
      (item) {
        return ListTile(
          // visualDensity: VisualDensity.compact,
          leading: item.leading,
          title: Text(
            item.label,
            style: textStyle,
          ),
          trailing: SizedBox(width: 24, child: Center(child: item.trailing)),
          onTap: item.onTap,
          // dense: true,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(16.0)),
          // ),
        );
      },
    ).toList();

    return list.fold(
      [],
      (previousValue, element) => previousValue
        ..add(element)
        ..add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: divider
              ? const Divider(height: 9)
              : const SizedBox(
                  height: 7,
                ),
        )),
    )..removeLast();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cardListItems,
        ),
      ),
    );
  }
}
