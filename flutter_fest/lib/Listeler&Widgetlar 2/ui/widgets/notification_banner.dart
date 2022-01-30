import 'package:flutter/material.dart';

class NotificationBanner extends StatelessWidget {
  final String bannerText;
  const NotificationBanner({Key? key, required this.bannerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 50,
        color: Colors.green,
        child: Center(
          child: Text(bannerText),
        ),
      ),
    );
  }
}
