import 'package:flutter/material.dart';

/// ElevatedButton 을 넓고 높게 만들기
ThemeData themeDataBigElevatedButton(BuildContext context) {
  return Theme.of(context).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 52),
            ),
          ),
    ),
  );
}

/// ElevatedButton 을 ListTile 처럼 만들기
ThemeData themeDataElevatedButtonToListTile(BuildContext context) {
  return Theme.of(context).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        ///
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),

        /// 넓이를 꽉 채우기
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 54),
        ),

        /// 내부 여백 지정
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16),
        ),

        /// 탭하면 (액티브) 바탕색 색깔을 엷은 회색으로 변경.
        /// overlayColor 로 변경함.
        overlayColor: MaterialStateProperty.all(Colors.grey[300]),

        /// 글자를 왼쪽으로 넣기
        alignment: Alignment.centerLeft,

        /// 테두리 없애기
        elevation: MaterialStateProperty.all(0),

        /// 글자 크기. 색깔은 여기서 안됨.
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16),
        ),

        /// 글자 색깔
        foregroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
      ),
    ),
  );
}
