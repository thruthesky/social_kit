import 'package:flutter/material.dart';

class CardListTile {
  final Key? key;
  final String label;
  final String? sublabel;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onTap;

  const CardListTile({
    this.key,
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
    this.separator = const SizedBox(height: 0),
  });

  final TextStyle? labelStyle;
  final TextStyle? sublabelStyle;
  final List<CardListTile> children;
  final Widget? separator;

  List<Widget> get cardListItems {
    final list = children.map(
      (item) {
        return ListTile(
          key: item.key,
          // visualDensity: VisualDensity.compact,
          leading: item.leading,
          minLeadingWidth: 32,
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
          child: separator ?? const SizedBox.shrink(),
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
