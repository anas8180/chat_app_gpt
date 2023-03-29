
enum ChatMessageType { user, bot }

class ChatMessage {
  final String text;
  final ChatMessageType chatMessageType;

  ChatMessage(this.text, this.chatMessageType);
}
