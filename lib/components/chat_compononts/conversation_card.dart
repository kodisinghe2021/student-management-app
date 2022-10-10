import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/components/chat_compononts/cus_text.dart';
import 'package:proacadamy_student_management_app/components/custom_images.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0 / 5),
            blurRadius: 15,
            color: Colors.black54.withOpacity(0.3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: kWhite.withOpacity(0.9),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: NetworkCicularImage(
                    imageUrl: 'https://picsum.photos/id/27/40/40',
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    NormalText(
                      text: 'Jhone Carter',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    NormalText(
                      text: 'Hi. dear how are you...',
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: NormalText(
                text: '1 minutes ago',
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
