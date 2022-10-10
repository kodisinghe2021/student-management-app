import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/components/chat_compononts/background_image.dart';
import 'package:proacadamy_student_management_app/components/chat_compononts/conversation_card.dart';
import 'package:proacadamy_student_management_app/components/custom_images.dart';
import 'package:proacadamy_student_management_app/components/custom_text.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const CustomHeadingText(text: 'Chat List', fontSize: 30),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CustomNetworkImage(
                  imageUrl: 'https://picsum.photos/id/27/40/40',
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Stack(
          fit: StackFit.loose,
          children: [
            const BackGroundImage(),
            SizedBox(
              width: getScreenSize(context).width,
              height: getScreenSize(context).height,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return const ConversationCard();
                },
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
