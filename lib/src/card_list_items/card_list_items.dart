import 'package:flutter/material.dart';

class CardListTile {
  final String label;
  final String? sublabel;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onTap;

  const CardListTile({
    required this.label,
    this.sublabel,
    this.leading,
    this.trailing,
    required this.onTap,
  });
}

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
    this.labelStyle,
    this.sublabelStyle,
    required this.children,
    this.divider = const SizedBox(height: 0),
  });

  final TextStyle? labelStyle;
  final TextStyle? sublabelStyle;
  final List<CardListTile> children;
  final Widget? divider;

  List<Widget> get cardListItems {
    final list = children.map(
      (item) {
        return ListTile(
          // visualDensity: VisualDensity.compact,
          leading: item.leading,
          title: Row(
            children: [
              Text(
                item.label,
                style: labelStyle,
              ),
              const Spacer(),
              Text(item.sublabel ?? '', style: sublabelStyle),
            ],
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
          child: divider ?? const SizedBox.shrink(),
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
