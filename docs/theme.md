# Theme Design

There are three themes that comes with SocialKit. You can develop your own theme. And if you do, please share with us.


### comicTheme

This is an opinionated comic book style theme.

- If you want to override the comic theme, you can try something like below.

```dart
import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';
import 'package:social_kit_example/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: comicTheme(context: context).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: comicTheme(context: context).colorScheme.secondary,
            backgroundColor:
                comicTheme(context: context).colorScheme.background,
            elevation: 0,
            side: BorderSide(
              color: comicTheme(context: context).colorScheme.secondary,
              width: 1.8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.16),
            ),
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
          ),
        ),
      ),
    );
  }
}
```

### sleekTheme


This is another opinionated theme design. You can simply apply it in your theme setting.


### flatTheme

This is the flat theme that do more on flat style design. By default, flat theme has no border. It is supposed to draw the boundary with background. But if you want, you can override the theme and add your own border.






### themeDataBigElevatedButton

This is a function that returns a theme data to make the ElevatedButton wide and big.

### themeDataElevatedButtonToListTile

This is a function that returns a theme data to make the ElevatedButton look like to ListTile.



## Customizing existing theme

There may be many ways of customizing themes. Below may be one of the way of customing the theme.


```dart
sliverTextTheme({required BuildContext context}) => TextTheme(
      bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 19,
            fontWeight: FontWeight.w300,
          ),
      bodyMedium: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w300,
          ),
      bodySmall: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
      labelLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
      labelMedium: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
      labelSmall: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
    );
MaterialApp(
    theme: comicTheme(context: context).copyWith(
        textTheme: sliverTextTheme(context: context),
    ),
```

There might be times that you may wonder how to apply color(s) while theming in MaterialApp. You can apply your own color scheme like below.


```dart
final colorScheme = ColorScheme.fromSeed(seedColor: Colors.green);
@override
Widget build(BuildContext context) {
return MaterialApp.router(
    theme: comicTheme(context: context, colorScheme: colorScheme).copyWith(
    tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
            labelColor: colorScheme.primary, // <-- Here. Don't use Theme.of(context).colorScheme.primary
        ),
    ),
);
}
```