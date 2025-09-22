import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Widget? icon;
  final List<Widget> children;
  final Color? color;

  const CustomCard({
    super.key,
    required this.title,
    this.icon,
    this.children = const [],
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Padding(
        padding: EdgeInsetsGeometry.all(12),

        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,

          children: <Widget>[
            if (icon != null) Container(child: icon),

            Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ...children,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
