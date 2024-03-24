import 'package:flutter/material.dart';
import 'package:travel_app/settings/colors.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.author, required this.comment});

  final String author;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 5,
      shadowColor: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: secondaryColor,
                          )
                        ]),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: white,
                    )),
                const SizedBox(width: 10),
                Text(
                  author,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(comment, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
